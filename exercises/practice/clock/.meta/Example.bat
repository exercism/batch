@echo off
setlocal enabledelayedexpansion

set "hours=%~1"
set "minutes=%~2"

set /a minutesDivisor=60
set /a HoursDivisor=24

if %minutes% LSS 0 (
	set minutes=%minutes:~1%
	set /a quotient=!minutes! / minutesDivisor
	set /a modulo=!minutes! %% minutesDivisor
	set /a hours-=quotient+1
    if !modulo! EQU 0 (
        set "modulo=!minutesDivisor!"
        set /a hours+=1
    ) 
	set /a "minutes=minutesDivisor - !modulo!"
) else (
	set /a quotient=minutes / minutesDivisor
	set /a modulo=minutes %% minutesDivisor
	set /a hours+=quotient
	set "minutes=!modulo!"
)

if %hours% LSS 0 (
	set hours=%hours:~1%
	set /a hoursModulo=hours %% HoursDivisor
	set /a "hours=HoursDivisor - hoursModulo"
) else (
	set /a hoursModulo=hours %% HoursDivisor
	set "hours=!hoursModulo!"
)

if !minutes! lss 10 (
    set minutes=0%minutes%
)

if !hours! lss 10 (
    set hours=0%hours%
)

echo %hours%:%minutes%
