def printName(first, last, reverse = False):
    '''Example of a keyword argument'''
    if not reverse:
        print first, last
    else:
        print last + ',' + first

print printName('bill','lee')
printName('bill','lee', True)
