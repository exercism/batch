@echo off
REM ---------------------------------------------------
REM Scrabble Score Unit Testing
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=ScrabbleScore"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/scrabble-score/canonical-data.json
    REM --------------------
    set "expected=1"
    set "if_success=Test passed"
    set "if_failed=Test failed: lowercase letter."
    CALL :Assert "a"

    set "expected=1"
    set "if_success=Test passed"
    set "if_failed=Test failed: uppercase letter."
    CALL :Assert "A"

    set "expected=4"
    set "if_success=Test passed"
    set "if_failed=Test failed: valuable letter."
    CALL :Assert "f"

    set "expected=2"
    set "if_success=Test passed"
    set "if_failed=Test failed: short word."
    CALL :Assert "at"

    set "expected=12"
    set "if_success=Test passed"
    set "if_failed=Test failed: short, valuable word."
    CALL :Assert "zoo"

    set "expected=6"
    set "if_success=Test passed"
    set "if_failed=Test failed: medium word."
    CALL :Assert "street"

    set "expected=22"
    set "if_success=Test passed"
    set "if_failed=Test failed: medium, valuable word."
    CALL :Assert "quirky"

    set "expected=41"
    set "if_success=Test passed"
    set "if_failed=Test failed: long, mixed-case word."
    CALL :Assert "OxyphenButazone"

    set "expected=8"
    set "if_success=Test passed"
    set "if_failed=Test failed: english-like word."
    CALL :Assert "pinata"

    set "expected=0"
    set "if_success=Test passed"
    set "if_failed=Test failed: empty input."
    CALL :Assert ""

    set "expected=87"
    set "if_success=Test passed"
    set "if_failed=Test failed: entire alphabet available."
    CALL :Assert "abcdefghijklmnopqrstuvwxyz"

    REM TODO: as Future - ADD OTHER TEST CASES LIKE ADD VALUE TEST CASE
    REM https://github.com/exercism/problem-specifications/blob/8b6a412a949d9080b08869156067a16521c4d1ba/exercises/clock/canonical-data.json#L216

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
        echo Expected: %expected%
        echo Actually: %stdout%

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
