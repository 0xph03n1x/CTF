#!/usr/bin/python3

from string import ascii_lowercase

numbers = [16, 9, 3, 15, 3, 20, 6, '{', 20, 8, 5, 14, 21, 13, 2, 5, 18, 19, 13, 1, 19, 15, 14, '}']

flag = []

for i in numbers:
	if type(i) == str:
		flag.append(i)
	else:
		flag.append(ascii_lowercase[i-1])
print(''.join(flag))