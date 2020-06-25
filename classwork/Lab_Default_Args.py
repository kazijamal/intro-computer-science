# 1
def find(sub,s, start = 0):
    '''Assume both sub and s are strings and start is an int.
    Return the lowest index in s where substring sub is found,
    such that sub is contained within S[start:].  Optional
    argument start is interpreted as in slice notation.
    Return -1 on failure.'''
    if sub not in s:
        return -1
    for x in s[start:]:
        if s[start:len(sub)+start] == sub:
            return start
        start += 1

print find('at', 'cat')
print find('is', 'mississippi', 2)
print find('z', 'python')

# 2
def fib(n, first = 0, second = 1):
    F = [first, second]
    for x in range(n):
        new = first + second
        F += [new]
        first = second
        second = new
    return F[n-1]
    
    

print fib(1)
print fib(1,2,3)
print fib(2,2,3)
print fib(6, first = 1)
print fib(10,second = 2)

# 3
isEven = lambda x: x % 2 == 0

def collatz(n, display=False):
    C = [n]
    while C[len(C)-1] != 1:
        if isEven(n):
            n = n/2
            C += [n]
        else:
            n = 3 * n + 1
            C += [n]
    if display:
        print C,
    return len(C)
        
print collatz(1)
print collatz(1,True)
print collatz(2,True)
print collatz(3,True)
print collatz(4)
print collatz(5)

# 4
def longestSeed(start, end, display=False):
    if end < start:
        start, end = end, start
    ans = None
    for x in range(start,end):
        if collatz(x) > ans:
            ans = x
            if display:
                print collatz(x,True)
    return ans

print longestSeed(1,4)
print longestSeed(4,6,True)








