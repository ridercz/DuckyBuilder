@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO USB Rubber Ducky Payload Builder version 1.0
ECHO Copyright (c) Michal Altair Valasek, Altairis, 2017
ECHO Licensed under terms of the MIT license
ECHO https://github.com/ridercz/DuckyBuilder
ECHO.

REM Remove previous builds
ECHO Removing previous builds...
RMDIR /S /Q out

REM Traverse all folders containing inject.txt
FOR /D %%S IN (src\*) DO IF EXIST %%S\inject.txt (
    ECHO Processing %%~nS:

    REM Traverse all supported keyboards
    FOR /F %%K IN (build.keyboards) DO (
        ECHO   Processing  %%K keyboard:

        REM Create output folder
        SET TARGET_FOLDER=out\%%~nS\%%K
        ECHO     Creating folder !TARGET_FOLDER!...
        MKDIR !TARGET_FOLDER!

        REM Encode payload for given keyboard
        ECHO     Building payload...
        java -jar encoder.jar -i %%S\inject.txt -o !TARGET_FOLDER!\inject.bin -l %%K > NUL

        REM Copy all other files
        ECHO     Copying other payload files...
        XCOPY %%S\* !TARGET_FOLDER! /E /Q > NUL
        DEL !TARGET_FOLDER!\inject.txt
        ECHO ATTRIB +S +H * > !TARGET_FOLDER!\hideall.cmd
        ECHO DEL /A HS hideall.cmd >> !TARGET_FOLDER!\hideall.cmd 
    )
)
