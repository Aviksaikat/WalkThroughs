#!/usr/bin/python2.7

import hashpumpy

hash_we_have = "184b5d255817fc0afe9316e67c8f386506a3b28b470c94f47583b76c7c0ec1e5"


def gen(key_len):
	new_hash, msg = hashpumpy.hashpump(hash_we_have, "read.php", ":index.php:guinjutsu.php", key_len)

	return new_hash, msg

if __name__ == '__main__':
	print(gen(42))