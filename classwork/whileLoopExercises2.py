import random
import time

# 1
n = None

while n >= 10 or n < 1:
    n = int(raw_input('Enter a number within [1,10): '))
print 'Thanks'

# 2
i = None

while i < 1:
    i = int(raw_input('Enter a positive number: '))

x = 1

while x < i:
    print x
    x = x +2
    
# 3
isEven = lambda x : x % 2 == 0
isOdd = lambda x : not(isEven(x))

n1 = None
n2 = None

while n1 < 1:
    n1 = int(raw_input('Enter a positive integer: '))

while n2 < 1:
    n2 = int(raw_input('Enter another: '))

if n2 > n1:
    if isOdd(n1):
        x = n1
    if isEven(n1):
        x = n1 + 1
    while x <= n2:
        print x
        x = x + 2
if n1 > n2:
    if isOdd(n2):
        x = n2
    if isEven(n2):
        x = n2 + 1
    while x < n1:
        print x
        x = x + 2

# 4
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

# 5

numSpins = 8
numChoices = 3
choice = None

while numSpins > 0:
    time.sleep(1)
    choice1 = random.choice(['7', 'cherry', 'bell'])
    choice2 = random.choice(['7', 'cherry', 'bell'])
    choice3 = random.choice(['7', 'cherry', 'bell'])
    print choice1, '\t', choice2, '\t', choice3
    numSpins = numSpins - 1
    if choice1 == choice2 == choice3:
        print 'You win!!!!'
        numSpins = 0






