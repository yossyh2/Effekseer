﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Effekseer.Data
{
	public class SoundValues
	{
		[Selector(ID = 0)]
		public Value.Enum<ParamaterType> Type
		{
			get;
			private set;
		}

        [Selected(ID = 0, Value = 0)]
        [IO(Export = true)]
        public NoneParamater None
        {
            get;
            private set;
        }

		[Selected(ID = 0, Value = 1)]
		[IO(Export = true)]
		public SoundParamater Sound
		{
			get;
			private set;
		}

		internal SoundValues()
		{
            Type = new Value.Enum<ParamaterType>(ParamaterType.None);
            None = new NoneParamater();
            Sound = new SoundParamater();
		}

        public class NoneParamater
        {
            internal NoneParamater()
            {
            }
        }

        public class SoundParamater
        {
            [Name(language = Language.Japanese, value = "音データ")]
            [Description(language = Language.Japanese, value = "再生する音のWAVデータ")]
            public Value.PathForSound Wave
            {
                get;
                private set;
            }
            [Name(value = "ボリューム", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "音の大きさ。\n範囲：0.0 ～ 1.0\n0で無音。1で原音の大きさ")]
            public Value.FloatWithRandom Volume
            {
                get;
                private set;
            }
            [Name(value = "ピッチ", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "音の高さ（単位：オクターブ）。\n範囲：-4.0 ～ +4.0\n0.0で原音。+1.0で2倍。-1.0で1/2倍")]
            public Value.FloatWithRandom Pitch
            {
                get;
                private set;
            }

            [Selector(ID = 0)]
            [Name(value = "パンタイプ", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "パンタイプ")]
            public Value.Enum<ParamaterPanType> PanType
            {
                get;
                private set;
            }

            [Selected(ID = 0, Value = 0)]
            [Name(value = "パン", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "音の定位。\n範囲：-1.0 ～ +1.0\n0.0で中央。-1.0で左から。1.0で右から")]
            public Value.FloatWithRandom Pan
            {
                get;
                private set;
            }

            [Selected(ID = 0, Value = 1)]
            [Name(value = "減衰距離", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "距離による減衰開始距離")]
            public Value.Float Distance
            {
                get;
                private set;
            }

            [Name(value = "ディレイ", language = Language.Japanese)]
            [Description(language = Language.Japanese, value = "生成から再生開始までのフレーム数")]
            public Value.IntWithRandom Delay
            {
                get;
                private set;
            }

            internal SoundParamater()
			{
                Wave = new Value.PathForSound("音声ファイル (*.wav)|*.wav", true, "");
                Volume = new Value.FloatWithRandom(1.0f, 1.0f, 0.0f);
                Pitch = new Value.FloatWithRandom(0.0f, 2.0f, -2.0f);
                PanType = new Value.Enum<ParamaterPanType>(ParamaterPanType.Sound2D);
                Pan = new Value.FloatWithRandom(0.0f, 1.0f, -1.0f);
                Distance = new Value.Float(10.0f);
                Delay = new Value.IntWithRandom(0, int.MaxValue, 0);
			}
        }

        public enum ParamaterPanType : int
        {
            [Name(value = "2D", language = Language.Japanese)]
            Sound2D = 0,
            [Name(value = "3D", language = Language.Japanese)]
            Sound3D = 1,
        }

        public enum ParamaterType : int
        {
            [Name(value = "無し", language = Language.Japanese)]
            None = 0,
            [Name(value = "有り", language = Language.Japanese)]
            Use = 1,
        }
	}
}
