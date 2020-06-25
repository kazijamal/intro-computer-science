def upTo(target, L):
    '''Assumes input is an object and a list.
     The returned list is empty when target is not an item in the list
     or when the target is the first item, otherwise the returned list contains all the
     items of L that precede target in the list.'''
    ans = []
    if target in L:
        for x in L:
            if x == target:
                break
            else:
                ans += [x]
    return ans

print upTo(3, [1,2,3,4,5])
print upTo(5, range(1,100, 4))
print upTo('cat',['dog','cow','chicken'])
print upTo('dog', ['dog','cow','chicken'])
print upTo('chicken', ['dog','cow','chicken'])
