# Asks for 3 numbers
a = float(raw_input('Type a number: '))
b = float(raw_input('Type another number: '))
c = float(raw_input('Type a final number: '))

# Tells user the least of the 3 numbers with conditional, V1
if a <= b and a <= c:
    print 'The first number (', a , ') is the least.'
elif b < c:
    print 'The second number (', b , ') is the least.'
else:
    print 'The third number (', c , ') is the least.'

# Tells user the least of the 3 numbers without conditional, V2

least = min(a,b,c)
print least , 'is the least.'

# Tells user the least of the 3 numbers, V3

ans = a
if b < ans:
    ans = b
if c < ans:
    ans = c

print ans, 'is the least.'
