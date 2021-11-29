require 'base64'
require 'openssl'

key = "my_Nice_secret_key"

new_header = "eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0K"

new_payload = "eyJ1c3IiOiJhZG1pbiIsImFkbWluIjp0cnVlfQo"

data = new_header+"."+new_payload

#signature = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), key, data))

signature = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), key, data))


puts(data+"."+signature)