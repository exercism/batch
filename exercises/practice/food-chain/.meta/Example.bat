@echo off
setlocal enabledelayedexpansion

set startVerse=%~1
set endVerse=%~2

goto :main

:verse1
echo I know an old lady who swallowed a fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse2
echo I know an old lady who swallowed a spider.
echo It wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse3
echo I know an old lady who swallowed a bird.
echo How absurd to swallow a bird!
echo She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse4
echo I know an old lady who swallowed a cat.
echo Imagine that, to swallow a cat!
echo She swallowed the cat to catch the bird.
echo She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse5
echo I know an old lady who swallowed a dog.
echo What a hog, to swallow a dog!
echo She swallowed the dog to catch the cat.
echo She swallowed the cat to catch the bird.
echo She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse6
echo I know an old lady who swallowed a goat.
echo Just opened her throat and swallowed a goat!
echo She swallowed the goat to catch the dog.
echo She swallowed the dog to catch the cat.
echo She swallowed the cat to catch the bird.
echo She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse7
echo I know an old lady who swallowed a cow.
echo I don't know how she swallowed a cow!
echo She swallowed the cow to catch the goat.
echo She swallowed the goat to catch the dog.
echo She swallowed the dog to catch the cat.
echo She swallowed the cat to catch the bird.
echo She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
echo She swallowed the spider to catch the fly.
echo I don't know why she swallowed the fly. Perhaps she'll die.
goto :eof

:verse8
echo I know an old lady who swallowed a horse.
echo She's dead, of course!
goto :eof

:main
for /l %%i in (%startVerse%,1,%endVerse%) do (
    call :verse%%i
    echo.
)

exit /b 0
