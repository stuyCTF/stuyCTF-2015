#! /usr/bin/python
import os, glob, json, shutil, sys

PROBLEM_FILE = "problem.txt"
HINT_FILE = "hint.txt"
GRADER_FILE = "grader.py"
WEIGHTMAP_FILE = "weightmap.json"
RELEASE_FOLDER = "release"

SERVER_FOLDER = "STUYCTF_SERVER/"

try:
    shutil.rmtree(SERVER_FOLDER)
except:
    pass

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

files = glob.glob("./*")
folders = []
for name in files:
    if not os.path.isfile(name) and not name == "./sample":
        folders.append(name)

os.mkdir(SERVER_FOLDER)

problems = []
for folder in folders:
    folder += "/"
    problem_name = folder[2:folder.find("_")]
    problem_score = 0 if folder.find("_") == -1 else folder[folder.find("_")+1:]
    try:
        problem_description = open(folder + PROBLEM_FILE, "r").read()
    except IOError, e:
        print "Looking for problem file...", e
        problem_description = ""
    try:
        problem_hint = open(folder + HINT_FILE, "r").read()
    except IOError, e:
        #print "Looking for hint file...", e
        problem_hint = ""
    try:
        weightmaps = json.loads(open(folder + WEIGHTMAP_FILE, "r").read())
        problem_threshold = weightmaps["threshold"]
        problem_weightmap = weightmaps["weightmap"]
    except IOError, e:
        problem_weightmap = "{}"
        problem_threshold = 0
    problem_grader = folder + GRADER_FILE
    problem = template.format(
        name = problem_name,
        score = problem_score,
        grader = problem_grader,
        description = problem_description.replace("\n","<br>").replace('"','\\"'),
        hint = problem_hint.replace("\n","<br>").replace('"', '\\"'),
        threshold = problem_threshold,
        weightmap = problem_weightmap
    )
    problems.append(problem)
    try:
        os.mkdir(SERVER_FOLDER + problem_name)
        f = open(SERVER_FOLDER + problem_name + "/problem.json", "w")
        f.write(problem)
        f.close()
    except OSError, e:
        print "Setting up problem.json...", e
    try:
        shutil.copytree(folder + RELEASE_FOLDER, SERVER_FOLDER + problem_name + "/static/")
    except OSError, e:
        #print "Copying release folder...", e
        pass
    try:
        os.mkdir(SERVER_FOLDER + problem_name + "/grader")
        shutil.copy(folder + "grader.py", SERVER_FOLDER + problem_name + "/grader")
    except IOError, e:
        print "Copying grader.py...", e

'''
for problem in problems:
    print problem
'''
