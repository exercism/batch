@echo off 
setlocal enabledelayedexpansion

set bitmap=
set n=Y
set "limit=%~1"
set "result="
set /a test=3,npri=3

if %limit% geq 2 set "result=%result% 2"
if %limit% geq 3 set "result=%result% 3"

:nextpri
set /a test+=2,index=0,div=3
if %test% LSS 8000 set bitmap=%bitmap%%n%
if %test% gtr 64000000 exit /b 

:nextest
if "!bitmap:~%index%,1!"=="N" goto nextdiv
set /a resi=!test!%%!div!
if %resi% equ 0 set n=N& goto nextpri

:nextdiv
set /a index+=1, div+=2
set /a div2=div*div 
if %test% gtr %limit% goto :end
if %div2% gtr %test% (
set n=Y
set "result=%result% %test%"
set /a npri+=1 
goto nextpri)
goto nextest 

:end
if defined result (
    set result=%result:~1%
    echo !result!
)
