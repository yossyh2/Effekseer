﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Effekseer.Data
{
	public class OptionValues
	{
		[Name(language = Language.Japanese, value = "グリッド色")]
		[Description(language = Language.Japanese, value = "グリッド色")]
		[Undo(Undo = false)]
		public Value.Color GridColor
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "グリッドの表示")]
		[Description(language = Language.Japanese, value = "グリッドの表示非表示")]
		[Undo(Undo = false)]
		public Value.Boolean IsGridShown
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "XYグリッドの表示")]
		[Description(language = Language.Japanese, value = "XYグリッドの表示非表示")]
		[Undo(Undo = false)]
		public Value.Boolean IsXYGridShown
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "XZグリッドの表示")]
		[Description(language = Language.Japanese, value = "XZグリッドの表示非表示")]
		[Undo(Undo = false)]
		public Value.Boolean IsXZGridShown
		{
			get;
			private set;
		}


		[Name(language = Language.Japanese, value = "YZグリッドの表示")]
		[Description(language = Language.Japanese, value = "YZグリッドの表示非表示")]
		[Undo(Undo = false)]
		public Value.Boolean IsYZGridShown
		{
			get;
			private set;
		}


		[Name(language = Language.Japanese, value = "グリッドサイズ")]
		[Description(language = Language.Japanese, value = "表示しているグリッドの幅")]
		[Undo(Undo = false)]
		public Value.Float GridLength
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "ライト方向")]
		[Description(language = Language.Japanese, value = "ディレクショナルライトの向き")]
		[Undo(Undo = false)]
		public Value.Vector3D LightDirection
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "ライト色")]
		[Description(language = Language.Japanese, value = "ライトのディフュージョン色")]
		[Undo(Undo = false)]
		public Value.Color LightColor
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "アンビエント色")]
		[Description(language = Language.Japanese, value = "ライトのアンビエント色")]
		[Undo(Undo = false)]
		public Value.Color LightAmbientColor
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "出力時の拡大率")]
		[Description(language = Language.Japanese, value = "出力時の拡大率")]
		[Undo(Undo = false)]
		public Value.Float Magnification
		{
			get;
			private set;
		}


		[Name(language = Language.Japanese, value = "出力FPS")]
		[Description(language = Language.Japanese, value = "出力FPS")]
		[Undo(Undo = false)]
		public Value.Enum<FPSType> FPS
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "座標系")]
		[Description(language = Language.Japanese, value = "座標系")]
		[Undo(Undo = false)]
		public Value.Enum<CoordinateType> Coordinate
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "背景色")]
		[Description(language = Language.Japanese, value = "背景色")]
		[Undo(Undo = false)]
		public Value.Color BackgroundColor
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "背景画像")]
		[Description(language = Language.Japanese, value = "背景画像")]
		[Undo(Undo = false)]
		public Value.PathForImage BackgroundImage
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "マウスの回転方向(X)")]
		[Description(language = Language.Japanese, value = "マウスの回転方向を逆にする。")]
		[Undo(Undo = false)]
		public Value.Boolean MouseRotInvX
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "マウスの回転方向(Y)")]
		[Description(language = Language.Japanese, value = "マウスの回転方向を逆にする。")]
		[Undo(Undo = false)]
		public Value.Boolean MouseRotInvY
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "マウスのスライド方向(X)")]
		[Description(language = Language.Japanese, value = "マウスのスライド方向を逆にする。")]
		[Undo(Undo = false)]
		public Value.Boolean MouseSlideInvX
		{
			get;
			private set;
		}

		[Name(language = Language.Japanese, value = "マウスのスライド方向(Y)")]
		[Description(language = Language.Japanese, value = "マウスのスライド方向を逆にする。")]
		[Undo(Undo = false)]
		public Value.Boolean MouseSlideInvY
		{
			get;
			private set;
		}

		public OptionValues()
		{
			BackgroundColor = new Value.Color(0, 0, 0, 255);
			BackgroundImage = new Value.PathForImage("画像ファイル (*.png)|*.png", false, "");
			GridColor = new Value.Color(255, 255, 255, 255);
			
			IsGridShown = new Value.Boolean(true);
			IsXYGridShown = new Value.Boolean(false);
			IsXZGridShown = new Value.Boolean(true);
			IsYZGridShown = new Value.Boolean(false);

			GridLength = new Value.Float(2, float.MaxValue, 0.1f);
			LightDirection = new Value.Vector3D(1, 1, 1, 1, -1, 1, -1, 1, -1, 0.1f, 0.1f, 0.1f);
			LightColor = new Value.Color(215, 215, 215, 255);
			LightAmbientColor = new Value.Color(40, 40, 40, 255);
			Magnification = new Value.Float(1, float.MaxValue, 0.00001f);
			FPS = new Value.Enum<FPSType>(FPSType._60FPS);
			Coordinate = new Value.Enum<CoordinateType>(CoordinateType.Right);

			MouseRotInvX = new Value.Boolean(false);
			MouseRotInvY = new Value.Boolean(false);
			MouseSlideInvX = new Value.Boolean(false);
			MouseSlideInvY = new Value.Boolean(false);
		}

		public enum FPSType : int
		{
			[Name(value = "60FPS", language = Language.Japanese)]
			_60FPS = 1,
			[Name(value = "30FPS", language = Language.Japanese)]
			_30FPS = 2,
			[Name(value = "20FPS", language = Language.Japanese)]
			_20FPS = 3,
			[Name(value = "15FPS", language = Language.Japanese)]
			_15FPS = 4,
		}

		public enum CoordinateType : int
		{
			[Name(value = "右手系", language = Language.Japanese)]
			Right = 0,
			[Name(value = "左手系", language = Language.Japanese)]
			Left = 1,
		}
	}
}
