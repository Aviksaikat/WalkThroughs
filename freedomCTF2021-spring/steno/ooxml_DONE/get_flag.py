#!/usr/bin/python3

import zipfile
import re
import codecs

with open("./FreedomCTF.docx", "rb") as f:
	zip = zipfile.ZipFile(f)
	xml_content = zip.read("word/styles.xml").decode("utf-8")

#print(xml_content) 
# <!--F1@g: u1qq3a_grkg_1244 (r13)-->

rot13_flag = re.findall(r"<!--.*>$", xml_content)[0][10:26]
#print(rot13_flag)

print("flag{%s}" % (codecs.encode(rot13_flag, 'rot_13')))



