﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WeifenLuo.WinFormsUI.Docking;

namespace Effekseer.GUI
{
	partial class MainForm : Form
	{
		public MainForm()
		{
			InitializeComponent();

			// イベント設定
			Core.OnAfterNew += new EventHandler(Core_OnAfterNew);
			Core.OnAfterSave += new EventHandler(Core_OnAfterSave);
			Core.OnAfterLoad += new EventHandler(Core_OnAfterLoad);
			GUIManager.OnChangeRecentFiles += new EventHandler(GUIManager_OnChangeRecentFiles);

			recentFiles = new ToolStripMenuItem();
			recentFiles.Text = "最近使用したファイル";
		}

		public DockPanel Panel
		{
			get
			{
				return dockPanel;
			}
		}

		/// <summary>
		/// 最近使用したファイル
		/// </summary>
		ToolStripMenuItem recentFiles = null;

		public void UpdateForm()
		{
			ReloadTitle();
		}

		void ReloadRecentFiles()
		{
			recentFiles.DropDownItems.Clear();

			var rf = GUIManager.GetRecentFiles();

			foreach (var f in rf)
			{
				var item = new ToolStripMenuItem();
				var file = f;
				item.Text = file;
				item.Click += (object _sender, EventArgs _e) =>
				{
					Commands.Open(file);
				};
				recentFiles.DropDownItems.Add(item);
			}
		}

		void ReloadTitle()
		{
			var newTitle = "Effekseer Version " + Core.Version + " " + "[" + Core.FullPath + "] ";
			
			if (Core.IsChanged)
			{
				newTitle += " *変更あり";
			}

			if (Text != newTitle)
			{
				Text = newTitle;
			}
		}

		void ReloadMenu()
		{
			
			Func<Action, ToolStripMenuItem> create_menu_item_from_commands = (a) =>
			{
				var item = new ToolStripMenuItem();
				var attributes = a.Method.GetCustomAttributes(false);
				var uniquename = UniqueNameAttribute.GetUniqueName(attributes);
				item.Text = NameAttribute.GetName(attributes);
				item.ShowShortcutKeys = true;
				item.ShortcutKeyDisplayString = Shortcuts.GetShortcutText(uniquename);
				item.Click += (object sender, EventArgs e) =>
				{
					a();
				};

				return item;
			};

			this.menuStrip.SuspendLayout();
			this.SuspendLayout();

			{
				var menu = new ToolStripMenuItem("ファイル");
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.New));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Open));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Overwrite));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.SaveAs));

				menu.DropDownItems.Add(new ToolStripSeparator());
				{
					var import_menu = new ToolStripMenuItem("入力");

					for (int c = 0; c < Core.ImportScripts.Count; c++)
					{
						var item = new ToolStripMenuItem();
						var script = Core.ImportScripts[c];
						item.Text = script.Title;
						item.Click += (object _sender, EventArgs _e) =>
						{
							OpenFileDialog ofd = new OpenFileDialog();

							ofd.InitialDirectory = System.IO.Directory.GetCurrentDirectory();
							ofd.Filter = script.Filter;
							ofd.FilterIndex = 2;
							ofd.Multiselect = false;

							if (ofd.ShowDialog() == DialogResult.OK)
							{
								var filepath = ofd.FileName;
								script.Function(filepath);

								System.IO.Directory.SetCurrentDirectory(System.IO.Path.GetDirectoryName(filepath));
							}
							else
							{
								return;
							}
						};
						import_menu.DropDownItems.Add(item);
					}

					menu.DropDownItems.Add(import_menu);
				}

				{
					var export_menu = new ToolStripMenuItem("出力");

					for (int c = 0; c < Core.ExportScripts.Count; c++)
					{
						var item = new ToolStripMenuItem();
						var script = Core.ExportScripts[c];
						item.Text = script.Title;
						item.Click += (object _sender, EventArgs _e) =>
						{
							SaveFileDialog ofd = new SaveFileDialog();

							ofd.InitialDirectory = System.IO.Directory.GetCurrentDirectory();
							ofd.Filter = script.Filter;
							ofd.FilterIndex = 2;
							ofd.OverwritePrompt = true;

							if (ofd.ShowDialog() == DialogResult.OK)
							{
								var filepath = ofd.FileName;
								script.Function(filepath);

								System.IO.Directory.SetCurrentDirectory(System.IO.Path.GetDirectoryName(filepath));
							}
							else
							{
								return;
							}
						};
						export_menu.DropDownItems.Add(item);
					}

					menu.DropDownItems.Add(export_menu);
				}
				menu.DropDownItems.Add(new ToolStripSeparator());
				{
					ReloadRecentFiles();
					menu.DropDownItems.Add(recentFiles);
				}
				menu.DropDownItems.Add(new ToolStripSeparator());

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Exit));

				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("編集");

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.AddNode));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.InsertNode));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.RemoveNode));

				menu.DropDownItems.Add(new ToolStripSeparator());

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Copy));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Paste));

				menu.DropDownItems.Add(new ToolStripSeparator());

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Undo));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Redo));
				
				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("表示");

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Play));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Stop));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Pause));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.Step));
				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("全体処理");

				for (int c = 0; c < Core.CommandScripts.Count; c++)
				{
					var command_item = new ToolStripMenuItem();
					var command = Core.CommandScripts[c];
					command_item.Text = command.Title;
					command_item.Click += (object _sender, EventArgs _e) =>
					{
						command.Function();
					};
					menu.DropDownItems.Add(command_item);
				}

				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("選択部処理");
				for (int c = 0; c < Core.SelectedScripts.Count; c++)
				{
					var command_item = new ToolStripMenuItem();
					var command = Core.SelectedScripts[c];
					command_item.Text = command.Title;
					command_item.Click += (object _sender, EventArgs _e) =>
					{
						command.Function(Core.SelectedNode, null);
					};
					menu.DropDownItems.Add(command_item);
				}

				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("ウインドウ");

				{
					var item = new ToolStripMenuItem();
					item.Text = "ウインドウ位置を初期化";
					item.Click += (object sender, EventArgs e) =>
					{
						GUIManager.CloseDockWindow();
						GUIManager.AssignDockWindowIntoDefaultPosition();
					};
					menu.DropDownItems.Add(item);
				}

				Action<string, Type> setDockWindow = (s, t) =>
					{
						var item = new ToolStripMenuItem();
						item.Text = s;
						item.Click += (object sender, EventArgs e) =>
						{
							GUIManager.SelectOrShowWindow(t);
						};
						menu.DropDownItems.Add(item);
					};

				setDockWindow("ノードツリー", typeof(DockNodeTreeView));
				setDockWindow("共通", typeof(DockNodeCommonValues));
				setDockWindow("位置", typeof(DockNodeLocationValues));
				setDockWindow("絶対位置", typeof(DockNodeLocationAbsValues));
				setDockWindow("生成位置", typeof(DockNodeGenerationLocationValues));
				setDockWindow("回転", typeof(DockNodeRotationValues));
				setDockWindow("拡大", typeof(DockNodeScaleValues));
				setDockWindow("描画共通", typeof(DockNodeRendererCommonValues));
                setDockWindow("描画", typeof(DockNodeRendererValues));
                setDockWindow("音", typeof(DockNodeSoundValues));
				setDockWindow("Fカーブ", typeof(DockFCurves));
				setDockWindow("ビュワー操作", typeof(DockViewerController));
				setDockWindow("視点操作", typeof(DockViewPoint));
				setDockWindow("録画", typeof(DockRecorder));
				setDockWindow("オプション", typeof(DockOption));
				setDockWindow("振る舞い", typeof(DockEffectBehavior));
				setDockWindow("ネットワーク", typeof(DockNetwork));

				menuStrip.Items.Add(menu);
			}

			{
				var menu = new ToolStripMenuItem("ヘルプ");
				
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.ViewHelp));
				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.OpenSample));
				
				menu.DropDownItems.Add(new ToolStripSeparator());

				menu.DropDownItems.Add(create_menu_item_from_commands(Commands.About));

				menuStrip.Items.Add(menu);
			}

			this.menuStrip.ResumeLayout(false);
			this.menuStrip.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();
		}

		protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
		{
			bool handle = false;
			Shortcuts.ProcessCmdKey(ref msg, keyData, ref handle);
			if (handle) return true;

			return base.ProcessCmdKey(ref msg, keyData);
		}

		private void MainForm_Load(object sender, EventArgs e)
		{
			ReloadTitle();
			ReloadMenu();
		}

		private void MainForm_Activated(object sender, EventArgs e)
		{
			if (Core.MainForm != null)
			{
				Core.Reload();
			}
		}

		private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
		{
			if (Commands.SaveOnDisposing())
			{

			}
			else
			{
				e.Cancel = true;
				return;
			}

			GUIManager.SaveConfig();
			Shortcuts.SeveShortcuts();
		}

		void Core_OnAfterNew(object sender, EventArgs e)
		{
			ReloadTitle();
		}

		void Core_OnAfterSave(object sender, EventArgs e)
		{
			ReloadTitle();
		}

		void Core_OnAfterLoad(object sender, EventArgs e)
		{
			ReloadTitle();
		}

		void GUIManager_OnChangeRecentFiles(object sender, EventArgs e)
		{
			this.menuStrip.SuspendLayout();
			ReloadRecentFiles();
			this.menuStrip.ResumeLayout();
		}

		public Point BeforeResizeLocation
		{
			get;
			private set;
		}

		public int BeforeResizeWidth
		{
			get;
			private set;
		}

		public int BeforeResizeHeight
		{
			get;
			private set;
		}
 
		private void MainForm_Resize(object sender, EventArgs e)
		{
			// 最大化、最小化前のサイズを保存
			if(this.WindowState != FormWindowState.Maximized && this.WindowState != FormWindowState.Minimized)
			{
				BeforeResizeWidth = this.Width;
				BeforeResizeHeight = this.Height;
			}
		}

		private void MainForm_Move(object sender, EventArgs e)
		{
			// 最大化、最小化前の位置を保存
			if(this.WindowState != FormWindowState.Maximized && this.WindowState != FormWindowState.Minimized)
				BeforeResizeLocation = this.Location;
		}
	}
}
