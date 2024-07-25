@echo off
setlocal enabledelayedexpansion
REM ---------------------------------------------------
REM FoodChain Unit Testing
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
    set "slug=FoodChain"

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/food-chain/canonical-data.json
    REM --------------------
    set "expected=I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: fly"
    CALL :Assert "1" "1"

    set "expected=I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: spider"
    CALL :Assert "2" "2"

    set "expected=I know an old lady who swallowed a bird.\nHow absurd to swallow a bird!\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: bird"
    CALL :Assert "3" "3"
    
    set "expected=I know an old lady who swallowed a cat.\nImagine that, to swallow a cat!\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: cat"
    CALL :Assert "4" "4"

    set "expected=I know an old lady who swallowed a dog.\nWhat a hog, to swallow a dog!\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: dog"
    CALL :Assert "5" "5"

    set "expected=I know an old lady who swallowed a goat.\nJust opened her throat and swallowed a goat!\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: goat"
    CALL :Assert "6" "6"

    set "expected=I know an old lady who swallowed a cow.\nI don't know how she swallowed a cow!\nShe swallowed the cow to catch the goat.\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: cow"
    CALL :Assert "7" "7"

    set "expected=I know an old lady who swallowed a horse.\nShe's dead, of course!"
    set "if_success=Test passed"
    set "if_failed=Test failed: horse"
    CALL :Assert "8" "8"

    set "expected=I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\nI know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\nI know an old lady who swallowed a bird.\nHow absurd to swallow a bird!\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "if_success=Test passed"
    set "if_failed=Test failed: multiple verses"
    CALL :Assert "1" "3"

    REM The reason for splitting into parts is that the batch language has a line limit
    set "expected=I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a bird.\nHow absurd to swallow a bird!\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a cat.\nImagine that, to swallow a cat!\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a dog.\nWhat a hog, to swallow a dog!\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a goat.\nJust opened her throat and swallowed a goat!\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a cow.\nI don't know how she swallowed a cow!\nShe swallowed the cow to catch the goat.\nShe swallowed the goat to catch the dog.\nShe swallowed the dog to catch the cat.\nShe swallowed the cat to catch the bird.\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\nShe swallowed the spider to catch the fly.\nI don't know why she swallowed the fly. Perhaps she'll die."
    set "expected=%expected%\nI know an old lady who swallowed a horse.\nShe's dead, of course!"
    set "if_success=Test passed"
    set "if_failed=Test failed: full song"
    CALL :Assert "1" "8"
    
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
