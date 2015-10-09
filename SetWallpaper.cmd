@echo off

title Powered by Lane @ZDS
color 3e

REM this script's path, to support remote call
set target=%~dp0

REM download image from website & rename
%target%\wget -P %target% http://area.sinaapp.com/bingImg?daysAgo=0
rename %target%\*.jpg TranscodedWallpaper.jpg

REM convert jpg to bmp
%target%\jpg2bmp.exe %target%\TranscodedWallpaper.jpg

REM copy file to wallpaper folder & set as wallpaper
REM NOTE: there's no slash between %target% and *.bmp file -> %target%TranscodedWallpaper.bmp
xcopy /y %target%TranscodedWallpaper.bmp C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\
%target%\setwall C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.bmp

REM remove temp image files
del /q %target%\*.bmp %target%\*.jpg

