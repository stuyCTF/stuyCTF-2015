# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{38441}"

def grade(arg, key):
    if key == flag:
        return True, "That's a lot of text"
    else:
        return False, "tsk tsk"
