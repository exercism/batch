@echo off
REM ---------------------------------------------------
REM Square Root Unit Testing
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=SquareRoot"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/square-root/canonical-data.json
    REM --------------------
    set "expected=1"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 1"
    CALL :Assert "1"

    set "expected=2"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 4"
    CALL :Assert "4"

    set "expected=5"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 25"
    CALL :Assert "25"

    set "expected=9"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 81"
    CALL :Assert "81"

    set "expected=14"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 196"
    CALL :Assert "196"

    set "expected=255"
    set "if_success=Test passed"
    set "if_failed=Test failed: root of 65025"
    CALL :Assert "65025"

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
set /p stdout=<stdout.bin
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

:Initialize
REM It's for initialize, not about checking empty file
set "successCount=0"
set "failCount=0"
GOTO :EOF REM Go back to the line after the call to :CheckEmptyFile

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
