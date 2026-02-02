@echo off
set "input=%~1"
set "result="

set /a "mod3=input %% 3"
if %mod3% EQU 0 set "result=Pling"

set /a "mod5=input %% 5"
if %mod5% EQU 0 set "result=%result%Plang"

set /a "mod7=input %% 7"
if %mod7% EQU 0 set "result=%result%Plong"

if not defined result set "result=%input%"

echo %result%
