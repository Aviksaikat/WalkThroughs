#!/bin/bash

strings garden.jpg | grep "picoCTF{.*}" | cut -d " " -f5 | tr '"' "\b"
