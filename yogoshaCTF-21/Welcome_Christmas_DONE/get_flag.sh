#!/bin/bash

exiftool 51773456833_95c363f276_o.png | grep -E "Yogosha{.*" | awk '{print $4}'
