import string

LETTERS = string.ascii_uppercase
plaintext = raw_input('Enter some plaintext: ').upper()

# find character in word

def find(char, word):
    '''Takes a single character string, char and another string, word
      and returns the first index position of char in word.'''
    index = 0
    for c in word:
        if c == char:
            return index
        index += 1
    return -1

# encryption

def encryptWord(plaintext, ROT13 = False):
    '''Takes a string, plaintext and encrypts the word using
      encryptOne(char) as an internal helper function.'''
    cyphertext = ''
    def encryptOne(char, ROT13 = False):
        '''Take a single character string, char
           and applies the Caesar Cipher scheme to the character.'''
        char_shift = 3
        if ROT13:
            char_shift = 13
        index = find(char, LETTERS)
        new_index = (index + char_shift) % 26
        return LETTERS[new_index]
    for c in plaintext:
        cyphertext += encryptOne(c, ROT13)
    return cyphertext

# decryption

def decryptWord(plaintext,  ROT13 = False):
    '''Takes a string, plaintext and decrypts the word using
      decrpytOne(char) as an internal helper function.'''
    cyphertext = ''
    def decryptOne(char, ROT13 = False):
        '''Take a single character string, char
           and decrypts the Caesar Cipher scheme from the character.'''
        char_shift = 3
        if ROT13:
            char_shift = 13
        index = find(char, LETTERS)
        new_index = (index - char_shift) % 26
        return LETTERS[new_index]
    for c in plaintext:
        cyphertext += decryptOne(c, ROT13)
    return cyphertext

# testing

def testFind():
    w = 'STUYVESANT'
    for letter in LETTERS:
        print 'find(' + letter + ',' + w + '): ', find(letter,w)

def test():
    # caesar cypher
    print encryptWord('CAMEL') # returns 'FDPHO'
    print encryptWord('APPLE') # returns 'DSSOH'
    print decryptWord('FDPHO') # returns 'CAMEL'
    print decryptWord('DSSOH') # returns 'APPLE'
    # ROT13
    print encryptWord('ROOF', True) # returns 'EBBS'
    print encryptWord('GREEN', True) # returns 'TERRA'
    print decryptWord('EBBS', True) # returns 'ROOF'
    print decryptWord('TERRA', True) # returns 'GREEN'
