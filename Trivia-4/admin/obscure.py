import random

f = open('dictionary.txt', 'r')
words = f.readlines()
f.close()

random.seed(1000) # Always generate the same output

list_of_words = []
for word in words:
    if random.random() < .75: # 80% chance of keeping the word
        word = word.strip()
        list_of_words.append(word)

f = open('../release/dictionary.txt', 'w')
f.write(" ".join(list_of_words))
f.close()
