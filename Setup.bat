@echo off
:: Set console colors for a different style (Light blue text on black background)
color 0E

:: Clear screen at the beginning
cls
echo.
echo   ######################################################################
echo   #  Script Name	: Youtube Video Downloader Setup  - CLI        #      
echo   #  Version            : 2.3                                          #     
echo   #  Description	: Setup File for Youtube Video Downloader      #                                   
echo   #  Args       	:                                              #                                             
echo   #  Author             : Ambarish Mandal                              #                   
echo   #  Email       	: dev.ambarish.ofc@gmail.com                   #                 
echo   ######################################################################
echo.

:: Add a welcoming message with a pause
echo Welcome to the setup script! Let's get started...
timeout /t 2 /nobreak >nul

:: Automatically set the base directory and asset directory
set "BASE_DIR=%~dp0"
set "ASSET_DIR=%BASE_DIR%asset"
set "USER_FILE=%ASSET_DIR%\user_name.txt"
set "YT_DLP_FILE=%BASE_DIR%\yt-dlp.exe"
set "DOWNLOAD_DIR=%BASE_DIR%Downloads"
set "SETUP_FILE=%BASE_DIR%\Setup.bat

:: Add a cool progress message with a timeout
echo [INFO] Setting up the environment... please wait.
timeout /t 1 /nobreak >nul

:: Create the asset directory if it does not exist
if not exist "%ASSET_DIR%" (
    echo [INFO] Asset directory does not exist. Creating "%ASSET_DIR%"...
    timeout /t 2 /nobreak >nul
    mkdir "%ASSET_DIR%"
    echo [SUCCESS] Asset directory created successfully!
    timeout /t 1 /nobreak >nul
)

:: Create the download directory if it does not exist
if not exist "%DOWNLOAD_DIR%" (
    echo [INFO] Download directory does not exist. Creating "%DOWNLOAD_DIR%"...
    timeout /t 2 /nobreak >nul
    mkdir "%DOWNLOAD_DIR%"
    echo [SUCCESS] Download directory created successfully!
    timeout /t 1 /nobreak >nul
)

:: Check if yt-dlp.exe exists in the base directory, if so, move it to the asset directory
if exist "%YT_DLP_FILE%" (
    echo [INFO] yt-dlp.exe found in the base directory. Moving to "%ASSET_DIR%"...
    timeout /t 2 /nobreak >nul
    move /y "%YT_DLP_FILE%" "%ASSET_DIR%"
    echo [SUCCESS] yt-dlp.exe has been moved to "%ASSET_DIR%"!
    timeout /t 1 /nobreak >nul
) else (
    echo [ERROR] yt-dlp.exe was not found in the base directory "%BASE_DIR%".
    pause
    exit /b
)

:: Create user_name.txt if it does not exist and prompt for username
echo [INFO] Please enter your name to set up the environment:
set /p USER_NAME=Enter Your Name: 
echo %USER_NAME% > "%USER_FILE%"
echo [SUCCESS] Hello, %USER_NAME%! Your name has been saved in "%USER_FILE%".
timeout /t 2 /nobreak >nul

:: create urls.txt file
echo. > urls.txt

:: Display a final confirmation message
cls
echo ****************************************************
echo                    Setup Complete
echo ****************************************************
echo.
echo The following directories/files have been set up:
echo - Asset Directory: "%ASSET_DIR%"
echo - Downloads Directory: "%DOWNLOAD_DIR%"
if exist "%USER_FILE%" echo - User File: "%USER_FILE%"
if exist "%ASSET_DIR%\yt-dlp.exe" echo - yt-dlp File: "%ASSET_DIR%\yt-dlp.exe"
echo.
timeout /t 2 /nobreak >nul
:: Move Setup File to Asset 
move /y "%SETUP_FILE%" "%ASSET_DIR%"
echo Press any key to finish the setup and exit...
pause >nul
