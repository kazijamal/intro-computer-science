### 1
##n = raw_input('Enter a positive integer: ')
##sum_digits = 0
##for x in n:
##    sum_digits += int(x)
##print 'The sum of the digits is: ', sum_digits

### 2
##w = raw_input('Enter a word: ')
##rev = ''
##for x in w:
##    rev = x + rev
##print 'The reverse is: ', rev

# 3
w = raw_input('Enter a word: ')

for x in w:
    y = x
    if x == y:
        print 'The first letter that repeats is: ', x
