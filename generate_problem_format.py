import os, glob, json

PROBLEM_FILE = "problem.txt"
HINT_FILE = "hint.txt"
GRADER_FILE = "grader.py"
WEIGHTMAP_FILE = "sample-weightmap.json"
RELEASE_FOLDER = "release"

files = glob.glob("./*")
folders = []
for name in files:
    if not os.path.isfile(name):
        folders.append(name)

template = """
{{
    "name": "{name}",
    "score": {score},
    "category": "",
    "grader": "{grader}",
    "description": "{description}",
    "threshold": {threshold},
    "weightmap": {weightmap},
    "hint": "{hint}"
}}
"""

problems = []
for folder in folders:
    folder += "/"
    problem_name = folder[2:folder.find("_")]
    problem_score = 0 if folder.find("_") == -1 else folder[folder.find("_")+1:]
    try:
        problem_description = open(folder + PROBLEM_FILE, "r").read()
    except IOError, e:
        print e
        problem_description = ""
    try:
        problem_hint = open(folder + HINT_FILE, "r").read()
    except IOError, e:
        print e
        problem_hint = ""
    try:
        weightmaps = json.loads(open(folder + WEIGHTMAP_FILE, "r").read())
        problem_threshold = weightmaps["threshold"]
        problem_weightmap = weightmaps["weightmap"]
    except IOError, e:
        problem_weightmap = "{}"
        problem_threshold = 0
    problem_grader = folder + GRADER_FILE
    problems.append(template.format(
        name = problem_name,
        score = problem_score,
        grader = problem_grader,
        description = problem_description.replace("\n","<br>"),
        hint = problem_hint.replace("\n","<br>"),
        threshold = problem_threshold,
        weightmap = problem_weightmap
    ))

for problem in problems:
    print problem
