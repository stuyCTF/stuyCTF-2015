#!/usr/bin/python
# -*- coding: utf-8 -*-

# Python grader file
# Return True if flag is correct, False otherwise
# A message is also required to be returned along with the boolean
#     Custom messages such as `return False, "OOOFFF SO CLOSE"` can be used

flags = [
"stuyctf{andtovesandthemimsyborogovesmomebewaremyjawsthecatchjubjubshunbandersnatchhisintimefoesobytreeawhileanduffishstoodwithflamethroughwoodasonetwoandvorpalsnickersnackitwithhebackthoujabberwockmybeamishfrabjouscallayintwasthedidgimblewabewereandraths}",
"stuyctf{andtovesandthemimsyborogovesmomebewaremyjawsthecatchjubjubshunbandersnatchhisintimefoehetumtumstoodthoughtinhejabberwockofwhifflingtulgeyburbledcameonethroughthewentleftandheadgalumphinghasthetomyocalloohchortledjoyandtovesandthemimsyborogovesmome}"
]

punctuation = "!;?.,'\"—-"

def grade(arg, key):
    for punc in punctuation:
        key = key.replace(punc, "")
    if key in flags:
        return True, "Come to my arms, my beamish boy!"
    else:
        return False, "Nonsense!"
