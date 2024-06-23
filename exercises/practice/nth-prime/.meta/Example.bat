@echo off
setlocal enabledelayedexpansion

set targetNTH=%~1
set /a "currentNTH=0"
set "primeNumbers="

if %targetNTH% equ 0 (
  echo there is no zeroth prime
  exit /b 0
)

for /L %%a in (1,1,10001) do (
  set index=%%a
  2>nul set /a "1/(!index! %% 2)" && (
    if !index! neq 1 (
      set divideableCheck=true
      for %%b in (!primeNumbers!) do (
        set /a "remainder=!index! %% %%b"
        if !remainder! equ 0 (
          set divideableCheck=false
        )
      )

      if !divideableCheck! equ true (
        set primeNumbers=!primeNumbers! !index!
        set /a "currentNTH+=1"
        if !currentNTH! equ %targetNTH% (
          echo !index!
          exit /b 0
        )
      )
    )
  )

  if !index! equ 2 (
    set primeNumbers=!primeNumbers! !index!
    set /a "currentNTH+=1"
    if !currentNTH! equ %targetNTH% (
      echo !index!
      exit /b 0
    )
  )
)
