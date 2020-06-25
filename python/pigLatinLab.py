def isvowel(ch):
    '''Assumes ch is a character.
       Returns True if ch is a vowel.'''
    if ch == 'a' or ch == 'e' or ch == 'i' or ch == 'o' or ch == 'u' or ch == 'y':
        return True

def beginswithvowel(word):
    '''Assumes word is a str.
       Returns True if word begins with a vowel.'''
    ch = word[0]
    if ch == 'a' or ch == 'e' or ch == 'i' or ch == 'o' or ch == 'u':
        return True

def vowelindex(word):
    '''Assumes word is a str.
       Returns the index of the first vowel.
       -1 if not found.'''
    index = 0
    for ch in word:
        if ch == 'u':
            if word[index-1] != 'q':
                return index
        if isvowel(ch):
            return index
        index += 1
    return -1

def engtopig(word):
    '''Assumes word is a word of either case, may have punctuation.
       Returns the pig latin translation.
       ex. engtopig('Hi!') -> 'Ihay!'
           engtopig('two-year-old') -> 'owtay-earyay-oldway'
    '''                                                                                                                                                                                                     
    wordList = word.split('-')
    translatedList = []
    for x in wordList:
        if beginswithvowel(x):
            x += 'way'
            translatedList += [x]
        else:
            if vowelindex(x) == None:
                x += 'ay'
                wordList += [x]
            else:
                x = x[vowelindex(x): ] + x[0:vowelindex(x)] + 'ay'
                wordList += [x]
    return ('-').join(translatedList)
            
