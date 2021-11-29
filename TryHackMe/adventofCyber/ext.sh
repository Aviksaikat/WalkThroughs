#!/bin/bash
#extract all zip files in a dir & delete the origin file

for F in *.zip;
do
  echo "[*]Extracting"
  unzip $F
  rm $F
done
