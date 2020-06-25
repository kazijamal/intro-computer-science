# Ask a yes or no question, then respond.

# The user's answer to the question is saved as x.
ans = raw_input('Do you like to answer yes or no questions? ')

# What to do based on the user's answer to the question.
if ans == 'y' or ans == 'yes' or ans == 'Yes':
    print 'You must be fun at parties.'
    print 'I will talk to you later.'
else:
    if ans == 'n' or ans == 'no' or ans == 'No':
        print 'Sorry for bothering you.'
        print 'Bye.'
    else:
        print 'Type a valid answer please.'
