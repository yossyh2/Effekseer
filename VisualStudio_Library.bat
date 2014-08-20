setlocal

call setenv.bat

SET RDIR=Effekseer0610_VS

rmdir /S /Q %RDIR%
mkdir %RDIR%



echo Compile VS10
rmdir /S /Q VS10
mkdir VS10

cd VS10
call cmake.bat -G "Visual Studio 10"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/
cmake.exe -G "Visual Studio 10"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Debug /p:useenv=true
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Release /p:useenv=true
cd ..



echo Compile VS11
rmdir /S /Q VS11
mkdir VS11

cd VS11
call cmake.bat -G "Visual Studio 11"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/
cmake.exe -G "Visual Studio 11"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Debug /p:useenv=true
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Release /p:useenv=true
cd ..



echo Compile VS11_v110_xp
rmdir /S /Q VS11_v110_xp
mkdir VS11_v110_xp

cd VS11_v110_xp
call cmake.bat -G "Visual Studio 12" -T v110_xp -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/
cmake.exe -G "Visual Studio 12" -T v110_xp -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Debug /p:useenv=true
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Release /p:useenv=true
cd ..



echo Compile VS12
rmdir /S /Q VS12
mkdir VS12

cd VS12
call cmake.bat -G "Visual Studio 12"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/
cmake.exe -G "Visual Studio 12"  -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Debug /p:useenv=true
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Release /p:useenv=true
cd ..



echo Compile VS12_v120_xp
rmdir /S /Q VS12_v120_xp
mkdir VS12_v120_xp

cd VS12_v120_xp
call cmake.bat -G "Visual Studio 12" -T v120_xp -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/
cmake.exe -G "Visual Studio 12" -T v120_xp -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../Dev/Cpp/

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Debug /p:useenv=true
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=Release /p:useenv=true
cd ..


mkdir %RDIR%\include\
mkdir %RDIR%\lib\

mkdir %RDIR%\lib\VS2010\
mkdir %RDIR%\lib\VS2012\
mkdir %RDIR%\lib\VS2012_XP\
mkdir %RDIR%\lib\VS2013\
mkdir %RDIR%\lib\VS2013_XP\

robocopy VS10\Debug %RDIR%\lib\VS2010\Debug *.lib /mir /S
robocopy VS10\Release %RDIR%\lib\VS2010\Release *.lib /mir /S

robocopy VS11\Debug %RDIR%\lib\VS2012\Debug *.lib /mir /S
robocopy VS11\Release %RDIR%\lib\VS2012\Release *.lib /mir /S

robocopy VS11_v110_xp\Debug %RDIR%\lib\VS2012_XP\Debug *.lib /mir /S
robocopy VS11_v110_xp\Release %RDIR%\lib\VS2012_XP\Release *.lib /mir /S

robocopy VS12\Debug %RDIR%\lib\VS2013\Debug *.lib /mir /S
robocopy VS12\Release %RDIR%\lib\VS2013\Release *.lib /mir /S

robocopy VS12_v120_xp\Debug %RDIR%\lib\VS2013_XP\Debug *.lib /mir /S
robocopy VS12_v120_xp\Release %RDIR%\lib\VS2013_XP\Release *.lib /mir /S

copy Dev\Cpp\Effekseer\Effekseer.h %RDIR%\include\.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX9.h %RDIR%\include\.
copy Dev\Cpp\EffekseerRendererDX11\EffekseerRendererDX11.h %RDIR%include\.
copy Dev\Cpp\EffekseerRendererGL\EffekseerRendererGL.h %RDIR%\include\.
copy Dev\Cpp\EffekseerSoundXAudio2\EffekseerSoundXAudio2.h %RDIR%\include\.
copy Dev\Cpp\EffekseerSoundAL\EffekseerSoundAL.h %RDIR%\include\.

endlocal

pause