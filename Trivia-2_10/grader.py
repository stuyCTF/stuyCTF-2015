# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{sigint}"

def grade(arg, key):
    key = key.lower()
    if key == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"
