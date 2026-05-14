@echo off
REM ---------------------------------------------------
REM Pangram Unit Testing
REM 
REM sUnit Testing Framework version: 0.2
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=pangram"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/pangram/canonical-data.json
    REM --------------------

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: empty sentence."
    CALL :Assert ""

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: perfect lower case."
    CALL :Assert "abcdefghijklmnopqrstuvwxyz"

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: only lower case."
    CALL :Assert "the quick brown fox jumps over the lazy dog"

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: missing the letter 'x'."
    CALL :Assert "a quick movement of the enemy will jeopardize five gunboats"

    set "expected=false"
    set "if_success=Test passed "
    set "if_failed=Test failed: missing the letter 'h'."
    CALL :Assert "five boxing wizards jump quickly at it"

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: with underscores."
    CALL :Assert "the_quick_brown_fox_jumps_over_the_lazy_dog"

    set "expected=true"
    set "if_success=Test passed"
    set "if_failed=Test failed: with numbers."
    CALL :Assert "the 1 quick brown fox jumps over the 2 lazy dogs"

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: missing letters replaced by numbers."
    CALL :Assert "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"

    set "expected=false"
    set "if_success=Test passed"
    set "if_failed=Test failed: a-m and A-M are 26 different characters but not a pangram."
    CALL :Assert "abcdefghijklm ABCDEFGHIJKLM"

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
cmd /c ""%batPath%%filePath%" %1 %2 %~3 %~4 %~5 %~6 %~7 %~8 %~9" > stdout.bin 2>&1
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
