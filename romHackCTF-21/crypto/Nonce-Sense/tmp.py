from Crypto.Util.number import *
import Crypto.PublicKey.DSA
from Crypto.Hash import SHA
import socketserver
import signal
import time
from itertools import cycle
# #from secret import KEY, FLAG

# class DSA:
# 	def __init__(self):
# 		= Crypto.PublicKey.DSA.generate(2048)

# 	def get_k(self, msg):
# 		kmax = q
# 		msg = [ a ^ b for (a,b) in zip(msg, cycle(KEY)) ]
# 		msg = bytes(msg)
# 		k = bytes_to_long(msg) % q
# 		return msg, k

	# def sign(self,h,k):
	# 	r = pow(g,k,p)%q
	# 	try:
	# 		s = (inverse(k, q) * (h+ x * r)) % q
	# 		return r, s
	# 	except ZeroDivisionError:
	# 		return None

# 	def verify(self, m, r, s):
# 		w = inverse(s, q)
# 		m = bytes_to_long(SHA.new(m).digest())
# 		u1 = (m * w) % q
# 		u2 = (r * w) % q
# 		v = (pow(g, u1, p) * pow(y, u2, p)) % p % q
# 		if v == r:
# 			return True
# 		return False

# def challenge(req):
# 	dsa = DSA()
# 	h = SHA.new(msg).digest()
# 	msg,k = dsa.get_k(msg)
# 	h = bytes_to_long(h)
# 	r, s = dsa.sign(h,k)


p = 0xe00270ca80df71b89204c921ad6f02ea1af43b97ac1bef67ee02ef4b16fc9df1db19d684a78a8844ccb1ea7cc8beee8db8412859bee19749c1e3dfe36a399d1a97ce1c22613ff52f3ed413f110e11f33f5f8a32e6706f303d3b3efd5e9293b49fd019151a6f2777e87db3991200da8af60b7caef09a8a786a60d15639fc3c077d4e26bb035eda7726d074c900f0021437da60559008152569732712a6d803cea74369d7ecf2feadc791cb84a30c4604df2dab9ed21f6a6f60efc90c9252b6e9436521c85bd1fb9d41ea3352052ad2e80090190957e3a7d727165b545a6a20dcd2d4c28080d906d47a0bb09aacf0fcd4eeaa24a9214b8517a866bb56da9c35b33
q = 0xd891f061ab622e6e47b7ed977c99d7eb181a5beee10161af0aba1957
g = 0x96bce74bdd234b30b8ba3b5e76591db3b37b161e0c51a540f352815dffd2461c6e1b77628d1ae5af0207d08178c526de26d81c3ffebdcf291c662bc475c8c5bc94560f398000fe3ec50b974c1832eb7f9e63b96c75a1a770e7af4517462bf5b162d20c4aea638fc0a9bac2890fed39cc6afbbfa3d8688afb3f2a6afe862c3b55094b773fc3dd25922c64426f93599b22798ff58ab2680c4f32273afdeff4db837a47c4d7e4affb48e97dad82c234cfbd44bf8c2b3e56d4fe06bbcbc715cca5f4b575a06edb870469da421843df5f7a284ce036745adf5699799e6571dae792d685719507ae04c9b8bb2ed6b1e81ebd616bde2e6a433b5498a57d3f2c16ba1467
y = 0x8e3cb5873338e3ccb6a0f75bd2ed9c7403bbf349d4cfc6c2d477715d2d74a4e1f62742d5a8516ae137c11845edc27ce6bcd67a49d107fa4af0f01aff62dd1c2a260b399041062bb6ded8799560715857cc9851dc6c445046b93a6a835fd55225cbdb4b291e614b3351eb4ef065dad39df3adad43948e9065d79ea83ceb9f0e01a446feddfde350a752e23dd6c7d6680539ab7e70db20efc1a810b1f71bd816ecf8a5f7ad93390c971e1841a0e092c044c6516f11a98c28374245695815126a518ea6f49b9fa5a436bd8f857ffa6ddb750c03be4cf12ca3260b9378ffd247b3ec27c6232e615e73799340ba30fa69990db5ce40d69fa6ecee094ee57432da049


def get_key(msg, KEY):
	msg = [ a ^ b for (a,b) in zip(msg, cycle(KEY)) ]
	msg = bytes(msg)
	k = bytes_to_long(msg) % q
	return msg, k

KEY, k = get_key("give me flag".encode(), ("67697665206d6520666c6167".encode()))

def get_k(msg):
	kmax = q
	msg = [ a ^ b for (a,b) in zip(msg, cycle(KEY)) ]
	msg = bytes(msg)
	k = bytes_to_long(msg) % q
	return msg, k


def sign(h, k):
	r = pow(g,k,p)%q
	try:
		s = (inverse(k, q) * (h + x * r)) % q
		return r, s
	except ZeroDivisionError:
		return None

msg = "give me flag".encode()

h = SHA.new(msg).digest()
msg, k = get_k(msg)
h = bytes_to_long(h)
r, s = sign(h,k)

print(r, s)