@echo off

setlocal ENABLEDELAYEDEXPANSION

SET RDIR=Effekseer0610_VS

set RDIR_INCLUDE=%RDIR%\include\
set RDIR_LIB=%RDIR%\lib\

rem for Parallel build
set CPUCount=4

rem if x64 build then 1
set PlatformMax=0

set PlatformShortNameArray[0]=x86
set PlatformShortNameArray[1]=x64

set GeneratorPlatformSuffixArray[0]=
set GeneratorPlatformSuffixArray[1]= Win64


set ConfigurationMax=1

set ConfigurationNameArray[0]=Debug
set ConfigurationNameArray[1]=Release

set ConfigurationSuffixArray[0]=MTd
set ConfigurationSuffixArray[1]=MT


set PlatformToolsetMax=4

set PlatformToolsetArray[0]=v100
set GeneratorPlatformArray[0]=Visual Studio 10

set PlatformToolsetArray[1]=v110
set GeneratorPlatformArray[1]=Visual Studio 11

set PlatformToolsetArray[2]=v110_xp
set GeneratorPlatformArray[2]=Visual Studio 11

set PlatformToolsetArray[3]=v120
set GeneratorPlatformArray[3]=Visual Studio 12

set PlatformToolsetArray[4]=v120_xp
set GeneratorPlatformArray[4]=Visual Studio 12



for /L %%i in (0,1,%PlatformMax%) do (
set PlatformShortName=!PlatformShortNameArray[%%i]!
set GeneratorPlatformSuffix=!GeneratorPlatformSuffixArray[%%i]!

if EXIST !PlatformShortName! (
rmdir /S /Q !PlatformShortName!
)

mkdir !PlatformShortName!
cd !PlatformShortName!

for /L %%k in (0,1,%PlatformToolsetMax%) do (
set PlatformToolset=!PlatformToolsetArray[%%k]!
set GeneratorPlatformName=!GeneratorPlatformArray[%%k]!

set GeneratorPlatform=!GeneratorPlatformName!!GeneratorPlatformSuffix!

mkdir !PlatformToolset!
cd !PlatformToolset!

echo Compile !PlatformToolset! !PlatformShortName!

call cmake.bat -G "!GeneratorPlatform!" -T !PlatformToolset! -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../../Dev/Cpp/
cmake.exe -G "!GeneratorPlatform!"  -T !PlatformToolset! -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF ../../Dev/Cpp/

for /L %%l in (0,1,%ConfigurationMax%) do (
set ConfigurationName=!ConfigurationNameArray[%%l]!

call setenv.bat !PlatformShortName! !PlatformToolset! !ConfigurationName!

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild" Effekseer.sln /p:configuration=!ConfigurationName! /p:useenv=true /maxcpucount:%CPUCount%
)


cd ..
)

cd ..
)



if EXIST %RDIR% (
rmdir /S /Q %RDIR%
)

mkdir %RDIR%

if EXIST %RDIR_INCLUDE% (
rmdir /S /Q %RDIR_INCLUDE%
)

mkdir %RDIR_INCLUDE%

if EXIST %RDIR_LIB% (
rmdir /S /Q %RDIR_LIB%
)
mkdir %RDIR_LIB%



for /L %%i in (0,1,%PlatformMax%) do (
set PlatformShortName=!PlatformShortNameArray[%%i]!

set LibPlatformInstallDir=%RDIR_LIB%!PlatformShortName!\

mkdir !LibPlatformInstallDir!

for /L %%k in (0,1,%PlatformToolsetMax%) do (
set PlatformToolset=!PlatformToolsetArray[%%k]!

set LibInstallDir=!LibPlatformInstallDir!!PlatformToolset!\

mkdir !LibInstallDir!

for /L %%l in (0,1,%ConfigurationMax%) do (
set ConfigurationName=!ConfigurationNameArray[%%l]!
set ConfigurationSuffix=!ConfigurationSuffixArray[%%l]!

set BuildDir=!PlatformShortName!\!PlatformToolset!\!ConfigurationName!\

for /F %%A in ('dir /b !BuildDir!*.lib') do (
copy "!BuildDir!%%~nxA" "!LibInstallDir!%%~nA!ConfigurationSuffix!%%~xA"
)

)

)

)

copy Dev\Cpp\Effekseer\Effekseer.h %RDIR_INCLUDE%.
copy Dev\Cpp\EffekseerRendererDX9\EffekseerRendererDX9.h %RDIR_INCLUDE%.
copy Dev\Cpp\EffekseerRendererDX11\EffekseerRendererDX11.h %RDIR_INCLUDE%.
copy Dev\Cpp\EffekseerRendererGL\EffekseerRendererGL.h %RDIR_INCLUDE%.
copy Dev\Cpp\EffekseerSoundXAudio2\EffekseerSoundXAudio2.h %RDIR_INCLUDE%.
copy Dev\Cpp\EffekseerSoundAL\EffekseerSoundAL.h %RDIR_INCLUDE%.

endlocal

pause