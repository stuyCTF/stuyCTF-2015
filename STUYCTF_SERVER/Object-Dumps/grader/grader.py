# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

allowed_chars = "1234567890abcdef"

def extract_hex_chars(input_string):
    return ''.join([i for i in input_string if i in allowed_chars])

flag = "080484c1"

def grade(arg, key):
    if extract_hex_chars(key) == flag:
        return True, "Correct"
    else:
        return False, "Incorrect"

print grade(1, "stuyctf{*0x80484c1}")
