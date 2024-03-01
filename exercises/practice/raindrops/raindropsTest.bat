@echo off
REM ---------------------------------------------------
REM Raindrops Unit Testing
REM ---------------------------------------------------

:Main
    REM Initalize result variable
    set "slug=raindrops"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/raindrops/canonical-data.json
    REM --------------------
    set "expected=1"
    set "if_success=Test passed"
    set "if_failed=Test failed: the sound for 1 is 1."
    CALL :Assert 1

    set "expected=Pling"
    set "if_success=Test passed"
    set "if_failed=the sound for 3 is Pling."
    CALL :Assert 3

    set "expected=Plang"
    set "if_success=Test passed"
    set "if_failed=the sound for 5 is Plang."
    CALL :Assert 5

    set "expected=Plong"
    set "if_success=Test passed"
    set "if_failed=the sound for 7 is Plong."
    CALL :Assert 7

    set "expected=Pling"
    set "if_success=Test passed"
    set "if_failed=the sound for 6 is Pling as it has a factor 3."
    CALL :Assert 6

    set "expected=8"
    set "if_success=Test passed"
    set "if_failed=2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base."
    CALL :Assert 8

    set "expected=Pling"
    set "if_success=Test passed"
    set "if_failed=the sound for 9 is Pling as it has a factor 3."
    CALL :Assert 9

    set "expected=Plang"
    set "if_success=Test passed"
    set "if_failed=the sound for 10 is Plang as it has a factor 5."
    CALL :Assert 10

    set "expected=Plong"
    set "if_success=Test passed"
    set "if_failed=the sound for 14 is Plong as it has a factor of 7."
    CALL :Assert 14

    set "expected=PlingPlang"
    set "if_success=Test passed"
    set "if_failed=the sound for 15 is PlingPlang as it has factors 3 and 5."
    CALL :Assert 15

    set "expected=PlingPlong"
    set "if_success=Test passed"
    set "if_failed=the sound for 21 is PlingPlong as it has factors 3 and 7."
    CALL :Assert 21

    set "expected=Plang"
    set "if_success=Test passed"
    set "if_failed=the sound for 25 is Plang as it has a factor 5."
    CALL :Assert 25

    set "expected=Pling"
    set "if_success=Test passed"
    set "if_failed=the sound for 27 is Pling as it has a factor 3."
    CALL :Assert 27

    set "expected=PlangPlong"
    set "if_success=Test passed"
    set "if_failed=the sound for 35 is PlangPlong as it has factors 5 and 7."
    CALL :Assert 35

    set "expected=Plong"
    set "if_success=Test passed"
    set "if_failed=the sound for 49 is Plong as it has a factor 7."
    CALL :Assert 49

    set "expected=52"
    set "if_success=Test passed"
    set "if_failed=the sound for 52 is 52."
    CALL :Assert 52

    set "expected=PlingPlangPlong"
    set "if_success=Test passed"
    set "if_failed=the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7."
    CALL :Assert 105

    set "expected=Plang"
    set "if_success=Test passed"
    set "if_failed=the sound for 3125 is Plang as it has a factor 5."
    CALL :Assert 3125

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
CALL %slug%.bat %~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9 > stdout.bin 2>&1
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
