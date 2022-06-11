#3 arrays in total - files, alphabet and shuffled
#files is ['./study-guide.txt', './flag.txt']
#alphabet is ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
#shuffled is a random order of alphabet
#dictionary is a dictionary aggregated by zip() and made into a tuple & returned of alphabet and shuffled
#text is similar to study guide

import random
import os

files = [
    os.path.join(path, file)
    for path, dirs, files in os.walk('.')
    for file in files
    if file.split('.')[-1] == 'txt'
]

print("Files: ", files)

alphabet = list('abcdefghijklmnopqrstuvwxyz')
random.shuffle(shuffled := alphabet[:])

print("Alphabet: ",  alphabet)
print("Shuffled: ", shuffled)


dictionary = dict(zip(alphabet, shuffled))

print("Dictionary: ", dictionary)

for filename in files:
    text = open(filename, 'r').read()
