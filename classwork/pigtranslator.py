# global variables
punctuationmarks = ',.!?)'
vowels = 'aeiouyAEIOUY'
letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

# function definitions
def isvowel(ch):
    '''Assumes ch is a character.
       Returns true if ch is a vowel.'''
    if ch in vowels:
        return True
    return False

def testisvowel():
    ''' Tests isvowel.'''
    for x in range(52):
        ans = 'is not a vowel'
        if isvowel(letters[x]):
            ans = 'is a vowel'
        print letters[x], ans

def beginswithvowel(word):
    '''Assumes word is a str.
       Returns true if word begins with a vowel.'''
    if isvowel(word[0]) and word[0] != 'y' and word [0] != 'Y':
        return True
    return False

def testbeginswithvowel():
    ''' Tests begins with vowel'''
    print 'you', beginswithvowel('you')
    print 'apple', beginswithvowel('apple')
    print 'orange', beginswithvowel('orange')
    print 'strong', beginswithvowel('strong')

def vowelindex(word):
    '''Assumes word is a str.
       Returns the index of the first vowel.
       -1 if not found.'''
    index = 0
    for ch in word:
        if isvowel(ch) and not(index == 0 and (ch == 'y' or ch == 'Y')) and not((ch == 'u' or ch == 'U') and (word[index-1] == 'q' or word[index-1] == 'Q')):
            return index
        index += 1
    return -1

def testvowelindex():
    print 'you', vowelindex('you')
    print 'apple', vowelindex('apple')
    print 'orange', vowelindex('orange')
    print 'strong', vowelindex('strong')
    print 'unique', vowelindex('unique')
    print 'quiet', vowelindex('quiet')

def engtopig(word):
    '''Assumes word is a word of either case, may have punctuation.
       Returns the pig latin translation.
       ex. engtopig('Hi!') -> 'Ihay!'
           engtopig('two-year-old') -> 'otway-earyay-oldway'
    '''
    wordList = word.split('-')
    newWordList = []
    for w in wordList:
        title = False
        if w.istitle():
            title = True
        upper = False
        if w == w.upper() and title == False:
            upper = True
        punctuation = ''
        if w[len(w)-1] in punctuationmarks:
            punctuation = w[len(w)-1]
            w = w[ :len(w)-1]
        w = w.lower()
        if beginswithvowel(w):
            w += 'way'
        elif vowelindex(w) == -1:
            w += 'ay'
        else:
            w = w[vowelindex(w): ] + w[ :vowelindex(w)] + 'ay'
        if upper:
            w = w.upper()
        if title:
            w = w[0].upper() + w[1: ]
        w += punctuation
        newWordList += [w]
    return '-'.join(newWordList)

def testengtopig():
    words =  ['apple','orange','strong','program','zzz','you','fly','unique','quiet','semi-perimeter','Hi!','HI!','two-year-old','TWO-YEAR-OLD']
    for word in words:
        print word, '\t-->\t', engtopig(word)

def pigify(text):
    '''Assumes text is a str.
       Returns the pig latin translation of text.'''
    engwords = text.split()
    pigwords = map(engtopig,engwords)
    return ' '.join(pigwords)
    
def testpigify():
    sentences = ['How are you, Bob?', 'Stop YELLING!', 'I have a two-year-old.']
    for sentence in sentences:
        print sentence, '\t-->\t', pigify(sentence)

# function calls
print 'Translating an english word to pig Latin:', '\n'
testengtopig()
print '\n', 'Translating an english sentence to pig Latin:', '\n'
testpigify()
