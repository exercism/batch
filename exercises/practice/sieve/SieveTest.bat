@echo off
REM ---------------------------------------------------
REM Sieve Unit Testing
REM ---------------------------------------------------

set isTestRunner=false
if "%1" == "test-runner" (
    set isTestRunner=true
)

:Main
    REM Initalize result variable
    set "slug=Sieve"

    CALL :Initialize

    REM --------------------
    REM Test Case Start \/\/
    REM Resource: https://github.com/exercism/problem-specifications/blob/main/exercises/grains/canonical-data.json
    REM --------------------
    set "expected="
    set "if_success=Test passed"
    set "if_failed=Test failed: no primes under two"
    CALL :Assert "1"

    set "expected=2"
    set "if_success=Test passed"
    set "if_failed=Test failed: find first prime"
    CALL :Assert "2"

    set "expected=2 3 5 7"
    set "if_success=Test passed"
    set "if_failed=Test failed: find primes up to 10"
    CALL :Assert "10"

    set "expected=2 3 5 7 11 13"
    set "if_success=Test passed"
    set "if_failed=Test failed: limit is prime"
    CALL :Assert "13"

    set "expected=2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997"
    set "if_success=Test passed"
    set "if_failed=Test failed: find primes up to 1000"
    CALL :Assert "1000"

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
CALL %filePath% %~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9 > stdout.bin 2>&1
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
