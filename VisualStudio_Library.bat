@echo off

setlocal ENABLEDELAYEDEXPANSION

set RDIR_LIB_BASE=%RDIR_R%\Compiled\lib\

rem for Parallel build
set CPUCount=4

rem if x64 build then 1
set PlatformMax=0


set PlatformToolsetMax=0

set PlatformToolsetArray[0]=v120
set GeneratorPlatformArray[0]=Visual Studio 12

set PlatformToolsetArray[1]=v120_xp
set GeneratorPlatformArray[1]=Visual Studio 12

set PlatformToolsetArray[2]=v110
set GeneratorPlatformArray[2]=Visual Studio 11

set PlatformToolsetArray[3]=v110_xp
set GeneratorPlatformArray[3]=Visual Studio 11

set PlatformShortNameArray[0]=x86
set PlatformShortNameArray[1]=x64

set PlatformNameArray[0]=Win32
set PlatformNameArray[1]=x64

set GeneratorPlatformSuffixArray[0]=
set GeneratorPlatformSuffixArray[1]= Win64


set ConfigurationMax=1

set ConfigurationNameArray[0]=Debug
set ConfigurationNameArray[1]=Release

set ConfigurationSuffixArray[0]=MTd
set ConfigurationSuffixArray[1]=MT


for /L %%k in (0,1,%PlatformToolsetMax%) do (
set PlatformToolset=!PlatformToolsetArray[%%k]!
set GeneratorPlatformName=!GeneratorPlatformArray[%%k]!

if EXIST !PlatformToolset! (
rmdir /S /Q !PlatformToolset!
)

mkdir !PlatformToolset!
cd !PlatformToolset!

for /L %%i in (0,1,%PlatformMax%) do (
set PlatformShortName=!PlatformShortNameArray[%%i]!
set PlatformName=!PlatformNameArray[%%i]!
set GeneratorPlatformSuffix=!GeneratorPlatformSuffixArray[%%i]!

mkdir !PlatformShortName!
cd !PlatformShortName!

set GeneratorPlatform=!GeneratorPlatformName!!GeneratorPlatformSuffix!

echo Compile !PlatformToolset! !PlatformShortName!

cmake -G "!GeneratorPlatform!" -T !PlatformToolset! -D USE_MSVC_RUNTIME_LIBRARY_DLL:BOOL=OFF -D CMAKE_INCLUDE_PATH="D:\lltcggie\Documents\Visual Studio 2013\Projects\Effekseer\Microsoft DirectX SDK (June 2010)\Include" ../../Dev/Cpp/

for /L %%l in (0,1,%ConfigurationMax%) do (
set ConfigurationName=!ConfigurationNameArray[%%l]!

call ../../setenv.bat !PlatformShortName! !PlatformToolset! !ConfigurationName!

msbuild Effekseer.sln /p:configuration=!ConfigurationName! /p:PlatformToolset=!PlatformToolset! /p:Platform=!PlatformName! /maxcpucount:%CPUCount%
)

cd ..
)

cd ..
)

for /L %%k in (0,1,%PlatformToolsetMax%) do (
set PlatformToolset=!PlatformToolsetArray[%%k]!

set LibInstallDir=%RDIR_LIB_BASE%!PlatformToolset!\

mkdir !LibInstallDir!

for /L %%i in (0,1,%PlatformMax%) do (
set PlatformShortName=!PlatformShortNameArray[%%i]!

set LibPlatformInstallDir=!LibInstallDir!!PlatformShortName!\

mkdir !LibPlatformInstallDir!

for /L %%l in (0,1,%ConfigurationMax%) do (
set ConfigurationName=!ConfigurationNameArray[%%l]!
set ConfigurationSuffix=!ConfigurationSuffixArray[%%l]!

set BuildDir=!PlatformToolset!\!PlatformShortName!\!ConfigurationName!

robocopy "!BuildDir!" "!LibPlatformInstallDir!!ConfigurationName!" *.lib /mir /S

)

)

)

endlocal
