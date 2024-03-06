@echo off
setlocal enabledelayedexpansion

set "numbers=%1"
set "sum="
call :strLen numbersLen numbers

for /F "delims=" %%G in ('cmd /D /U /C  echo %numbers%^| find /V ""') do (
	SET result=1
	FOR /L %%i IN (1,1,!numbersLen!) DO SET /A result*=%%G
	set /a sum+=!result!
)

if %numbers% equ %sum% (
    echo true
) else (
    echo false
)

REM ********* function *****************************
:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~2!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)
