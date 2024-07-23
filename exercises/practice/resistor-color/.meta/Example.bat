@echo off
setlocal enabledelayedexpansion

set colorCode=%~1

if not defined colorCode (
    for %%a IN (black brown red orange yellow green blue violet gray white) DO (
      echo %%~a
    )
    exit /b 1
)

set "colors[black]=0"
set "colors[brown]=1"
set "colors[red]=2"
set "colors[orange]=3"
set "colors[yellow]=4"
set "colors[green]=5"
set "colors[blue]=6"
set "colors[violet]=7"
set "colors[gray]=8"
set "colors[white]=9"

if not defined colors[%colorCode%] (
    echo invalid color
    exit /b 1
)

set "result=!colors[%colorCode%]!"

echo %result%
