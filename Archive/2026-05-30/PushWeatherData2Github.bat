@echo off
REM ============================================================
REM Weather Station Data Push Script
REM ============================================================
REM This script automatically commits and pushes weather data
REM updates to GitHub. Run this with Windows Task Scheduler.
REM ============================================================

REM Change to your GitHub repository directory
cd /d "D:\Users\Ginny\Documents\GitHub\Davis_Weather"

REM Optional: Print current time for logging
echo ================================================
echo Weather Data Update: %date% %time%
echo ================================================

   REM If _BreezeOK.txt exists then it's OK to leave Back Porch Door open, so use Basic_BreezeOK.htm instead
    IF EXIST "D:/Users/Ginny/Documents/GitHub/Davis_Weather/_BreezeOK.txt" Copy /y "D:/Users/Ginny/Documents/GitHub/Davis_Weather/BasicBreezeOK.htm" "D:/Users/Ginny/Documents/GitHub/Davis_Weather/Basic.htm"
    timeout /t 1 /nobreak

REM Add all files in the directory
git add *

REM Commit changes with timestamp
git commit -m "Weather update: %date% %time%"

REM Check if there were changes to commit
if %ERRORLEVEL% EQU 0 (
    echo Changes detected, pushing to GitHub...

    REM Push to GitHub
    REM git push origin main
    git push -f origin main

    if %ERRORLEVEL% EQU 0 (
        echo Successfully pushed to GitHub!
    ) else (
        echo ERROR: Failed to push to GitHub
        echo Check your internet connection and Git credentials
    )
) else (
    echo No changes to commit
)

echo ================================================
echo Update completed at %time%
echo ================================================

REM Optional: Keep window open for debugging (comment out for Task Scheduler)
REM pause
