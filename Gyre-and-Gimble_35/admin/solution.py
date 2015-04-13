f=open('Jabberwocky.txt','r')
L=f.read().split()
f.close()
sol='stuyctf{'
for i in range(len(L)):
    if i % 3==2:
        sol+=L[i]
sol=sol.lower()
punc='.,`!\'-"'
for x in punc:
    sol=sol.replace(x,'')
sol+='}'
print sol
