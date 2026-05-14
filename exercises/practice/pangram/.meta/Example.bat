@echo off
setlocal enabledelayedexpansion

set "sentence=%~1"
set "result=true"

if not defined sentence set "result=false"

for %%a in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    set "check=!sentence:%%a=!"
    if "!check!" == "!sentence!" (
        set "result=false"
    )
)

echo !result!
