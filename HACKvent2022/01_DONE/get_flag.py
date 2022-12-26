#!/usr/share/python3
from PIL import Image
from PIL import GifImagePlugin
from qrtools import QR

im = Image.open("hackvent2022_01.gif")


def gif_to_png():
	global im
	#print(im.n_frames)
		
	for frame in range(im.n_frames):
		im.seek(frame)
		im.save(f"output/jadu-{frame}.png")

gif_to_png()


def extracr_QR_data():
	flag = []
	# Python program to Scan and Read a QR code

	for i in range(im.n_frames):
		my_QR = QR(filename = f"output/jadu-{i}.png")
	  
		#decodes the QR code and returns True if successful
		my_QR.decode()
		  
		#prints the data
		flag.append(my_QR.data)
	
	print(''.join(flag))

extracr_QR_data()