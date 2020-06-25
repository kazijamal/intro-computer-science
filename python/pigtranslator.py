# global variables
letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

# function definitions
def isvowel(ch):
    '''Assumes ch is a character.
       Returns true if ch is a vowel.'''
    if ch == 'a' or ch == 'e' or ch == 'i' or ch == 'o' or ch == 'u' or ch == 'y':
        return True
    return False

def testisvowel():
    ''' Tests isvowel.'''
    return None


def beginswithvowel(word):
    '''Assumes word is a str.
       Returns true if word begins with a vowel.'''
    if isvowel(word[0]) and word[0] != 'y':
        return True
    return False

def testbeginswithvowel():
    ''' Tests begins with vowel'''
    return None

def vowelindex(word):
    '''Assumes word is a str.
       Returns the index of the first vowel.
       -1 if not found.'''
    index = 0
    for ch in word:
        if isvowel(ch):
            return index
        index += 1
    return -1

def testvowelindex():
    return None

def qu(word):
    if word.find('u') != -1:
        u = word.find('u')
    elif word.find('U') != 1:
        u = word.find('U')
    if word[u-1] == 'q' or word[u-1] == 'Q':
        return True
    return False
    

def engtopig(word):
    '''Assumes word is a word of either case, may have punctuation.
       Returns the pig latin translation.
       ex. engtopig('hi!') -> 'ihay!'
           engtopig('two-year-old') -> 'otway-earyay-oldway'
    '''
    wordList = word.split('-')
    newWordList = []
    for w in wordList:
        if w[len(w)-1] not in letters:
            punctuation = w[len(w)-1]
            w = w[ :len(w)-1]
        if beginswithvowel(w):
            w += 'way'
        elif vowelindex(w) == -1 or (vowelindex(w) == 1 and qu(w)):
            w += 'ay'
        else:
            vowelindex = vowelindex(w)
            if (w[vowelindex(w)] == 'u' or w[vowelindex(w)] == 'U') and qu:
                vowelindex = vowelindex(w(vowelindex): ) 
            w = w[vowelindex: ] + w[: vowelindex] + 'ay'
        newWordList += [w + punctuation]
    newWord = ('-').join(newWordList)
    if newWord[1] == newWord[1].upper():
        newWord = newWord.upper()
    else:
        newWord = newWord.lower()
    return newWord
        

def testengtopig():
     return None


def pigify(text):
    '''Assumes text is a str.
       Returns the pig latin translation of text.'''
    engwords = text.split()
    pigwords = map(engtopig,engwords)
    print ' '.join(pigwords)
