@setlocal EnableDelayedExpansion EnableExtensions
@for %%i in (a:\_packer_config*.cmd) do @call "%%~i"
@if defined PACKER_DEBUG (@echo on) else (@echo off)

title Downloading and running SysInternals' SDelete to optimize the empty space of the image.  Please wait...

if not exist "%SystemRoot%\_download.cmd" (
    echo ==^> ERROR: Unable to download SysInternals' SDelete due to missing download tool
    goto :exit1
)

if not defined SDELETE_URL set SDELETE_URL=http://web.archive.org/web/20160404120859if_/http://live.sysinternals.com/sdelete.exe

for %%i in ("%SDELETE_URL%") do set SDELETE_EXE=%%~nxi
set SDELETE_DIR=%TEMP%\sdelete
set SDELETE_PATH=%SDELETE_DIR%\%SDELETE_EXE%

echo ==^> Creating "%SDELETE_DIR%"
mkdir "%SDELETE_DIR%"
pushd "%SDELETE_DIR%"

call "%SystemRoot%\_download.cmd" "%SDELETE_URL%" "%SDELETE_PATH%"
if errorlevel 1 (
  echo ==^> ERROR: Unable to download file from %SDELETE_URL%
  goto exit1
)

if not exist "%SDELETE_PATH%" goto exit1

reg add HKCU\Software\Sysinternals\SDelete /v EulaAccepted /t REG_DWORD /d 1 /f

echo ==^> Running SDelete on %SystemDrive%
"%SDELETE_PATH%" -z %SystemDrive%

@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: "%SDELETE_PATH%" -z %SystemDrive%
ver>nul

popd

echo ==^> Removing "%SDELETE_DIR%"
rmdir /q /s "%SDELETE_DIR%"

:exit0

@ping 127.0.0.1
@ver>nul

@goto :exit

:exit1

@ping 127.0.0.1
@verify other 2>nul

:exit

@echo ==^> Script exiting with errorlevel %ERRORLEVEL%
@exit /b %ERRORLEVEL%
