# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

def grade(arg, key):
    key = key.lower()
    if ("udp" in key or "user datagram protocol" in key) and ("tcp" in key or "transmission control protocol" in key):
        return True, "Correct"
    else:
        return False, "Incorrect"
