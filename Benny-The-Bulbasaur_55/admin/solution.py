from heapq import *
f = open("bulbasaur.in", "r").readlines()

BLv = 100  # Bulbasaur lvl
BAtk = 216 # Bulbasaur atk
BSPA = 251 # Bulbasaur sp. atk

SDef = 328 # Scizor def
SSPD = 284 # Scizor sp. def

STAB = ["Grass", "Poison"]
x4Effective = ["Fire"]
xhalfEffective = ["Normal", "Ice", "Psychic", "Bug", "Ghost", "Dragon", "Dark",
                  "Steel"]
xfourthEffective = ["Grass"]
x0Effective = ["Poison"]

def damage(Type, Physical, Base, Accuracy):
    if Physical:
        d = (210. * BAtk * Base) / (250. * SDef) + 2
    else:
        d = (210. * BSPA * Base) / (250. * SSPD) + 2
    modifier = 1.
    if Type in STAB:
        modifier = modifier * 1.5
    if Type in x4Effective:
        modifier = modifier * 4.
    if Type in xhalfEffective:
        modifier = modifier * 0.5
    if Type in xfourthEffective:
        modifier = modifier * 0.25
    if Type in x0Effective:
        return 0
    return (Accuracy / 100.) * d * modifier

damageList = []

for el in f:
    a = el.split(" ")
    heappush(damageList, damage(a[1], a[2] == "Physical", int(a[3]), float(a[4])))

print sum(nlargest(4, damageList))
