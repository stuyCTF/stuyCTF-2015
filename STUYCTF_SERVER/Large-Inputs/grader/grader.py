# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

import re
expression = r'stuyctf{(\d+)}' # extract only the number

flag_range = (6981766566676, 6981767868659) # someone else should make sure that this range is the only range possible

def grade(arg, key):
    number = re.findall(expression, key)
    if flag_range[0] <= int(number[0]) <= flag_range[1]:
        return True, "Correct! This was a tough one :)"
    else:
        return False, "Incorrect, but if the program tells you that you are correct, please notify an admin on the chat!"
