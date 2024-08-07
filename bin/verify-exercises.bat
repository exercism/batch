@echo off
setlocal EnableDelayedExpansion

set configPath=%cd%\config.json
echo %configPath%

for /f "usebackq tokens=*" %%a in ("%configPath%") do (
    set "line=%%a"
    
    REM Look for lines containing the slug
    echo !line! | findstr /c:"\"slug\"" >nul
    if !errorlevel! equ 0 (
        set "_slug=!line:*\"slug\": \"=!"
        set "_slug=!_slug:\"",=!"
        set "_slug=!_slug:\"",=!"
    )

    REM Look for lines containing the name
    echo !line! | findstr /c:"\"name\"" >nul
    if !errorlevel! equ 0 (
        set "_name=!line:*\"name\": \"=!"
        set "_name=!_name:\"",=!"
        set "_name=!_name:\"",=!"
        for /f "tokens=2 delims=:" %%a in ('echo !_slug!') do set "slug=%%a"
        set "slug=!slug:~2,-2!"
        for /f "tokens=2 delims=:" %%a in ('echo !_name!') do set "name=%%a"
        set "name=!name:~2,-2!"


        echo Slug: !slug!
        echo Name: !name!
        echo Exec: call \exercises\practice\!slug!\!name: =!Test.bat test-runner
        call %cd%\exercises\practice\!slug!\!name: =!Test.bat test-runner
        echo.
        
    )
)

endlocal
