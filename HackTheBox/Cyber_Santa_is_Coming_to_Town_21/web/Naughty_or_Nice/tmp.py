import base64, binascii

print(base64.urlsafe_b64encode(binascii.unhexlify('2628299d1328987af80815c5d0ee1beb9bdab5d1864b12c8166b4c23cd985317').replace('=','')))