@echo off
:: Set console colors for a different style (yellow text on black background)
color 0E

:: Automatically set the base directory to the folder where the script is located
set "BASE_DIR=%~dp0"
set "ASSET_DIR=%BASE_DIR%asset"
set "USER_FILE=%ASSET_DIR%\user_name.txt"
set "YT_DLP_FILE=%ASSET_DIR%\yt-dlp.exe"
set "DOWNLOAD_DIR=%BASE_DIR%Downloads"

:: Display the enhanced script banner
cls
echo.
echo   ######################################################################
echo   #                                                                    #
echo   #          Y O U T U B E   V I D E O   D O W N L O A D E R           #
echo   #                                                           2.0      #
echo   ######################################################################
echo   #                                                                    #
echo   #  Script Name   : YouTube Video Downloader Single - CLI             #
echo   #  Version       : 2.0                                               #
echo   #  Description   : Downloads YouTube videos once at a time           #
echo   #  Author        : Ambarish Mandal                                   #
echo   #  Email         : dev.ambarish.ofc@gmail.com                        #
echo   #                                                                    #
echo   ######################################################################
echo.

timeout /t 2 /nobreak >nul

:: Ensure the asset directory exists
if not exist "%ASSET_DIR%" (
    echo [INFO] Asset directory does not exist. Creating "%ASSET_DIR%"...
    timeout /t 1 /nobreak >nul
    mkdir "%ASSET_DIR%"
    echo [SUCCESS] Asset directory created successfully!
    timeout /t 1 /nobreak >nul
)

:: Ensure yt-dlp.exe exists in the asset directory
if not exist "%YT_DLP_FILE%" (
    echo [ERROR] yt-dlp.exe is missing! Please place yt-dlp.exe in the directory: %ASSET_DIR%
    pause
    exit /b
)

:: Greetings for the user
    for /f "usebackq delims=" %%a in ("%USER_FILE%") do set "USER_NAME=%%a"
    timeout /t 1 /nobreak >nul
    echo Welcome back, %USER_NAME%! Let's download your video.
    timeout /t 1 /nobreak >nul
)


:: Ensure the download directory exists
if not exist "%DOWNLOAD_DIR%" (
    echo [INFO] Creating download directory at "%DOWNLOAD_DIR%"...
    timeout /t 1 /nobreak >nul
    mkdir "%DOWNLOAD_DIR%"
    echo [SUCCESS] Download directory created successfully!
    timeout /t 1 /nobreak >nul
)

:: Prompt for the video URL
:EnterURL
echo Please enter the YouTube video URL:
set /p VIDEO_URL=URL: 
if "%VIDEO_URL%"=="" (
    echo [ERROR] Video URL cannot be empty. Please try again.
    timeout /t 1 /nobreak >nul
    goto EnterURL
)

:: Start downloading the video
echo [INFO] Downloading video: %VIDEO_URL%...
timeout /t 1 /nobreak >nul
"%YT_DLP_FILE%" -f bestvideo+bestaudio --merge-output-format mp4 -o "%DOWNLOAD_DIR%\%%(title)s.%%(ext)s" "%VIDEO_URL%"
if errorlevel 1 (
    echo [ERROR] Failed to download the video. Please check the URL or your internet connection.
    timeout /t 2 /nobreak >nul
) else (
    echo [SUCCESS] Video downloaded successfully! Saved in "%DOWNLOAD_DIR%".
    timeout /t 2 /nobreak >nul
:: Final message and exit
cls
color 0E
echo   ######################################################################
echo   #                                                                    #
echo   #     D O W N L O A D  C O M P L E T E D  S U C E S S F U L L Y      #
echo   #                                                                    #
echo   ######################################################################
echo   #                                                                    #
echo   #     Your video has been saved to the following directory:          #
echo   #--------------------------------------------------------------------#
echo   #                %DOWNLOAD_DIR%                     #
echo   #--------------------------------------------------------------------#
echo   #                                                                    #
echo   #          Thank you for using YouTube Video Downloader!             #
echo   #                                                                    #
echo   #====================================================================#
echo   #                                                                    #
echo   #             ~ Developed with ^<3 by Ambarish Mandal ~               #
echo   #                                                                    #
echo   ######################################################################
echo.
timeout /t 3 /nobreak >nul
)


pause