@echo off
REM ---------------------------------------------------
REM Armstrong Numbers Unit Testing
REM 
REM sUnit Testing Framework version: 0.2
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=ArmstrongNumbers"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/acronym/canonical-data.json
    REM --------------------
    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: Zero is an Armstrong number."
    CALL :Assert 0

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: Single-digit numbers are Armstrong numbers."
    CALL :Assert 5

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: There are no two-digit Armstrong numbers."
    CALL :Assert 10

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: Three-digit number that is an Armstrong number."
    CALL :Assert 153

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: Three-digit number that is not an Armstrong number."
    CALL :Assert 100

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: Four-digit number that is an Armstrong number."
    CALL :Assert 9474

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: Four-digit number that is not an Armstrong number."
    CALL :Assert 9475

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: Seven-digit number that is an Armstrong number."
    CALL :Assert 9926315

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: Seven-digit number that is not an Armstrong number."
    CALL :Assert 9926314
    
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
    set filePath=.meta/Example.bat
)
CALL %filePath% %1 %2 %3 %4 %5 %6 %7 %8 %9 > stdout.bin 2>&1
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
