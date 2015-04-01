stuyCTF
-------

A CTF by Stuy students. For Stuy students. Made with <3 in NYC.

## Problem Directory Layout

```
Problem-name_POINTS/
├── problem.txt (see the formatting in sample-problem.txt)
├── hint.txt (see the formatting in sample-hint.txt)
├── solution.txt
├── grader.py (file to grade the user's input)
├── weightmap.json (file for unlocking problems)
├── release/ (anything given to the players)
│   ├── obfuscated_code.pyc
│   ├── compiled_binary
│   ├── text_file_with_problem_details.txt
└── admin/ (server code, flag generation, encryption, etc.)
    ├── Makefile (this should compile into ../release/)
    ├── file_you_dont_want_players_to_see.txt
    └── another_file_you_dont_want_players_to_see.c
```
