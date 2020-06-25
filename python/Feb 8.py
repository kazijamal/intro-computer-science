n = int(raw_input('Enter an integer: '))
d = int(raw_input('Enter another integer: '))
divisor = lambda n, d : n % d == 0
if d != 0:
    if divisor(n, d) == True:
        print 'Your second integer is a divisor of the first'
    else:
        print 'Your second integer is not a divisor of the first'
else:
    print 'The second integer cannot be 0, because it results in ZeroDivisionError'
