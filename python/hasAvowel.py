# reads in a srting
s = raw_input('Enter a string with all lowercase letters: ')

# determines whether any vowels are in the string and prints respective result
asub = lambda x : 'a' in x
esub = lambda x : 'a' in x
isub = lambda x : 'i' in x
osub = lambda x : 'o' in x
usub = lambda x : 'u' in x

if asub(s) or esub(s) or isub(s) or osub(s) or usub(s):
    print 'The string has vowels.'
else:
    print 'The string has no vowels.'
