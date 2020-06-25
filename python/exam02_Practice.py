### I.
##1) error
##2) 'uuuu'
##3) 11
##4) w1[3:6]
##5) [ -4, -2, 0, 2 ]
##6) -4
##7) False
##8) False
##9) [ 0, 2]
##10) -20

### II.
##a. '1, '
##b. '1, 100, 2, 50, 4, 25, 5, 20, 10, ' 
##c. ''
##d. 10

### III.
##N = int(raw_input('Enter a positive integer: '))
##s = N
##
##for x in range(1, N + 1):
##    print ' ' * s, '* ' * x
##    s -= 1

# IV.
# input : commas seperated values (csv)
csv = raw_input('Enter numbers seperated by commas: ')

s = 0
n = ''

for x in csv:
    if x != ',':
        n += x
        s += float(n)
        n = ''

print n
print 'The sum: ', s
