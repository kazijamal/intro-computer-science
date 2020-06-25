# encrypt a sentence
import Caesar

# driver
def main():
    sentence = raw_input('Enter a sentence: ')
    sentence = sentence.upper()
    wordList = sentence.split()
    wordList = map(Caesar.encryptWord, wordList)
    print ' '.join(wordList)

# function call
main()

# mymap

def mymap(f, L):
    '''Assume f is a function and L is a list.'''
    ans = []
    for x in L:
        ans += str(x)
    print ans
