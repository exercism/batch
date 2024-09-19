@echo off
setlocal EnableDelayedExpansion

set "input=%~1"

if %input% LSS 1 (
    echo square must be between 1 and 31
    exit /b 1
)

if %input% GTR 31 (
    echo square must be between 1 and 31
    exit /b 1
)

set /a "grains=1"
for /l %%i in (2,1,%input%) do (
    set /a "grains*=2"
)

echo %grains%
