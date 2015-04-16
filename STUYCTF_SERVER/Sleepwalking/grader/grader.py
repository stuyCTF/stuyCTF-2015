# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{You_only_thought_you_hated_Zabari_after_Hunt...LOL}"

def grade(arg, key):
    if key == flag:
        return True, "HELL YES MESSAGE ME FOR KUDOS"
    else:
        return False, "HAHHAHAHHAHAHAHHAHAH"
