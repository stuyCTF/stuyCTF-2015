import socket, random

HOST = "localhost" # Self-hosting this server
PORT = 50000

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))

print sock.recv(1024)
sock.sendall("RockBeatsScissorsBeatsPaper" + "\n") # This is the authentication password
print sock.recv(1024)


# This is code straight from the AI
# -----------------------------------------------------------
ROCK = 100
PAPER = 101
SCISSORS = 102
toss_choices = {"r": ROCK, "p": PAPER, "s": SCISSORS}
toss_choices_swapped = {n: t for t, n in toss_choices.items()}
history = []
rng = random.SystemRandom()

def choose_best(scores):
    if scores[ROCK] == 0 and scores[PAPER] == 0 and scores[SCISSORS] == 0:
        return False
    choices = []
    max_score = max(scores.values())
    for choice in scores.keys():
        if scores[choice] == max_score:
            choices.append(choice)
            #break # This means that only one choice would be in the list <-- use it to exploit the ai's scoring system
    player_next_toss = rng.choice(choices)
    if player_next_toss == ROCK:
        return PAPER
    elif player_next_toss == PAPER:
        return SCISSORS
    elif player_next_toss == SCISSORS:
        return ROCK

def smart_choose_user_next_input():
    scores = {ROCK: 0, PAPER: 0, SCISSORS: 0}
    history_length = len(history)

    length = 4
    i = len(history) - length
    while i >= length-1:
        if (history[i] == history[history_length-1]):
            if (history[i-1] == history[history_length-2]):
                if (history[i-2] == history[history_length-3]):
                    if (history[i-3] == history[history_length-4]):
                        scores[history[i+1]] += 1
        i -= 1
    best = choose_best(scores)
    if best:
        return best

    scores = {ROCK: 0, PAPER: 0, SCISSORS: 0}
    length = 3
    i = len(history) - length
    while i >= length-1:
        if (history[i] == history[history_length-1]):
            if (history[i-1] == history[history_length-2]):
                if (history[i-2] == history[history_length-3]):
                    scores[history[i+1]] += 1
        i -= 1
    best = choose_best(scores)
    if best:
        return best

    scores = {ROCK: 0, PAPER: 0, SCISSORS: 0}
    length = 2
    i = len(history) - length
    while i >= length-1:
        if (history[i] == history[history_length-1]):
            if (history[i-1] == history[history_length-2]):
                    scores[history[i+1]] += 1
        i -= 1
    best = choose_best(scores)
    if best:
        return best
    
    return toss_choices.values()[0] # If history doesn't match, use ROCK
# -----------------------------------------------------------


for i in range(0,10): # Gotta toss randomly the first 10 rounds
    choice = random.choice(toss_choices.keys())
    sock.sendall(choice + "\n")
    history.append(toss_choices[choice])
    print sock.recv(1024)

received = ""
while received.find("flag") == -1:
    choice = smart_choose_user_next_input() # This will be the computer's choice
    if choice == ROCK:
        choice = "p"
    elif choice == PAPER:
        choice = "s"
    elif choice == SCISSORS:
        choice = "r"
    sock.sendall(choice + "\n") # We send the choice that will beat the computer
    history.append(toss_choices[choice])
    received = sock.recv(1024)
    print received
