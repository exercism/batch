@echo off
SETLOCAL EnableDelayedExpansion

call :macro

REM TODO: Need to cleanup the code

set "string=%~1"

REM set "string=G"
REM set "string=GGGGGGG"
REM set "string=AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

%getlen% %string%
set /a "len[0]=length"

for %%i in (A C G T) do (
	set "string=!string:%%i=!"
	%getlen% !string!
	set /a "c+=1", "d=c - 1"
	set /a "len[!c!]=length"
	set /a "%%i_difference=len[!d!] - len[!c!]"
)

if !T_difference! equ 0 (
	set /a "T_difference=len[4]"
	set "len[4]=0"
)

echo !A_difference!,!C_difference!,!G_difference!,!T_difference!
echo Invalid nucleotide in strand	=	!len[4]!	=	!string!

goto end

:macro
(set \n=^^^
%= This creates an escaped Line Feed - DO NOT ALTER =%
)

set getlen=for %%# in (1 2) do if %%#==2 ( for %%1 in (^^!args^^!) do (%\n%
	set "str=X%%~1" ^& set "length=0" ^& for /l %%b in (10,-1,0) do set /a "length|=1<<%%b" ^& for %%c in (^^!length^^!) do if "^!str:~%%c,1^!" equ "" set /a "length&=~1<<%%b"%\n%
)) else set args=
goto :eof

:end