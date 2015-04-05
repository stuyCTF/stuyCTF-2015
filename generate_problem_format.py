#! /usr/bin/python
import os, glob, json, shutil, sys

PROBLEM_FILE = "problem.txt"
HINT_FILE = "hint.txt"
GRADER_FILE = "grader.py"
WEIGHTMAP_FILE = "weightmap.json"
RELEASE_FOLDER = "release"
SERVER_FOLDER = "STUYCTF_SERVER/"

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

# Remove old server folder and create a new one
shutil.rmtree(SERVER_FOLDER, ignore_errors=True)
os.mkdir(SERVER_FOLDER)

EXCLUDE_DIRS = ["./sample", "./STUYCTF_SERVER"]
# Get list of all folders in current directory
folders = [f+"/" for f in glob.glob("./*") if not os.path.isfile(f) and f not in EXCLUDE_DIRS]

problems = []
for folder in folders:
    # Problem name format: PROBLEM-NAME_SCORE
    problem_name = folder[2:folder.find("_")]
    problem_score = 0 if folder.find("_") == -1 else folder[folder.find("_")+1:-1]
    problem_description = ""
    problem_hint = ""
    problem_threshold = 0
    problem_weightmap = {}
    problem_grader = folder[:folder.find("_")] + '/' + GRADER_FILE
    try:
        with open(folder + PROBLEM_FILE, "r") as f:
            problem_description = f.read()
    except IOError, e:
        print "Missing problem file...", e
    try:
        with open(folder + HINT_FILE, "r") as f:
            problem_hint = f.read()
    except IOError, e:
        #print "Missing hint file...", e
        pass
    try:
        with open(folder + WEIGHTMAP_FILE, "r") as f:
            weightmaps = json.loads(f.read())
            problem_threshold = weightmaps["threshold"]
            # Convert dashes "-" to spaces " " for later pid (problem id) hashing
            for key, value in weightmaps["weightmap"].iteritems():
                problem_weightmap[key.replace('-', ' ')] = value
    except IOError, e:
        #print "Missing weightmap file...", e
        pass
    problem = template.format(
        name = problem_name.replace("-"," "),
        score = problem_score,
        grader = problem_grader,
        description = problem_description.replace("\n","<br>").replace('"','\\"'),
        hint = problem_hint.replace("\n","<br>").replace('"', '\\"'),
        threshold = problem_threshold,
        weightmap = json.dumps(problem_weightmap)
    )
    problems.append(problem)
    try:
        os.mkdir(SERVER_FOLDER + problem_name)
        with open(SERVER_FOLDER + problem_name + "/problem.json", "w") as f:
            f.write(problem)
    except OSError, e:
        print "Error writing problem.json...", e
    try:
        shutil.copytree(folder + RELEASE_FOLDER, SERVER_FOLDER + problem_name + "/static/")
    except OSError, e:
        #print "Error copying release folder...", e
        pass
    try:
        os.mkdir(SERVER_FOLDER + problem_name + "/grader")
        shutil.copy(folder + GRADER_FILE, SERVER_FOLDER + problem_name + "/grader")
    except IOError, e:
        print "Error copying grader.py...", e

'''
for problem in problems:
    print problem
'''
