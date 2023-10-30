#!/usr/bin/python3

# Thanks to mrtacocat on discord for sharing this 

import sys

sys.path.append("../")
from qiling import *
from qiling.const import *
from qiling.const import QL_INTERCEPT
from qiling.os.const import BYTE, STRING


def my_sleep(ql: Qiling):
	return 0

def my_puts(ql: Qiling):
	params = ql.os.resolve_fcall_params({"s": STRING})
	s = params["s"]
	return len(s)

def my_printf(ql: Qiling):
	params = ql.os.resolve_fcall_params({"s": STRING, "x": BYTE})
	if params["s"] == "%c\n":
		print("%c" % params["x"], end='')
	return QL_CALL_BLOCK

def my_putchar(ql: Qiling):
	return QL_CALL_BLOCK


q = Qiling(["rev_ouija/ouija"], "/home/avik/tools/rootfs/x8664_linux", verbose=QL_VERBOSE.OFF)
q.os.set_api('sleep', my_sleep, QL_INTERCEPT.CALL)
q.os.set_api('puts', my_puts, QL_INTERCEPT.CALL)
q.os.set_api('printf', my_printf, QL_INTERCEPT.ENTER)
q.os.set_api('putchar', my_putchar, QL_INTERCEPT.ENTER)
q.run()

print()