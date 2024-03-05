@echo off
setlocal enabledelayedexpansion

set "phrase=%~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9"
set "acronym="

REM replace some of special characters which cmd interpeter care.
set "phrase=%phrase:-= %"
set "phrase=%phrase:_= %"

for %%a in (%phrase%) do (
    set "word=%%~a"
    set "word=!word:~0,1!"
    set "acronym=!acronym!!word!"
)

REM Uppercase output
for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do set "acronym=!acronym:%%A=%%A!"

echo !acronym!
