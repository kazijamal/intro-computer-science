# demonstrates a multiline function
def max(x,y):
    '''Assume x and y are comparable.
       Returns the larger argument.'''
    if x > y:
        return x
    return y

# function calls
a,b = 3,5
print max(a,b)
print max(b,a)

# predicate funtion isIn
def isIn(x,y):
    '''Assume x and y are both strings.
       If either string is a substring of the other, returns true.
       False otherwise.'''
    if (x in y) or (y in x):
        return True
    return False

# function calls
print isIn('at','cat')
print isIn('reverse','verse')
print isIn('cow','crown')
