#!/bin/bash

strings file | tail -n 28 | head -n 1 | base64 -d 