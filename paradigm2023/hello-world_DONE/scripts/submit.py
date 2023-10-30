from pwn import *


def submit():
    c = connect("hello-world.challenges.paradigm.xyz", 1337)
    c.recv()
    ticket = "clo9cwwg406q5s619oair9kww"
    c.sendline(ticket.encode())
    c.recv()
    c.send(b"1")

    print(c.recv())


if __name__ == "__main__":
    submit()