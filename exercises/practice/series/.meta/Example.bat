@echo off
setlocal EnableDelayedExpansion

set "series=%~1"
set "sliceLength=%~2"
set "result="

call :getLength "%series%" seriesLen

if %sliceLength% GTR %seriesLen% (
	echo slice length cannot be greater than series length
	exit /b
)

if %sliceLength% EQU 0 (
	echo slice length cannot be zero
	exit /b
)

if %sliceLength% LSS 0 (
	echo slice length cannot be negative
	exit /b
)

if [%series%] EQU [] (
	echo series cannot be empty
	exit /b
)

for /l %%x in (0, 1, %seriesLen%) do (
	set "variation=!series:~%%x,%sliceLength%!"
	call :getLength "!variation!" variationLen
	if !variationLen! EQU !sliceLength! (
		set result=!result! !variation!
	)
)
echo !result:~1!
exit /b

:getLength
set "s=#%~1"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if "!s:~%%N,1!" neq "" (
		set /a "len+=%%N"
		set "s=!s:~%%N!"
	)
)
if "%~2" neq "" (set %~2=%len%) else echo %len%
exit /b
