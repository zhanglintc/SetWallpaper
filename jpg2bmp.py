#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Convert input *.jpg into *.bmp files

Author: Lane
"""

from PIL import Image
import sys

here = sys.path[0]

if len(sys.argv) < 2:
    sys.exit("Usage: jpg2bmp target.jpg")

if len(sys.argv) > 2:
    sys.exit("Error: only support ONE file each time")

imagePath = sys.argv[1]

try:
    im = Image.open(imagePath)
except IOError:
    sys.exit("Error: cannot find such file")

newFile = imagePath[:-4] + ".bmp"
print("")
print("Converting...")
im.save(newFile, "bmp")
print("")
print("Converted file saved as {}".format(newFile))


