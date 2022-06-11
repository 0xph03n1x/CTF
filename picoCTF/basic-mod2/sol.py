#!/usr/bin/python3
import string
#Take each number mod 41 and find the modular inverse for the result. Then map to the following character set: 1-26 are the alphabet, 27-36 are the decimal digits, and 37 is an underscore.
# ascii_lowercase = dict(enumerate(string.ascii_lowercase))
msg = [104, 290, 356, 313, 262, 337, 354, 229, 146, 297, 118, 373, 221, 359, 338, 321, 288, 79, 214, 277, 131, 190, 377]
flag = [28, 14, 22, 30, 18, 32, 30, 12, 25, 37, 8, 31, 18, 4, 37, 35, 1, 27, 32, 4, 36, 30, 36]
m = 41

alphabet = {1:'a', 2:'b', 3:'c', 4:'d', 5:'e', 6:'f', 7:'g', 8:'h', 9:'i', 10:'j', 11:'k', 12:'l', 13:'m', 14:'n', 15:'o', 16:'p', 17:'q', 18:'r', 19:'s', 20:'t', 21:'u', 22:'v', 23:'w', 24:'x', 25:'y', 26:'z'} 

decrypt = []
flag = []



def find_mod_inv(a,m):

    for x in range(1,m):
        if((a%m)*(x%m) % m==1):
            return x
    raise Exception('The modular inverse does not exist.')

for n in range(len(msg)):
	a = msg[n]
	b = find_mod_inv(a, m)
	decrypt.append(b)


for element in decrypt:
	print(element)
	if element <= 26:
		flag.append(alphabet[element])
	elif element == 37:
		flag.append("_")
	else:
		flag.append(element-27)


print(decrypt)
print(flag)
fl = print(''.join(map(str, flag)))