# encrypt a sentence
import Caesar

# driver
def main():
    sentence = raw_input('Enter a sentence: ')
    sentence = sentence.upper()
    wordList = sentence.split()
    print wordList
    wordList = map(Caesar.encryptWord, wordList)
    print wordList
    for word in wordList:
        print word,

# function call
main()
