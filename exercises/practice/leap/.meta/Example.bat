@echo off
setlocal enabledelayedexpansion

set "year=%~1"

set /a "mod4=%year% %% 4"
set /a "mod100=%year% %% 100"
set /a "mod400=%year% %% 400"

set "result=0"

if %mod4%==0 (
    if %mod100% neq 0 (
        set result=1
    ) else (
        if %mod400%==0 (
            set result=1
        )
    )
)

echo %result%
