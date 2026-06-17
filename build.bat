@echo off
setlocal
set "PROJECT_ROOT=%~dp0"
set "TECTONIC=%PROJECT_ROOT%..\tools\tectonic\tectonic.exe"

pushd "%PROJECT_ROOT%"

if exist "%TECTONIC%" (
  "%TECTONIC%" --keep-logs --keep-intermediates main.tex
) else (
  tectonic --keep-logs --keep-intermediates main.tex
)

set "BUILD_EXIT=%ERRORLEVEL%"
popd
exit /b %BUILD_EXIT%
