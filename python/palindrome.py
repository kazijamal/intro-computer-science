# reads in a string
s = raw_input('Enter a string, and I will say whether it is a palindrome or not: ')

# determines if string is a palindrome and prints result respectively
reverse = s[ : :-1]
if reverse == s:
    print s, 'is a palindrome.'
else:
    print s, 'is not a palindrome.'
