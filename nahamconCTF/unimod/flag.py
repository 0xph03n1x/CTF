import random

ct = open('out', 'r').read()
k = random.randrange(0,0xFFFD)

clear = ''

for c in ct:
	clear += chr((ord(c) + k) % 0xFFFD)

open('clear', 'w').write(clear)