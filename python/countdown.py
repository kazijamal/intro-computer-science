# asks the user for a number
c = int(raw_input('Enter a positive integer: '))
ans = c

if c > 0:
    while ans != 0:
        print ans
        ans = ans - 1
    if ans == 0:
        print 'Blast Off'
else:
    print 'Enter a positive integer.'

# asks the user to input 10 integers
i = 10
maxOdd = None

isOdd = lambda x : x % 2 != 0

while i != 0:
    n = int(raw_input('Enter an integer: '))
    if isOdd(n):
        if n > maxOdd:
            maxOdd = n
    else:
        i = i - 1

print maxOdd
