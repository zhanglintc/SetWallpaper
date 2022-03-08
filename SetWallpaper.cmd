@echo off

title Powered by Lane @ZDS
color 3e

REM this script's path, to support remote call
set here=%~dp0

REM if wgetrc file exists, use it
if exist %here%.wgetrc set WGETRC=%here%.wgetrc
if exist %here%wgetrc  set WGETRC=%here%wgetrc
ipconfig | findstr asiapacific > nul
if %ERRORLEVEL% == 1 set WGETRC=

REM remove temp image files before download
del /q %here%\*.bmp %here%\*.jpg

REM set value to %daysAgo%
choice /T 2 /D 0 /C 01234567 /M "Choose the day"
set /a daysAgo=%errorlevel% - 1

REM download image from website & rename
REM old invalid address1: %here%\wget -P %here% http://area.sinaapp.com/bingImg?daysAgo=0
REM old invalid address2: %here%\wget -P %here% http://test201514.sinaapp.com/bingPic -O %here%\bingPic.jpg
%here%\wget -P %here% http://mmrz.zhanglintc.co:5969/?daysAgo=%daysAgo% -O %here%\bingPic.jpg
rename %here%\*.jpg TranscodedWallpaper.jpg

REM convert jpg to bmp
REM %here%\jpg2bmp.exe %here%\TranscodedWallpaper.jpg
%here%\jpg2bmpcmd\jpg2bmpcmd.exe -i %here%\TranscodedWallpaper.jpg -o %here%

REM copy file to wallpaper folder & set as wallpaper
REM NOTE: there's no slash between %here% and *.bmp file -> %here%TranscodedWallpaper.bmp
xcopy /y %here%TranscodedWallpaper.bmp C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\
%here%\setwall C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.bmp

REM remove temp image files
del /q %here%\*.bmp %here%\*.jpg

