picoCTF{1n_7h3_|<3y_of_54ef6292}
picoCTF{1n_7h3_|<3y_of_PRITCHARD}
PRITCHARD



>>> import hashlib
>>> hash = hashlib.sha256(b"PRITCHARD").hexdigest()
>>> print(hash)
496e54f222f256b023f33cdda0270853f39d7bf24fa1ca6b72d4b4fd1a9cae56


hash[4] + hash[5] + hash[3] + hash[6] + hash[2] + hash[7] + hash[1] + hash[8]


54ef6292