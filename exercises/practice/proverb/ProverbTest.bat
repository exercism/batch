@echo off
setlocal enabledelayedexpansion
REM ---------------------------------------------------
REM Proverb Unit Testing
REM 
REM sUnit Testing Framework version: 0.3
REM ---------------------------------------------------

set "successCount=0"
set "failCount=0"

:Main
    REM Initalize result variable
    set "slug=Proverb"

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/proverb/canonical-data.json
    REM --------------------
    set "expected="
    set "if_success=Test passed"
    set "if_failed=Test failed: zero pieces"
    CALL :Assert ""

    set "expected=And all for the want of a nail."
    set "if_success=Test passed"
    set "if_failed=Test failed: one pieces"
    CALL :Assert "nail"

    set "expected=For want of a nail the shoe was lost.\nAnd all for the want of a nail."
    set "if_success=Test passed"
    set "if_failed=Test failed: one pieces"
    CALL :Assert "nail shoe"

    set "expected=For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nAnd all for the want of a nail."
    set "if_success=Test passed"
    set "if_failed=Test failed: one pieces"
    CALL :Assert "nail shoe horse"

    set "expected=For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a nail."
    set "if_success=Test passed"
    set "if_failed=Test failed: one pieces"
    CALL :Assert "nail shoe horse rider message battle kingdom"

    set "expected=For want of a pin the gun was lost.\nFor want of a gun the soldier was lost.\nFor want of a soldier the battle was lost.\nAnd all for the want of a pin."
    set "if_success=Test passed"
    set "if_failed=Test failed: one pieces"
    CALL :Assert "pin gun soldier battle"

    REM --------------------
    REM Test Case End /\/\/\
    REM --------------------

    CALL :ResolveStatus
    exit /b %errorlevel%
REM End of Main

REM ---------------------------------------------------
REM Assert [..Parameters(up to 9)]
REM ---------------------------------------------------
GOTO :End REM Prevents the code below from being executed
:Assert
set "stdout="

REM Run the program and capture the output then delete the file
CALL %slug%.bat %1 %2 %3 %4 %5 %6 %7 %8 %9 > stdout.bin 2>&1
for /f "delims=" %%A in (stdout.bin) do (
    set "line=%%A"
    if defined stdout (
        set "stdout=!stdout!\n!line!"
    ) else (
        set "stdout=!line!"
    )
)
del stdout.bin

REM Check if the result is correct
if "%stdout%" == "%expected%" (
    if defined if_success (
        echo %if_success%

        REM Reset the variable to avoid duplicating the message.
        set "if_success="
        set "if_failed="
    )

    REM If the result is correct, exit with code 0
    set /a successCount+=1
    exit /b 0
) else (
    if defined if_failed (
        echo %if_failed%

        REM Reset the variable to avoid duplicating the message.
        set "if_success="
        set "if_failed="
    )

    REM If the result is incorrect, exit with code 1
    set /a failCount+=1
    exit /b 1
)
GOTO :EOF REM Go back to the line after the call to :Assert

:ResolveStatus
set "status="
if %failCount% gtr 0 (
    REM status: Fail
    REM message: The test failed.
    exit /b 1

) else (
    REM status: Pass
    exit /b 0
    
)
GOTO :EOF REM Go back to the line after the call to :ExportResultAsJson

:End
