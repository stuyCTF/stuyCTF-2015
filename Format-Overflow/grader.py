# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{0V3rfl0w_format_string_l34k}"

def grade(arg, key):
    if key == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"
