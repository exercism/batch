@echo off
setlocal enabledelayedexpansion

set /a n=%~1
set /a count=0

:loop
if %n% EQU 0 goto :done
set /a bit=n %% 2
set /a count+=bit
set /a n=n/2
goto :loop

:done
echo %count%
