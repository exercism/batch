@echo off
SETLOCAL EnableDelayedExpansion

set "nucleotide=%~1"
set "nucleotide[A]=0"
set "nucleotide[C]=0"
set "nucleotide[G]=0"
set "nucleotide[T]=0"

if "!nucleotide!"=="" goto :display_result
for /f "delims=ACGT" %%A in ("%nucleotide%") do (
	echo Invalid nucleotide in strand
	exit /b
)

set "index=0"
:strand_walker
if "!nucleotide:~%index%,1!"=="" goto :display_result
set /a "nucleotide[!nucleotide:~%index%,1!]+=1"
set /a index+=1
goto :strand_walker

:display_result
echo !nucleotide[A]!,!nucleotide[C]!,!nucleotide[G]!,!nucleotide[T]!
