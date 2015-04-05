# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{/\\|\\|YT|-|1|\\|G5P0551813}"

def grade(arg, key):
    if key == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"
