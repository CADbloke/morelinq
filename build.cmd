@echo off
setlocal
cd "%~dp0"
set MSBUILDEXE=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe
if not exist "%MSBUILDEXE%" (
    echo The .NET Framework 4.0 does not appear to be installed on this 
    echo machine, which is required to build the solution.
    exit /b 1
)
if "%1"=="docs" call :docs %2 %3 %4 %5 %6 %7 %8 %9 & goto :EOF

:base
for %%i in (debug release) do "%MSBUILDEXE%" "MoreLinq.sln" /v:m /p:Configuration=%%i %*
goto :EOF

:docs
call :base
"%MSBUILDEXE%" MoreLinq.shfbproj %*
goto :EOF
