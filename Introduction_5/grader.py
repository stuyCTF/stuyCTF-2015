# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{here's_a_free_flag}"

def grade(arg, key):
    if key == flag:
        return True, "Correct! Good luck with the rest of the problems! :)"
    else:
        return False, "Incorrect"
