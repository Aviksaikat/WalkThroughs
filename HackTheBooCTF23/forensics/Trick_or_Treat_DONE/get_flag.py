#!/usr/bin/python3
from re import findall

hex_data = "7b68737e697472733d596f726d5f726530486d71727c793d661717465e70797178695f74737974737a353440176d7c6f7c703d35173d3d3d3d17464d7c6f7c707869786f3d35507c73797c69726f643d203d39496f6878313d4b7c7168785b6f72704d746d78717473783d203d39496f6878344017465c71747c6e353f7b3f344017466e696f74737a40394e72686f7e785b7471784d7c697517343d1739596f726d5f72655c7e7e786e6e49727678733d203d3f55495f666e2964424d68706d762c2c2c2c2c2c2c733c3c3c603f17397268696d68695b7471783d203d4e6d717469304d7c69753d394e72686f7e785b7471784d7c69753d3071787c7b1739497c6f7a78695b7471784d7c6975203f32397268696d68695b7471783f17397c6f7a3d203d3a663d3f6d7c69753f273d3f3a3d363d39497c6f7a78695b7471784d7c69753d363d3a3f313d3f707279783f273d3f7c79793f313d3f7c6869726f78737c70783f273d696f6878313d3f706869783f273d7b7c716e783d603a17397c686975726f74677c697472733d203d3f5f787c6f786f3d3f3d363d39596f726d5f72655c7e7e786e6e4972767873173975787c79786f6e3d203d53786a30527f77787e693d3f4e646e697870335e727171787e697472736e335a7873786f747e3359747e697472737c6f6446464e696f74737a4031464e696f74737a40403f173975787c79786f6e335c7979353f5c686975726f74677c697472733f313d397c686975726f74677c6974727334173975787c79786f6e335c7979353f596f726d7f7265305c4d54305c6f7a3f313d397c6f7a34173975787c79786f6e335c7979353f5e7273697873693049646d783f313d3a7c6d6d71747e7c6974727332727e697869306e696f787c703a341754736b727678304f786e695078697572793d30486f743d7569696d6e2732327e72736978736933796f726d7f72657c6d74337e7270322f327b7471786e32686d71727c793d305078697572793d4d726e693d3054735b7471783d394e72686f7e785b7471784d7c69753d3055787c79786f6e3d3975787c79786f6e176017176a75747178352c346617173d3d5c79793049646d783d305c6e6e78707f7164537c70783d4e646e697870334a747379726a6e335b726f706e314e646e69787033596f7c6a74737a17173d3d396e7e6f7878736e3d203d464a747379726a6e335b726f706e334e7e6f7878734027275c71714e7e6f7878736e17173d3d3969726d3d3d3d3d203d35396e7e6f7878736e335f726873796e3349726d3d3d3d3d613d50787c6e686f7830527f77787e693d3050747374706870343350747374706870173d3d3971787b693d3d3d203d35396e7e6f7878736e335f726873796e3351787b693d3d3d613d50787c6e686f7830527f77787e693d3050747374706870343350747374706870173d3d396a747969753d3d203d35396e7e6f7878736e335f726873796e334f747a75693d3d613d50787c6e686f7830527f77787e693d30507c65747068703433507c6574706870173d3d397578747a75693d203d35396e7e6f7878736e335f726873796e335f72696972703d613d50787c6e686f7830527f77787e693d30507c65747068703433507c657470687017173d3d397f726873796e3d3d3d203d46596f7c6a74737a334f787e697c737a71784027275b6f727051494f5f353971787b69313d3969726d313d396a74796975313d397578747a756934173d3d397f706d3d3d3d3d3d3d203d53786a30527f77787e693d3049646d78537c70783d4e646e69787033596f7c6a74737a335f7469707c6d3d305c6f7a687078736951746e693d354674736940397f726873796e336a7479697534313d354674736940397f726873796e337578747a756934173d3d397a6f7c6d75747e6e3d203d46596f7c6a74737a335a6f7c6d75747e6e4027275b6f727054707c7a7835397f706d3417173d3d397a6f7c6d75747e6e335e726d645b6f72704e7e6f78787335397f726873796e3351727e7c69747273313d46596f7c6a74737a334d7274736940272758706d6964313d397f726873796e336e7467783417173d3d397f706d334e7c6b78353f3978736b27484e584f4d4f525b545158415c6d6d597c697c4151727e7c71414978706d413978736b277e72706d6869786f737c7078305e7c6d69686f78336d737a3f34173d3d397a6f7c6d75747e6e3359746e6d726e783534173d3d397f706d3359746e6d726e783534173d3d173d3d6e697c6f69306e7178786d3d304e787e7273796e3d2c28173d3f3978736b27484e584f4d4f525b545158415c6d6d597c697c4151727e7c71414978706d413978736b277e72706d6869786f737c7078305e7c6d69686f78336d737a3f3d613d596f726d5f726530486d71727c791760"


cipher_text = bytes.fromhex(hex_data).decode()

encoded_string = ''
for char in cipher_text:
    xored_char = chr(ord(char) ^ 0x1d)
    encoded_string += format(ord(xored_char), '02x')

decrypted_data = bytes.fromhex(encoded_string).decode()

# print(decrypted_data)

flag = findall("HTB{.*}", decrypted_data)[-1]

print(flag)
