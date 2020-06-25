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
