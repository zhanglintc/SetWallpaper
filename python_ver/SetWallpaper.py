#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Download today's Bing image and set it as wallpaper.

setwall.exe(orinal named SetWallpaper.exe) downloaded from:
  http://www.thoughtasylum.com/blog/2010/6/2/set-windows-wallpaper-from-the-command-line.html
  (SET WINDOWS WALLPAPER FROM THE COMMAND LINE)

Bing image API:
  http://area.sinaapp.com/bingImg?daysAgo=1 (网友提供的接口)
refer to:
  http://www.tuicool.com/articles/RJNZj2 (如何批量下载bing前20多天的背景图片？)
"""

import os, sys
from PIL import Image

here = sys.path[0]

os.system("pushd {target} && del /Q *.jpg".format(target = here))
os.system("pushd {target} && ..\wget http://area.sinaapp.com/bingImg?daysAgo=0".format(target = here))
os.system("pushd {target} && rename *.jpg TranscodedWallpaper.jpg".format(target = here))

imagePath = "{target}\TranscodedWallpaper.jpg".format(target = here)
im = Image.open(imagePath)
im.save("{target}\TranscodedWallpaper.bmp".format(target = here), "bmp")
os.system("xcopy /y {target}\TranscodedWallpaper.bmp C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\\".format(target = here))
os.system("pushd {target} && ..\setwall C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.bmp".format(target = here))
os.system("pushd {target} && del /Q *.jpg".format(target = here))
os.system("pushd {target} && del /Q *.bmp".format(target = here))


