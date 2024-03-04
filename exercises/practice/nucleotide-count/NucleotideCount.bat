@echo off
SETLOCAL EnableDelayedExpansion

set "nucleotide=%~1"
set "nucleotide[A]=0"
set "nucleotide[C]=0"
set "nucleotide[G]=0"
set "nucleotide[T]=0"

REM Your code goes here


echo !nucleotide[A]!,!nucleotide[C]!,!nucleotide[G]!,!nucleotide[T]!
