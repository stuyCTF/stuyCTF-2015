# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{f21c0afc0217e05852bc58febd2b8aa5}"

def grade(arg, key):
    if key == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"
