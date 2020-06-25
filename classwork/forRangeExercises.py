#1
for x in range(2,11):
    print '1/',x, '=', 1.0/x
    
# 2
n = int(raw_input('Enter a positive number: '))
r = range(1,n,2)
s = 0
for x in r:
    s += x
print 'Sum of odds from 1 to', n, ':', s

# 3
n = int(raw_input('How many numbers per line? '))
s = 10
e = s + n
r = range(20/n+1)
for y in r:
    for x in range(s,e):
        print x,
    s += n
    e += n
    if e > 30:
        e = 30
    print '\t'


# 4
w = raw_input('Enter a word: ')
l = raw_input('Enter a letter: ')
i = 0

for x in w:
    if l in x:
        print l, 'first appears at index', i
        break
    i += 1
    if i == len(w):
        print l, 'does not appear in', w
