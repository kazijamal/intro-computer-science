# Asks for 3 numbers
a = float(raw_input('Type a number: '))
b = float(raw_input('Type another number: '))
c = float(raw_input('Type a final number: '))

# Lambda function to see if x is even
iseven = lambda x: x % 2 == 0

# Removes numbers that are even
if iseven(a):
    a = None
if iseven(b):
    b = None
if iseven(c):
    c = None

# New variable gets the max of the remaining odd numbers
greatest = max(a,b,c)

print greatest, 'is the greatest.'
