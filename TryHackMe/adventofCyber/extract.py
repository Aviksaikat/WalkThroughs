#!/usr/bin/env python3 

import os
import sys
from zipfile import ZipFile

#os.remove(filename)

def ext(listOfFileNames):
	for fileName in listOfFileNames:
		if fileName.endswith('.zip'):
			#Extract a single file from zip
			zipObj.extract(fileName,path="zip")
			os.remove(fileName)
		
def main(l):
	for i in l:
		with ZipFile(i, 'r') as zipObj:
			# Get a list of all archived file names from the zip
			listOfFileNames = zipObj.namelist()
			#Iterate over the file names
			print("[*]Extracting")
			ext(listOfFileNames)
	   
			#print(listOfFileNames)

l = os.listdir("/home/avik/Desktop/CTFs/WalkThroughs/TryHackMe/adventofCyber/zip")

while(l.endswith(".zip")):
	main(l)