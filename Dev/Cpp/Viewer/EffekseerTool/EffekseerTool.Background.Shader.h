#if 0

//listing of all techniques and passes with embedded asm listings 

technique Texhnique
{
    pass P0
    {
        vertexshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
                vs_2_0
                def c0, 1, 0, 0, 0
                dcl_position v0
                dcl_texcoord v1
                mov oPos.xyz, v0
                mov oPos.w, c0.x
                mov oT0.xy, v1
            
            // approximately 3 instruction slots used
            };

        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
            //
            // Parameters:
            //
            //   sampler2D Smp0;
            //
            //
            // Registers:
            //
            //   Name         Reg   Size
            //   ------------ ----- ----
            //   Smp0         s0       1
            //
            
                ps_2_0
                dcl t0.xy
                dcl_2d s0
                texld r0, t0, s0
                mov oC0, r0
            
            // approximately 2 instruction slots used (1 texture, 1 arithmetic)
            };
    }
}

#endif

const BYTE g_effect[] =
{
      1,   9, 255, 254, 188,   0, 
      0,   0,   0,   0,   0,   0, 
      5,   0,   0,   0,   4,   0, 
      0,   0,  28,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   1,   0,   0,   0, 
      5,   0,   0,   0,  84, 101, 
    120,  48,   0,   0,   0,   0, 
     10,   0,   0,   0,   4,   0, 
      0,   0, 104,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   2,   0,   0,   0, 
      5,   0,   0,   0,   4,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   1,   0,   0,   0, 
    164,   0,   0,   0,   0,   1, 
      0,   0,  64,   0,   0,   0, 
     60,   0,   0,   0,   5,   0, 
      0,   0,  83, 109, 112,  48, 
      0,   0,   0,   0,   3,   0, 
      0,   0,  16,   0,   0,   0, 
      4,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   4,   0, 
      0,   0,  15,   0,   0,   0, 
      4,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   3,   0, 
      0,   0,  80,  48,   0,   0, 
     10,   0,   0,   0,  84, 101, 
    120, 104, 110, 105, 113, 117, 
    101,   0,   0,   0,   2,   0, 
      0,   0,   1,   0,   0,   0, 
      4,   0,   0,   0,   5,   0, 
      0,   0,   4,   0,   0,   0, 
     24,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
     40,   0,   0,   0,  84,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0, 172,   0, 
      0,   0,   0,   0,   0,   0, 
      1,   0,   0,   0, 164,   0, 
      0,   0,   0,   0,   0,   0, 
      2,   0,   0,   0, 146,   0, 
      0,   0,   0,   0,   0,   0, 
    120,   0,   0,   0, 116,   0, 
      0,   0, 147,   0,   0,   0, 
      0,   0,   0,   0, 144,   0, 
      0,   0, 140,   0,   0,   0, 
      1,   0,   0,   0,   3,   0, 
      0,   0,   1,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
    255, 255, 255, 255,   1,   0, 
      0,   0,   0,   0,   0,   0, 
    196,   0,   0,   0,   0,   2, 
    255, 255, 254, 255,  33,   0, 
     67,  84,  65,  66,  28,   0, 
      0,   0,  79,   0,   0,   0, 
      0,   2, 255, 255,   1,   0, 
      0,   0,  28,   0,   0,   0, 
      0,   0,   0,  32,  72,   0, 
      0,   0,  48,   0,   0,   0, 
      3,   0,   0,   0,   1,   0, 
      0,   0,  56,   0,   0,   0, 
      0,   0,   0,   0,  83, 109, 
    112,  48,   0, 171, 171, 171, 
      4,   0,  12,   0,   1,   0, 
      1,   0,   1,   0,   0,   0, 
      0,   0,   0,   0, 112, 115, 
     95,  50,  95,  48,   0,  77, 
    105,  99, 114, 111, 115, 111, 
    102, 116,  32,  40,  82,  41, 
     32,  72,  76,  83,  76,  32, 
     83, 104,  97, 100, 101, 114, 
     32,  67, 111, 109, 112, 105, 
    108, 101, 114,  32,  57,  46, 
     50,  57,  46,  57,  53,  50, 
     46,  51,  49,  49,  49,   0, 
     31,   0,   0,   2,   0,   0, 
      0, 128,   0,   0,   3, 176, 
     31,   0,   0,   2,   0,   0, 
      0, 144,   0,   8,  15, 160, 
     66,   0,   0,   3,   0,   0, 
     15, 128,   0,   0, 228, 176, 
      0,   8, 228, 160,   1,   0, 
      0,   2,   0,   8,  15, 128, 
      0,   0, 228, 128, 255, 255, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0, 255, 255, 
    255, 255,   0,   0,   0,   0, 
      0,   0,   0,   0, 184,   0, 
      0,   0,   0,   2, 254, 255, 
    254, 255,  22,   0,  67,  84, 
     65,  66,  28,   0,   0,   0, 
     35,   0,   0,   0,   0,   2, 
    254, 255,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,  32,  28,   0,   0,   0, 
    118, 115,  95,  50,  95,  48, 
      0,  77, 105,  99, 114, 111, 
    115, 111, 102, 116,  32,  40, 
     82,  41,  32,  72,  76,  83, 
     76,  32,  83, 104,  97, 100, 
    101, 114,  32,  67, 111, 109, 
    112, 105, 108, 101, 114,  32, 
     57,  46,  50,  57,  46,  57, 
     53,  50,  46,  51,  49,  49, 
     49,   0,  81,   0,   0,   5, 
      0,   0,  15, 160,   0,   0, 
    128,  63,   0,   0,   0,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,  31,   0,   0,   2, 
      0,   0,   0, 128,   0,   0, 
     15, 144,  31,   0,   0,   2, 
      5,   0,   0, 128,   1,   0, 
     15, 144,   1,   0,   0,   2, 
      0,   0,   7, 192,   0,   0, 
    228, 144,   1,   0,   0,   2, 
      0,   0,   8, 192,   0,   0, 
      0, 160,   1,   0,   0,   2, 
      0,   0,   3, 224,   1,   0, 
    228, 144, 255, 255,   0,   0, 
    255, 255, 255, 255,   1,   0, 
      0,   0,   0,   0,   0,   0, 
      0,   0,   0,   0,   1,   0, 
      0,   0,   5,   0,   0,   0, 
     84, 101, 120,  48,   0,   0, 
      0,   0
};
