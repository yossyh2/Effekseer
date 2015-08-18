setlocal

SET RDIR=Effekseer100
SET RDIR_R=EffekseerRuntime100
SET RDIR_U=EffekseerForUnity100

rmdir %RDIR%
mkdir %RDIR%

rmdir %RDIR_R%
mkdir %RDIR_R%

rmdir %RDIR_U%
mkdir %RDIR_U%


echo �A�v���P�[�V�����R�s�[
mkdir %RDIR%\Tool
copy Dev\release\Effekseer.exe %RDIR%\Tool\.
copy Dev\release\Effekseer.exe.config %RDIR%\Tool\.
copy Dev\release\EffekseerCore.dll %RDIR%\Tool\.
copy Dev\release\EffekseerInterface.dll %RDIR%\Tool\.
copy Dev\release\EffekseerViewer.dll %RDIR%\Tool\.
copy Dev\release\IronPython.dll %RDIR%\Tool\.
copy Dev\release\IronPython.Modules.dll %RDIR%\Tool\.
copy Dev\release\Microsoft.Dynamic.dll %RDIR%\Tool\.
copy Dev\release\Microsoft.Scripting.dll %RDIR%\Tool\.
copy Dev\release\Viewer.dll %RDIR%\Tool\.
copy Dev\release\WeifenLuo.WinFormsUI.Docking.dll %RDIR%\Tool\.
copy Dev\release\System.Reactive.Core.dll %RDIR%\Tool\.
copy Dev\release\System.Reactive.Interfaces.dll %RDIR%\Tool\.
copy Dev\release\System.Reactive.Linq.dll %RDIR%\Tool\.

mkdir %RDIR%\Tool\scripts
mkdir %RDIR%\Tool\scripts\export
copy Dev\release\scripts\export\Default.cs %RDIR%\Tool\scripts\export\.

echo �����^�C���R�s�[
mkdir %RDIR_R%\RuntimeSample\
mkdir %RDIR_R%\RuntimeSample\lib
mkdir %RDIR_R%\RuntimeSample\include

mkdir %RDIR_R%\src
mkdir %RDIR_R%\src\include
mkdir %RDIR_R%\src\lib

copy Dev\Cpp\Effekseer\Effekseer.h %RDIR_R%\src\include\.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX9.h %RDIR_R%\src\include\.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX11.h %RDIR_R%\src\include\.
copy Dev\Cpp\EffekseerRendererGL\EffekseerRendererGL.h %RDIR_R%\src\include\.
copy Dev\Cpp\EffekseerSoundXAudio2\EffekseerSoundXAudio2.h %RDIR_R%\src\include\.
copy Dev\Cpp\EffekseerSoundAL\EffekseerSoundAL.h %RDIR_R%\src\include\.

copy Dev\Cpp\EffekseerRendererDX9.sln %RDIR_R%\src\.
copy Dev\Cpp\EffekseerRendererDX11.sln %RDIR_R%\src\.
copy Dev\Cpp\EffekseerRendererGL.sln %RDIR_R%\src\.

mkdir %RDIR_R%\src\Effekseer
robocopy Dev\Cpp\Effekseer %RDIR_R%\src\Effekseer *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerRendererDX9
robocopy Dev\Cpp\EffekseerRendererDX9 %RDIR_R%\src\EffekseerRendererDX9 *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerRendererDX11
robocopy Dev\Cpp\EffekseerRendererDX11 %RDIR_R%\src\EffekseerRendererDX11 *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerRendererGL
robocopy Dev\Cpp\EffekseerRendererGL %RDIR_R%\src\EffekseerRendererGL *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerRendererCommon
robocopy Dev\Cpp\EffekseerRendererCommon %RDIR_R%\src\EffekseerRendererCommon *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerSoundXAudio2
robocopy Dev\Cpp\EffekseerSoundXAudio2 %RDIR_R%\src\EffekseerSoundXAudio2 *.h *.cpp *.filters *.vcxproj *.fx /mir /S

mkdir %RDIR_R%\src\EffekseerSoundAL
robocopy Dev\Cpp\EffekseerSoundAL %RDIR_R%\src\EffekseerSoundAL *.h *.cpp *.filters *.vcxproj *.fx /mir /S


echo �����^�C���g�ݍ��݃T���v��
robocopy Release\RuntimeSample %RDIR_R%\RuntimeSample\ *.h *.cpp *.filters *.vcxproj *.fx *.efk *.wav *.png *.sln /mir /S
rmdir %RDIR_R%\RuntimeSample\include /S /Q
rmdir %RDIR_R%\RuntimeSample\lib /S /Q

mkdir %RDIR_R%\RuntimeSample\include
mkdir %RDIR_R%\RuntimeSample\lib

copy Dev\Cpp\Effekseer\Effekseer.h %RDIR_R%\RuntimeSample\include\.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX9.h %RDIR_R%\RuntimeSample\include\.
copy Dev\Cpp\EffekseerRendererDX11\EffekseerRendererDX11.h %RDIR_R%\RuntimeSample\include\.
copy Dev\Cpp\EffekseerRendererGL\EffekseerRendererGL.h %RDIR_R%\RuntimeSample\include\.
copy Dev\Cpp\EffekseerSoundXAudio2\EffekseerSoundXAudio2.h %RDIR_R%\RuntimeSample\include\.
copy Dev\Cpp\EffekseerSoundAL\EffekseerSoundAL.h %RDIR_R%\RuntimeSample\include\.

copy Dev\Cpp\lib\Effekseer.Debug.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererDX9.Debug.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererDX11.Debug.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererGL.Debug.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerSoundXAudio2.Debug.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerSoundAL.Debug.lib %RDIR_R%\RuntimeSample\lib\.

copy Dev\Cpp\lib\Effekseer.Release.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererDX9.Release.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererDX11.Release.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerRendererGL.Release.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerSoundXAudio2.Release.lib %RDIR_R%\RuntimeSample\lib\.
copy Dev\Cpp\lib\EffekseerSoundAL.Release.lib %RDIR_R%\RuntimeSample\lib\.

copy Dev\Cpp\CMakeLists.txt %RDIR_R%\src\.

echo �T���v��

mkdir %RDIR%\Sample
robocopy Release\Sample %RDIR%\Sample *.efkproj *.efkmodel *.txt *.png /mir /S

echo ���C�Z���X
cp Release/LICENSE.txt %RDIR_R%/LICENSE.txt
cp Release/LICENSE.txt %RDIR_U%/LICENSE.txt

echo Readme
copy readme_tool.txt %RDIR%\readme.txt
copy readme_runtime.txt %RDIR_R%\readme.txt
copy readme_unity.txt %RDIR_U%\readme.txt

echo �w���v
mkdir %RDIR%\Help
robocopy Release\Help_Tool %RDIR%\Help *.html *.css *.efkproj *.png /mir /S

mkdir %RDIR_R%\Help
robocopy Release\Help_Runtime %RDIR_R%\Help *.html *.css *.efkproj *.png /mir /S

mkdir %RDIR_U%\Help
robocopy Release\Help_Unity %RDIR_U%\Help *.html *.css *.efkproj *.png /mir /S

echo �c�[��
mkdir %RDIR%\Tool
copy Release\Tool\mqoToEffekseerModelConverter.exe %RDIR%\Tool\.

echo Unity
mkdir %RDIR_U%\GameEngine
robocopy Release\GameEngine %RDIR_U%\GameEngine *.unitypackage *.zip /mir /S

echo doxygen
doxygen doxygen.template
mkdir %RDIR_R%\Help\html\doxygen
robocopy html %RDIR_R%\Help\html\doxygen /mir /S

echo VS

mkdir %RDIR_R%\Compiled\
mkdir %RDIR_R%\Compiled\include\
mkdir %RDIR_R%\Compiled\lib\

call VisualStudio_Library.bat

copy Dev\Cpp\Effekseer\Effekseer.h %RDIR_R%\Compiled\\include\.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX9.h %RDIR_R%\Compiled\\include\.
copy Dev\Cpp\EffekseerRendererDX11\EffekseerRendererDX11.h %RDIR_R%\Compiled\include\.
copy Dev\Cpp\EffekseerRendererGL\EffekseerRendererGL.h %RDIR_R%\Compiled\\include\.
copy Dev\Cpp\EffekseerSoundXAudio2\EffekseerSoundXAudio2.h %RDIR_R%\Compiled\\include\.
copy Dev\Cpp\EffekseerSoundAL\EffekseerSoundAL.h %RDIR_R%\Compiled\\include\.

endlocal

pause
