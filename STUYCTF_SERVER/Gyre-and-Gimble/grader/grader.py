# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flag = "stuyctf{andtovesandthemimsyborogovesmomebewaremyjawsthecatchjubjubshunbandersnatchhisintimefoesobytreeawhileanduffishstoodwithflamethroughwoodasonetwoandvorpalsnickersnackitwithhebackthoujabberwock?mybeamishfrabjouscallayintwasthedidgimblewabewereandraths}"
def grade(arg, key):
    if key == flag:
        return True, "Come to my arms, my beamish boy!"
    else:
        return False, "Nonsense!"
