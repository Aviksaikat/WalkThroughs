#!/bin/bash

wget -q "http://web.bcactf.com:49157/code.wasm" 

strings code.wasm | grep "bcactf{.*"
