#!/bin/bash

zsteg zstegosaurus.png | cut -d ":" -f2 | head -1 | while read line; do echo "bactf{$line}"; done
