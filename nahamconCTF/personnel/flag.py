#!/usr/bin/env python

import re


flag = open("flag.txt").read()
users = open("users.txt").read()

users += flag

name = "JjJjJjJj"
setting = "0"




results = (users, setting)

#results = [x.strip() for x in results if x or len(x) > 1]

print(users)