@echo off

rem %1 PlatformShortName ex. x86
rem %2 PlatformToolset ex. v120
rem %3 ConfigurationName ex. Debug

rem "Add include path"
set INCLUDE=D:\Microsoft DirectX SDK (June 2010)\Include;%INCLUDE%

rem "Add library path"
set LIB=D:\Microsoft DirectX SDK (June 2010)\Lib\%1;%LIB%
