@echo off
setlocal enabledelayedexpansion

set "hours=%~1"
set "minutes=%~2"

set /a minutesDivisor=60
set /a HoursDivisor=24

REM Your code goes here


echo %hours%:%minutes%
