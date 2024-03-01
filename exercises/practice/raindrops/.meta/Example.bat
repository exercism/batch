@echo off
SETLOCAL EnableDelayedExpansion

set "input=%~1"
set "result="

if "!input!"=="0" (
    set "result=0"
) else (
    if !input! gtr 0 (
        if !input! lss 3 (
            set "result=!input!"
        ) else (
            set /a "mod3=!input! %% 3"
            if !mod3!==0 set "result=Pling"
            set /a "mod5=!input! %% 5"
            if !mod5!==0 set "result=!result!Plang"
            set /a "mod7=!input! %% 7"
            if !mod7!==0 set "result=!result!Plong"
            if not defined result set "result=%input%"
        )
    )
)

echo !result!
