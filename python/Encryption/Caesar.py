# Assume All Messages in Upper Case

#LETTERS IS A GLOBAL VARIABLE
LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

# post condition find the position of char in text
def find(char, text):
    """ Assumes char is a character string and text is a string.
        Returns the index of the first occurrence of char in text. 
    """
    ans = 0
    for c in text:
        if c == char:
            break
        ans += 1
    return ans

def testFind():
    '''Verifies whether find(char,text) works.'''
    pos = 0
    for ch in LETTERS:
        index = find(c,LETTERS)
        print 'ch =', ch , 'index = ', index, 'works? ', pos == index
        pos += 1

    
def encryptOne(char, shift=3):
        '''Assumes char is a capital letter.
        Returns the char 3 letters away with wrap around'''
        pos = find(char,LETTERS)
        return LETTERS[(pos + shift) % 26]

def testEncryptOne():
    correct = LETTERS[3:] + LETTERS[:-3]
    for i in range(0,len(LETTERS)):
        cipherCh = encryptOne(LETTERS[i])
        ch = LETTERS[i]
        correctAns = correct[i]
        print 'ch', ch, 'encrypts to', cipherCh, 'correct? ', correctAns == cipherCh  

def encryptWord(plaintext, shift=3):
    """Assumes plaintext is a string that contains only capital letters.
    Returns the ciphertext resulting from the Caesar Cipher"""
    
    ans = ''
    for c in plaintext:
        ans += encryptOne(c,shift)
    return ans


def testEncryption(shift=3):
    '''Verifies the encryptWord() and decryptWord()'''
    words = ["A", "BE", "ZOO", "JAVA", "PYTHON"]
    #expected = ["D", 'EH', 'CRR', 'MDYD', 'SBWKRQ']
    for i in range(0,len(words)):
        plaintext = words[i]
        ciphertext = encryptWord(plaintext, shift)
        decrypttext = decryptWord(ciphertext, -shift) #expected[i]
        print 'plaintext: ', plaintext , 'ciphertext', ciphertext, 
        print 'decrypt text=', decrypttext, 'correct? ', plaintext == decrypttext



def decryptWord(ciphertext,shift=-3):
    return encryptWord(ciphertext,shift)

#word = raw_input('enter a word: ')
#ciphertext = encryptWord(word)
#plaintext = decryptWord(ciphertext)
#print word , 'encrypts to ', ciphertext, ' decrypts to ', plaintext
