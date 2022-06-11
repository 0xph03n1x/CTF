#!/usr/bin/python3

a = ''
p = 320907854534300658334827579113595683489
g = 3
#A = pow(g,a,p) #236498462734017891143727364481546318401

for i in range(0,10000000000):
	i += 1
	x = pow(g,i,p)
	if str(x) == "236498462734017891143727364481546318401":
		print("Found answer: ", i)
	else:
		#print("Testing for number ", i)
		print("Result for ", i, "is ", x)