**YouTube Video Downloader CLI**

### Description:  
A comprehensive command-line tool for downloading YouTube videos effortlessly. Includes scripts for single video downloads, batch downloads from URL lists, and an automated setup script for hassle-free installation.  

---

### Detailed Overview:

**YouTube Video Downloader CLI** is a simple yet powerful project designed for users who prefer downloading YouTube videos directly from the command line. Whether you want to download a single video or multiple videos in one go, this repository has got you covered.  

#### Key Features:  
- **Single Video Downloader**: Quickly download individual YouTube videos by entering their URLs.  
- **Batch Downloader**: Download multiple videos in one session by providing a list of URLs in a `urls.txt` file. Failed downloads are logged for reattempts.  
- **Setup Script**: Automatically creates required directories, moves dependencies, and sets up the environment for first-time users.  
- **User-Friendly Design**: Clear prompts, error handling, and informative banners make the process smooth and intuitive.  

#### Repository Contents:  
1. **Single Downloader Script**: For downloading one video at a time.  
2. **Batch Downloader Script**: Supports downloading multiple videos using a URL file.  
3. **Setup Script**: Prepares your environment by organizing files and directories.  
4. **ReadMe**: Instructions for usage and setup.  
5. **Assets**: Contains required files like `yt-dlp.exe`.  

#### Requirements:  
- Windows operating system with Command Prompt support.  
- `yt-dlp.exe` (automatically configured in the setup).  
- A stable internet connection.  

#### How to Use:  
1. Clone the repository or download the ZIP file.  
2. Run the setup script (`setup_script.bat`) to configure the environment.  
3. Use the single or batch downloader scripts to download videos as needed.  
4. Follow the instructions and prompts provided during script execution.

#### FFMPEG(Required): 
o install FFmpeg on Windows, follow these steps:

- Step 1: Download FFmpeg
Go to the official FFmpeg download page: FFmpeg Downloads.
Scroll down to the "Windows" section and click the link to the Windows builds provided by BtbN or visit this link directly.
Choose the "Release" build that fits your system architecture (usually ffmpeg-release-i686-static for 32-bit systems or ffmpeg-release-x86_64-static for 64-bit systems).
Download the .zip file (e.g., ffmpeg-release-4.4-full_build.7z).

- Step 2: Extract the FFmpeg files
Once the .zip or .7z file is downloaded, right-click the file and extract it to a folder. For example, you can extract it to C:\ffmpeg.
If you're using a .7z file, you might need to install 7-Zip to extract it.

- Step 3: Set up FFmpeg in the system PATH
Open the Start Menu and search for "Environment Variables".
Click on Edit the system environment variables.
In the System Properties window, click on the Environment Variables button.
Under System Variables, scroll down and select the Path variable, then click Edit.
In the Edit Environment Variable window, click New and add the path to the bin folder inside the FFmpeg directory. For example, if you extracted FFmpeg to `C:\ffmpeg`, the path to add would be `C:\ffmpeg\bin`.
Click OK to close all the windows.
- Step 4: Verify the installation
Open a Command Prompt (cmd) window.
Type the following command to check if FFmpeg is installed correctly:
`ffmpeg -version`
You should see information about the FFmpeg version you installed.


#### Credits:  
- **Author**: Ambarish Mandal  
- **Email**: dev.ambarish.ofc@gmail.com  

#### Disclaimer:  
This project is for personal use only. Please adhere to YouTube's terms of service while using this tool.
