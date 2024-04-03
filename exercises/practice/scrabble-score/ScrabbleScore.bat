@echo off
setlocal enabledelayedexpansion

set "word=%~1"
set "result="

if not defined word (
    echo 0
    exit /b
)

call :toLowerCase word

set "one_point=a e i o u l n r s t"
set "two_point=d g"
set "three_point=b c m p"
set "four_point=f h v w y"
set "five_point=k"
set "eight_point=j x"
set "ten_point=q z"

for %%a in (%one_point%) do set word=!word:%%a=1+!
for %%a in (%two_point%) do set word=!word:%%a=2+!
for %%a in (%three_point%) do set word=!word:%%a=3+!
for %%a in (%four_point%) do set word=!word:%%a=4+!
for %%a in (%five_point%) do set word=!word:%%a=5+!
for %%a in (%eight_point%) do set word=!word:%%a=8+!
for %%a in (%ten_point%) do set word=!word:%%a=10+!
set word=%word%0
set /a result=%word%
echo %result%
GOTO :EOF

:toLowerCase
SET %~1=!%~1:A=a!
SET %~1=!%~1:B=b!
SET %~1=!%~1:C=c!
SET %~1=!%~1:D=d!
SET %~1=!%~1:E=e!
SET %~1=!%~1:F=f!
SET %~1=!%~1:G=g!
SET %~1=!%~1:H=h!
SET %~1=!%~1:I=i!
SET %~1=!%~1:J=j!
SET %~1=!%~1:K=k!
SET %~1=!%~1:L=l!
SET %~1=!%~1:M=m!
SET %~1=!%~1:N=n!
SET %~1=!%~1:O=o!
SET %~1=!%~1:P=p!
SET %~1=!%~1:Q=q!
SET %~1=!%~1:R=r!
SET %~1=!%~1:S=s!
SET %~1=!%~1:T=t!
SET %~1=!%~1:U=u!
SET %~1=!%~1:V=v!
SET %~1=!%~1:W=w!
SET %~1=!%~1:X=x!
SET %~1=!%~1:Y=y!
SET %~1=!%~1:Z=z!
GOTO :EOF
