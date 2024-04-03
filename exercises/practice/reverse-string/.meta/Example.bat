@echo off
setlocal enabledelayedexpansion

set "str=%~1"
set "rev="

if not defined str (
    echo.
    exit /b
)

:loop
if defined str (
    set "char=!str:~0,1!"
    set "rev=!char!!rev!"
    set "str=!str:~1!"
    goto loop
)
echo %rev%
exit /b
