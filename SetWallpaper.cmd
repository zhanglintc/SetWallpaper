@echo off

title Powered by Lane @ZDS
color 3e

REM this script's path, to support remote call
set here=%~dp0

REM remove temp image files before download
del /q %here%\*.bmp %here%\*.jpg

REM download image from website & rename
%here%\wget -P %here% http://area.sinaapp.com/bingImg?daysAgo=0
rename %here%\*.jpg TranscodedWallpaper.jpg

REM convert jpg to bmp
%here%\jpg2bmp.exe %here%\TranscodedWallpaper.jpg

REM copy file to wallpaper folder & set as wallpaper
REM NOTE: there's no slash between %here% and *.bmp file -> %here%TranscodedWallpaper.bmp
xcopy /y %here%TranscodedWallpaper.bmp C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\
%here%\setwall C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.bmp

REM remove temp image files
del /q %here%\*.bmp %here%\*.jpg

