def f(x):
    a = 2
    t = x + a
    s = 2*t
    return s

a = 5
t = 12
s = 3
print 'a =', a
u = f(t)
print 'a = ', a
print 't =', t
print 's =', s
print 'u =', u

# a. formal parameters of f(x): x
# b. local variables of f(x): a, t, s
# c. output:
## a = 5
## a = 5
## t = 12
## s = 3
## u = 28

# 3
def collatz(n,display=False):
    ans = 1
    iseven = lambda x: x % 2 == 0
    while n != 1:
        if display:
            print n,    # print without starting a new line
        if iseven(n):
            n  /= 2
        else:
            n = 3 * n + 1
        ans += 1
    if display:
        print n      # print and start a new line
    return ans

# 4
def longestSeed(start, end, display=False):
    if end < start:
        start, end = end, start
    ans = None
    for x in range(start,end):
        if collatz(x) > ans:
            ans = x
            if display:
                collatz(x,True)
    return ans

print longestSeed(1,4)
print longestSeed(4,6,True)
