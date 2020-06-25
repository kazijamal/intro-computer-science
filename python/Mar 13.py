def findR(ch, word):
    '''takes a string of length 1,ch, 
    and a string, word. findR(ch,word) returns a nonnegative index position
    of the last occurrence of ch in word'''
    rev = ''
    for x in word:
        rev = x + rev
    i = 0
    for y in rev:
        if rev == ch:
            return len(word) - 1 - i
        i += 1
    if i == len(word) - 1:
        return 0
