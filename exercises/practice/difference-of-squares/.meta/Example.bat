@echo off
setlocal enabledelayedexpansion

set "N=%~1"

set /a sum=0
set /a sum_of_squares=0

for /l %%i in (1, 1, %N%) do (
    set /a sum+=%%i
    
    set /a square=%%i*%%i
    set /a sum_of_squares+=!square!
)

set /a square_of_sum=!sum!*!sum!
set /a difference=!square_of_sum!-!sum_of_squares!

echo %difference%
