def findR1(ch, word):
    '''Takes a string of length 1,ch, and a string, word.
    findR(ch,word) returns a nonnegative index position
    of the last occurrence of ch in word.
    If ch is not in the word, a corresponding message is returned.'''
    i = 0
    ans = None
    for x in word:
        if x == ch:
            ans = i
        i += 1
    if ans == None:
        return ch, 'is not a character that appears in', word
    return ans

print findR1('a','angeray')
print findR1('x','yay')

def findR2(ch, word):
    '''Takes a string of length 1,ch, and a string, word.
    findR(ch,word) returns a nonnegative index position
    of the last occurrence of ch in word.
    If ch is not in the word, a corresponding message is returned.'''
    ans = None
    x = 0
    if ch == word[x]:
        ans = x
    x += 1
    findR2(ch, word[1: ])
    if ans == None:
        return ch, 'is not a character that appears in', word
    return ans

print findR2('a','angeray')
print findR2('x','yay')
