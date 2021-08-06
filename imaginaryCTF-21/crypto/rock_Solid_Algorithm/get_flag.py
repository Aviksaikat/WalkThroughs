#!/usr/bin/python3

from Crypto.Util.number import inverse
import gmpy2
import binascii
# https://gmpy2.readthedocs.io/en/latest/mpfr.html

n = 18718668654839418101060350414897678724581774081742102287908765212690862231899547405582997157020093499506177632395430572542600019258424947803591395926472246347413986531437177801754324606200243710836609694453888894668656807471052095014376204102474311740080044776201105722801365112971807912406879483156845216746137339614577267869908065296042390812575960639865867729920434603853708907147465162697098688239587320232595412227310236678367
e = 5

ct = 4061448515799106340420739691775850071489215699577921072934942485890519294380069123037340174441242842518682390853378784679825023237216051766738593812159344136064529711265570171627670665806072255545198689928996413238102114126558579154343844959868438278433954975590137693439216155482228025380904377837299357044104373966173149290333194304831238889245126840666444234215617022142380016275718234640045049962318290976661640301222078289152



with gmpy2.local_context(gmpy2.context(), precision=800) as ctx:
	ctx.precision += 800
	root = gmpy2.cbrt(ct)

try:
	print(binascii.unhexlify(str("%d" % + int(root))))
except AttributeError:
	print(bytes.fromhex(str("%x" % + int(root))).decode())