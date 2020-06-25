# Demonstrates swapping

x = 3
y = 5

print 'Before swapping'
print 'x =', x
print 'y =', y

# exchange the value of x and y without using a literal

# method1
## a = y # a is a temporary variable
## y = x
## x = a

# method2
x,y = y,x

print 'After swapping'
print 'x =', x
print 'y =', y

age = raw_input("Type your age.")
print 'You are', age, 'years old, is that right?'
