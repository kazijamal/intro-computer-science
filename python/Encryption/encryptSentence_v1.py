# encrypt a sentence
import Caesar

# driver
def main():
    sentence = raw_input('Enter a sentence: ')
    sentence = sentence.upper()
    wordList = sentence.split()
    print sentence
    print wordList
    for word in wordList:
        print Caesar.encryptWord(word),

# function call
main()
