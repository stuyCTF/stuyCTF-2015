# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{Nevar_use_k0nstant_seeds}"

def grade(arg, key):
    if key == flag:
        return True, "Bang Bang!"
    else:
        return False, "WRONG WRONG WRONG"
