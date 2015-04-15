f = open("dictionary.txt", "r")
dictionary = f.read().split("\n")

count = 0
for word in dictionary:
    if "and" in word:
        count += len(word)

print "stuyctf{" + str(count) + "}"
