import random

### 1
##w = int(raw_input('Enter the width of the rectangle: '))
##h = int(raw_input('Enter the height of the rectangle: '))
##a = ''
##
##for x in range(h):
##    for y in range(w):
##        a += '*'
##    print a
##    a = ''

### 2
##n = int(raw_input('Enter a positive number: '))
##a = ''
##
##for x in range(n):
##    for y in range(n):
##        a += '*'
##    print a
##    a = ''

### 3
##flipCoin = lambda : random.choice(['H', 'T'])
##t = int(raw_input('Enter number of trials: '))
##a = ''
##
##for x in range(t):
##    a += flipCoin()
##
##H = 0
##lH = 0
##T = 0
##lT = 0
##
##for x in a:
##    if x == 'H':
##        H = 1
##        if H > lH:
##            lH = H
##        for y in a[1:]:
##            if y == 'H':
##                H += 1
##                if H > lH:
##                    lH = H
##            else:
##                if H > lH:
##                    lH = H
##                H = 0
##    if x == 'T':
##        T = 1
##        if T > lT:
##            lT = T
##        for y in a[1:]:
##            if y == 'T':
##                T += 1
##                if T > lT:
##                    lT = T
##            else:
##                if T > lT:
##                    lT = T
##                T = 0
##
##print a
##print 'The longest sequence of H: ', lH
##print 'The longest sequence of T: ', lT
