f = open("bulbasaur.in", "r").read().split("\n")

BLv = 100
BAtk = 216
BSPA = 251

SDef = 328
SSPD = 284

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

moveList = []

for el in f[0:-1]:
    a = el.split(" ")
    moveList.append([a[1], a[2] == "Physical", int(a[3]), float(a[4])])

damageList = []

for el in moveList:
    damageList.append(damage(el[0], el[1], el[2], el[3]))

answer = 0.0

answer += max(damageList)
damageList.remove(max(damageList))
answer += max(damageList)
damageList.remove(max(damageList))
answer += max(damageList)
damageList.remove(max(damageList))
answer += max(damageList)
damageList.remove(max(damageList))

print answer
