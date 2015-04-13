# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used
flag="stuyctf{beep_beep_scanned!}"

def grade(arg, key):
    if key == flag:
        return True, "Damn straight!"
    else:
        return False, "Oh nahh"
