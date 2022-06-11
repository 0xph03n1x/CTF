#!/usr/bin/python3
import string

#dict = {"0" : "A", "1" : "B", "2" : "C", "3" : "D", "4" : "", "5" : "C", "6" : "7", "8" : "9", "10" : "11", "12" : "C", "13" : "C", "14" : "C", "15" : "C", "16" : "C", "17" : "C", "18" : "C", "19" : "C", "20" : "C", "21" : "C", "22" : "C", "23" : "C", "24" : "C", "25" : "C", "26" : "C", "2" : "C",  }

ascii_uppercase = dict(enumerate(string.ascii_uppercase))
#alphabet {1:'a', 2:'b', 3:'c', 4:'d', 5:'e', 6:'f', 7:'g', 8:'h', 9:'i', 10:'j', 11:'k', 12:'l', 13:'m', 14:'n', 15:'o', 16:'p', 17:'q', 18:'r', 19:'s', 20:'t', 21:'u', 22:'v', 23:'w', 24:'x', 25:'y', 26:'z'} 

msg = [91, 322, 57, 124, 40, 406, 272, 147, 239, 285, 353, 272, 77, 110, 296, 262, 299, 323, 255, 337, 150, 102]
decrypt = []
flag = []

for n in range(len(msg)):
	a = msg[n]
	a = a % 37
	decrypt.append(a)

print(decrypt)

for element in decrypt:
	print(element)
	if element <= 25:
		flag.append(ascii_uppercase[element])
	elif element == 36:
		flag.append("_")
	else:
		flag.append(element-26)

print(''.join(map(str, flag)))







# [17, 26, 20, 13, 3, 36, 13, 36, 17, 26, 20, 13, 3, 36, 0, 3, 3, 27, 33, 4, 2]
# [17, 26, 20, 13, 3, 36, 13, 36, 17, 26, 20, 13, 3, 36, 0, 3, 3, 27, 33, 4, 2, 28]