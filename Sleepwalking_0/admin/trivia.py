import os, sys

class UnbufferedStream(object):
    def __init__(self, stream):
        self.stream = stream
    def write(self, data):
        self.stream.write(data)
        self.stream.flush()
    def __getattr__(self, attr):
        return getattr(self.stream, attr)

sys.stdout = UnbufferedStream(sys.stdout)

s = raw_input("Welcome. what's the final answer from my comment?\n")
if "cloud atlas" not in s.lower():
    print "nah that's wrong\n"
    os._exit(0)
print "the perfect four: flac & mp3 320 and mp3 v0 and mp3 v2.\nit's the best kind of merch."
s = raw_input("the number of donor points squared times 30 plus my year of birth:\n")
if "2117" not in s:
    print "nope\n"
    os._exit(0)
print "the flag is near, and so are you,\nso don't be sad, and don't feel blue.\ni know you hate me, don't be a diva,"
s = raw_input("the name of my middle school is:\n")
if "barkai yeshiva" not in s.lower() and "barkai yeshivah" not in s.lower():
    print "cmon..."
    os._exit(0)
print "damn you good\nstuyctf{You_only_thought_you_hated_Zabari_after_Hunt...LOL}\n"
