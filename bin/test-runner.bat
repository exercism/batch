@echo off

set slug=%~1
set processed_name=%~2

cd exercises
cd practice
cd %slug%
call %processed_name%Test.bat test-runner
