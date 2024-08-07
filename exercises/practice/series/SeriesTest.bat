@echo off
REM ---------------------------------------------------
REM Series Unit Testing
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=Series"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/series/canonical-data.json
    REM --------------------
    set "expected=1"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices of one from one."
    CALL :Assert "1" "1"

    set "expected=1 2"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices of one from two."
    CALL :Assert "12" "1"

    set "expected=35"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices of two."
    CALL :Assert "35" "2"

    set "expected=91 14 42"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices of two overlap."
    CALL :Assert "9142" "2"

    set "expected=777 777 777 777"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices can include duplicates."
    CALL :Assert "777777" "3"

    set "expected=91849 18493 84939 49390 93904 39042 90424 04243"
    set "if_success=Test passed"
    set "if_failed=Test failed: slices of a long series."
    CALL :Assert "918493904243" "5"

    set "expected=slice length cannot be greater than series length"
    set "if_success=Test passed"
    set "if_failed=Test failed: slice length is too large."
    CALL :Assert "12345" "6"

    set "expected=slice length cannot be greater than series length"
    set "if_success=Test passed"
    set "if_failed=Test failed: slice length is way too large."
    CALL :Assert "12345" "42"

    set "expected=slice length cannot be zero"
    set "if_success=Test passed"
    set "if_failed=Test failed: slice length cannot be zero."
    CALL :Assert "12345" "0"

    set "expected=slice length cannot be negative"
    set "if_success=Test passed"
    set "if_failed=Test failed: slice length cannot be negative."
    CALL :Assert "12345" "-1"

    set "expected=series cannot be empty"
    set "if_success=Test passed"
    set "if_failed=Test failed: empty series is invalid."
    CALL :Assert "" "1"

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
