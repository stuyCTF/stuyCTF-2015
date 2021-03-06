stuyCTF
-------

A CTF by Stuy students. For Stuy students. Made with :heart: in NYC.

## Deployment

1. Make sure to have a copy of [the stuyCTF Platform](https://github.com/stuyCTF/stuyCTF-Platform) in the same parent directory as this folder
2. Run `./server-setup.sh`
3. Go to the stuyCTF Platform directory and follow the instructions to run the server
4. To deploy problems that provide/require a server, run the
   `start-nc-servers.sh` script. To stop the servers, run the
   `kill-nc-servers.sh` script.

## Problem Directory Layout

Please run `./problem-init.sh PROBLEM-NAME_POINTS` to create problems!

```
Problem-name_POINTS/
├── problem.txt (see the formatting in sample-problem.txt)
├── hint.txt (see the formatting in sample-hint.txt)
├── category.txt (see the formatting in sample-category.txt)
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
