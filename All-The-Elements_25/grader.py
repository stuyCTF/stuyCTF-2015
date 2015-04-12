# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{look_for_the_static_directory}"

def grade(arg, key):
    if key == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"
