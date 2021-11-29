#!/usr/bin/python3.7

#from resizeimage import resizeimage
from PIL import Image
import webcolors
from colorthief import ColorThief

image_path = './colorFullImage.png'
max_width = 1800
new_filename = './colorFullImage-1800.png'
image_colors = []
with open(image_path, "rb") as f:
    with Image.open(f) as image:
        # # Resize
        # smaller_image = resizeimage.resize_width(image, max_width)
        # smaller_image.save(new_image_path, image.format)

        # Get Colors
        color_thief = ColorThief(image_path)
        color_palette = color_thief.get_palette(color_count=10, quality=10)
        hexx = ""
        for color in color_palette:
            #print(webcolors.rgb_to_hex(color))
            hexx += ''.join(webcolors.rgb_to_hex(color))[1:]

hexx = str(hexx).decode()
print(hexx)

