@echo off
setlocal enabledelayedexpansion

set "inputs=%~1"

set count=0
for %%a in (%inputs%) do (
    set /a count+=1
)

for %%a in (%inputs%) do (
    set "first=%%a"
    goto :break
)

:break

if %count% EQU 0 (
    exit /b 0
)

if %count% EQU 1 (
    echo And all for the want of a %first%.
    exit /b 0
)

set "index=1"
for %%a in (%inputs%) do (
    set current=%%a
    set next=none
    set tempIndex=0

    for %%b in (%inputs%) do (
        if !tempIndex! EQU !index! (
            set next=%%b
        )
        set /a tempIndex+=1
    )

    if !next! EQU none (
        echo And all for the want of a !first!.
        exit /b 0
    )
    echo For want of a !current! the !next! was lost.
    set /a index+=1
)