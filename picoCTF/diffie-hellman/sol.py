#!/usr/bin/python3
import string

# alphabet = string.ascii_uppercase
alph_num = {1:'a', 2:'b', 3:'c', 4:'d', 5:'e', 6:'f', 7:'g', 8:'h', 9:'i', 10:'j', 11:'k', 12:'l', 13:'m', 14:'n', 15:'o', 16:'p', 17:'q', 18:'r', 19:'s', 20:'t', 21:'u', 22:'v', 23:'w', 24:'x', 25:'y', 26:'z', 27:'0', 28:'1', 29:'2', 30:'3', 31:'4', 32:'5', 33:'6', 34:'7', 35:'8', 36:'9'} 
ascii_uppercase = string.ascii_uppercase

message = "H98A9W_H6UM8W_6A_9_D6C_5ZCI9C8I_8F7GK99J"

P = 13
G = 5

a = 7

# Generated key
x = int(pow(G,a,P))

b = 3

# Generated key
y = int(pow(G,b,P))

# Secret key for Alice
ka = int(pow(y,a,P))

# Secret key for Bob
kb = int(pow(x,b,P))

print("The secret numbers for Alice and Bob are: ", ka, "and", kb)

# Attempt to shift the number in the message

number = []
decoded = []

for i in message:
	number.append(ord(i) - 5)

for n in number:
	if n in range(48, 58):
		decoded.append(chr(n))
	elif n in range(59,65):
		n -= 7
		decoded.append(chr(n))
	elif n == 90:
		n += 5
		decoded.append(chr(n))
	elif n in range(65, 91):
		decoded.append(chr(n))

print("The flag is: ", end='')
print(''.join(map(str, decoded)))