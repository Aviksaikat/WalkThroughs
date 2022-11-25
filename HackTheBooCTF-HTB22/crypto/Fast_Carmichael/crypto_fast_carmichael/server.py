from secret import FLAG
from Crypto.Util.number import isPrime
import socketserver
import signal


class Handler(socketserver.BaseRequestHandler):

    def handle(self):
        signal.alarm(0)
        main(self.request)


class ReusableTCPServer(socketserver.ForkingMixIn, socketserver.TCPServer):
    pass


def sendMessage(s, msg):
    s.send(msg.encode())


def receiveMessage(s, msg):
    sendMessage(s, msg)
    return s.recv(4096).decode().strip()


def generate_basis(n):
    basis = [True] * n

    for i in range(3, int(n**0.5) + 1, 2):
        if basis[i]:
            basis[i * i::2 * i] = [False] * ((n - i * i - 1) // (2 * i) + 1)

    return [2] + [i for i in range(3, n, 2) if basis[i]]


def millerRabin(n, b):
    basis = generate_basis(300)
    if n == 2 or n == 3:
        return True

    if n % 2 == 0:
        return False

    r, s = 0, n - 1
    while s % 2 == 0:
        r += 1
        s //= 2
    for b in basis:
        x = pow(b, s, n)
        if x == 1 or x == n - 1:
            continue
        for _ in range(r - 1):
            x = pow(x, 2, n)
            if x == n - 1:
                break
        else:
            return False
    return True


def _isPrime(p):
    if p < 1:
        return False
    if (p.bit_length() <= 600) and (p.bit_length() > 1500):
        return False
    if not millerRabin(p, 300):
        return False

    return True


def main(s):
    p = receiveMessage(s, "Give p: ")

    try:
        p = int(p)
    except:
        sendMessage(s, "Error!")

    if _isPrime(p) and not isPrime(p):
        sendMessage(s, FLAG)
    else:
        sendMessage(s, "Conditions not satisfied!")


if __name__ == '__main__':
    socketserver.TCPServer.allow_reuse_address = True
    server = ReusableTCPServer(("0.0.0.0", 1337), Handler)
    server.serve_forever()
