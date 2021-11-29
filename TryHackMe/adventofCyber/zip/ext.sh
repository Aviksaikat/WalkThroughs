#!/bin/bash

for F in *.zip;
do
  echo "[*]Extracting"
  unzip $F
  rm $F
done
