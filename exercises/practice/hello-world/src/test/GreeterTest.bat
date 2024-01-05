@echo off
REM ---------------------------------------------------
REM testThatGreeterReturnsTheCorrectGreeting
REM ---------------------------------------------------

REM Initalize result variable
set "result="
set "expected=Hello, World!"
REM Run the program and store the output in the result variable
for /f "delims=" %%a in ('%~1') do set result=%%a

REM Check if the result is correct
if "%result%" == "%expected%" (
    REM If the result is correct, exit with code 0
    echo Test passed
    exit /b 0
) else (
    REM If the result is incorrect, exit with code 1
    echo Expected: %expected%
    echo Actually: %result%
    echo Test failed
    exit /b 1
)