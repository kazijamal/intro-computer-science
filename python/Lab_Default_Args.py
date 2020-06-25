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
    ans = first
    for x in range(n-2):
        ans = first + second
        first = second
        second = ans
    return ans

print fib(1)
print fib(1,2,3)
print fib(2,2,3)
print fib(6, first = 1)
print fib(10,second = 2)
