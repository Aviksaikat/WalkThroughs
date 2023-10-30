from secret import FLAG

HEX_CHARS = '0123456789abcdef'
B64_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'


def to_hex(data):
    data = int.from_bytes(data, 'big')
    encoded = ''
    while data:
        i = data % 16
        encoded = HEX_CHARS[i] + encoded
        data >>= 4
    return '0' * (len(encoded) % 2) + encoded


def to_base64(data):
    padding_length = 0

    if len(data) % 3 != 0:
        padding_length = (len(data) + 3 - len(data) % 3) - len(data)

    data += b'\x00' * padding_length
    bits = ''.join([bin(c)[2:].zfill(8) for c in data])
    blocks = [bits[i:i+6] for i in range(0, len(bits), 6)]

    encoded = ''
    for block in blocks:
        encoded += B64_CHARS[int(block, 2)]

    return encoded[:-padding_length] + '=' * padding_length


def main():
    first_half = FLAG[:len(FLAG)//2]
    second_half = FLAG[len(FLAG)//2:]

    hex_encoded = to_hex(first_half)
    base64_encoded = to_base64(second_half)

    with open('output.txt', 'w') as f:
        f.write(f'{hex_encoded}\n{base64_encoded}')

main()
