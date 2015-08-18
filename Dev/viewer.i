%module EffekseerNative

%{
#include "dll.h"
%}

//-----------------------------------------------------------------------------------
// stdint.h�̒�`
//-----------------------------------------------------------------------------------
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;

//-----------------------------------------------------------------------------------
// csharp
//-----------------------------------------------------------------------------------
%include "wchar.i"

// �Z�L�����e�B�`�F�b�N���O���č�����
%pragma(csharp) imclassclassmodifiers="
[System.Security.SuppressUnmanagedCodeSecurity]
class"

// csharp void �̒�`
%typemap(ctype) void * "void *"
%typemap(imtype) void * "System.IntPtr"
%typemap(cstype) void * "System.IntPtr"
%typemap(in) void * { $1 = $input; }
%typemap(out) void * { $result = $1; }
%typemap(csin) void * "$csinput"
%typemap(csout) void * { return $imcall; }
%typemap(csvarin) void * { set { $imcall; } }
%typemap(csvarout) void * { get { return $imcall; } } 

//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
%typemap(csclassmodifiers) ViewerParamater "public class"

//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
%include "Cpp/Viewer/dll.h"
