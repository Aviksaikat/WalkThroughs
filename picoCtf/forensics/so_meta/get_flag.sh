#!/bin/bash

strings pico_img.png | grep  "picoCTF{.*}" | sed s/K/" "/g
