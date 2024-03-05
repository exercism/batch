@echo off
REM ---------------------------------------------------
REM Acronym Unit Testing
REM 
REM sUnit Testing Framework version: 0.2
REM ---------------------------------------------------

:Main
    REM Initalize result variable
    set "slug=acronym"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/acronym/canonical-data.json
    REM --------------------
    set "expected=PNG"
    set "if_success=Test passed"
    set "if_failed=Test failed: basic."
    CALL :Assert "Portable Network Graphics"

    set "expected=ROR"
    set "if_success=Test passed"
    set "if_failed=Test failed: lowercase words."
    CALL :Assert "Ruby on Rails"

    set "expected=FIFO"
    set "if_success=Test passed"
    set "if_failed=Test failed: punctuation."
    CALL :Assert "First In, First Out"

    set "expected=GIMP"
    set "if_success=Test passed"
    set "if_failed=Test failed: all caps word."
    CALL :Assert "GNU Image Manipulation Program"

    set "expected=CMOS"
    set "if_success=Test passed"
    set "if_failed=Test failed: punctuation without whitespace."
    CALL :Assert "Complementary metal-oxide semiconductor"

    set "expected=ROTFLSHTMDCOALM"
    set "if_success=Test passed"
    set "if_failed=Test failed: very long abbreviation."
    CALL :Assert "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"

    set "expected=SIMUFTA"
    set "if_success=Test passed"
    set "if_failed=Test failed: consecutive delimiters."
    CALL :Assert "Something - I made up from thin air"

    set "expected=HC"
    set "if_success=Test passed"
    set "if_failed=Test failed: apostrophes."
    CALL :Assert "Halley's Comet"

    set "expected=TRNT"
    set "if_success=Test passed"
    set "if_failed=Test failed: underscore emphasis."
    CALL :Assert "The Road _Not_ Taken"

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
