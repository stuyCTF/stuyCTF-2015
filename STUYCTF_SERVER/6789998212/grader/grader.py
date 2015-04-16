# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{MUZIKISG00D}"

def grade(arg, key):
    if key == flag:
        return True, "call me bby ;)"
    else:
        return False, "La la la, I can't hear you!"
