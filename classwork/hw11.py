# 1
isDivisor = lambda x,y : y % x == 0
i = None
x = 1
numDivisors = 0

while i < 1:
    i = int(raw_input('Enter a positive integer: '))

while x <= i:
    if isDivisor(x,i):
        print x
        numDivisors = numDivisors + 1
    x = x + 1

if numDivisors == 2:
    print i, 'is prime'
else:
    print i, 'is not prime'

# 2
w = raw_input('Enter a word: ')
rev = ''
for x in w:
    rev = x + rev
print rev

# 3 v1 for loop
w = raw_input('Enter a word: ')
n = 0
for x in w:
    n += 1
    if x in w[n: ]:
        print 'The first letter that repeats is', x
        break
if n == len(w):
    print 'No letter repeats'

# 3 v2 while loop
w = raw_input('Enter a word: ')
n = 0
x = 0
while n < len(w):
    n += 1
    if w[x] in w[n: ]:
        print 'The first letter that repeats is', w[x]
        break
    x += 1
if n == len(w):
    print 'No letter repeats'
