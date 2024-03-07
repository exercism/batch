@echo off
setlocal enabledelayedexpansion

call :getLength "%~1" len[1]
call :getLength "%~2" len[2]

if "%len[1]%" NEQ "%len[2]%" (
	if "%len[1]%" EQU "0" (
		echo left strand must not be empty
		exit /b 1
	)
	if "%len[2]%" EQU "0" (
		echo right strand must not be empty
		exit /b 1
	)
	echo left and right strands must be of equal length
	exit /b 1
)

set "string[1]=%~1"
set "string[2]=%~2"
set /a distance=0
for /L %%A in (0,1,%len[1]%) do (
	if not "!string[1]:~%%A,1!"=="!string[2]:~%%A,1!" (
		set /a distance+=1
	)
)
echo !distance!

exit /b

:getLength
setlocal EnableDelayedExpansion
set "s=#%~1"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if "!s:~%%N,1!" neq "" (
		set /a "len+=%%N"
		set "s=!s:~%%N!"
	)
)
endlocal&if "%~2" neq "" (set %~2=%len%) else echo %len%
exit /b
