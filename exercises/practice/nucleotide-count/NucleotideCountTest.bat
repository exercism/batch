@echo off
REM ---------------------------------------------------
REM NucleotideCount Unit Testing
REM ---------------------------------------------------

:Main
    REM Initalize result variable
    set "slug=NucleotideCount"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/ce02684e726a1b78a1c1e591188e4e268fd27b15/exercises/nucleotide-count/canonical-data.json
    REM --------------------
    set "expected=0,0,0,0"
    set "if_success=Test passed"
    set "if_failed=Test failed: empty strand."
    CALL :Assert ""

    set "expected=0,0,1,0"
    set "if_success=Test passed"
    set "if_failed=Test failed: can count one nucleotide in single-character input."
    CALL :Assert "G"

    set "expected=0,0,7,0"
    set "if_success=Test passed"
    set "if_failed=Test failed: strand with repeated nucleotide."
    CALL :Assert "GGGGGGG"

    set "expected=20,12,17,21"
    set "if_success=Test passed"
    set "if_failed=Test failed: strand with multiple nucleotides."
    CALL :Assert "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

    set "expected=Invalid nucleotide in strand"
    set "if_success=Test passed"
    set "if_failed=Test failed: strand with invalid nucleotides - Print just 'Invalid nucleotide in strand'."
    CALL :Assert "AGXXACT"

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
