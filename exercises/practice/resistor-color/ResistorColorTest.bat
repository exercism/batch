@echo off
setlocal enabledelayedexpansion
REM ---------------------------------------------------
REM ResistorColor Unit Testing
REM 
REM sUnit Testing Framework version: 0.3
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

set "successCount=0"
set "failCount=0"

:Main
    REM Initalize result variable
    set "slug=ResistorColor"

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/resistor-color/canonical-data.json
    REM --------------------
    set "expected=0"
    set "if_success=Test passed"
    set "if_failed=Test failed: Black"
    CALL :Assert "black"

    set "expected=9"
    set "if_success=Test passed"
    set "if_failed=Test failed: White"
    CALL :Assert "white"

    REM 3 
    set "expected=purposefully"
    set "if_success=Test passed"
    set "if_failed=Test failed: Orange"
    CALL :Assert "orange"

    set "expected=black\nbrown\nred\norange\nyellow\ngreen\nblue\nviolet\ngray\nwhite"
    set "if_success=Test passed"
    set "if_failed=Test failed: All colors"
    CALL :Assert ""
    
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
set filePath=%slug%.bat
if "%isTestRunner%"=="true" (
    set filePath=.meta\Example.bat
)
set batPath=%~dp0
CALL %batPath%%filePath% %~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9 > stdout.bin 2>&1
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
