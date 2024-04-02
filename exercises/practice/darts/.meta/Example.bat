@echo off
setlocal enabledelayedexpansion

set "x=%~1"
set "y=%~2"
set "result="

set "Sqrt(N)=( x=(N)/(11*1024)+40, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2 )"

set /a p=x * x + y * y
set /a "dart_location=!sqrt(n):n=%p%!

if %dart_location% LEQ 1 (
    set result=10
) else if %dart_location% LEQ 5 (
    set result=5
) else if %dart_location% LSS 10 (
    set result=1
) else (
    set result=0
)

echo %result%
