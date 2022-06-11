#!/usr/bin/python3


a = input("Enter hex number: ")
a = a[2:]
bytes_obj = bytes.fromhex(a)
ascii_str = bytes_obj.decode("ASCII")
print(ascii_str)


#hex = "0x70"[2:]
#bytes_object = bytes.fromhex(hex)
#ascii_str = bytes_object.decode("ASCII")
#print(ascii_str)
