#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Download today's Bing image and set it as wallpaper.

SetWallpaper.exe downloaded from:
  http://www.thoughtasylum.com/blog/2010/6/2/set-windows-wallpaper-from-the-command-line.html
  (SET WINDOWS WALLPAPER FROM THE COMMAND LINE)

Bing image API:
  http://area.sinaapp.com/bingImg?daysAgo=1 (网友提供的接口)
refer to:
  http://www.tuicool.com/articles/RJNZj2 (如何批量下载bing前20多天的背景图片？)
"""

import os
from PIL import Image

os.system("del /Q *.jpg")
os.system(r".\wget http://area.sinaapp.com/bingImg?daysAgo=1")
os.system("rename *.jpg today.jpg")

imagePath = r".\today.jpg"
im = Image.open(imagePath)
im.save(r".\today.bmp", "bmp")
os.system("SetWallpaper today.bmp")
os.system("del /Q *.jpg")
os.system("del /Q *.bmp")
