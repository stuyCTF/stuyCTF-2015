# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{ZaBari's_Recon_WUZ_Annoy!ng}"

def grade(arg, key):
    if key == flag:
        return True, "I knew I made this problem too easy..."
    else:
        return False, ":( I love you and I'm sorry this is a recon."
