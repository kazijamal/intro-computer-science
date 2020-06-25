print 'This is a game of Rock Paper Scissors.'
print 'It is a two player game.'

# Takes input from 2 players
p1 = raw_input('Player 1, enter your choice <rock,paper,scissors>: ')
p2 = raw_input('Player 2, enter your choice <rock,paper,scissors>: ')

if (p1 == 'rock' or p1 == 'paper' or p1 == 'scissors') and (p2 == 'rock' or p2 == 'paper' or p2 == 'scissor'):
    print 'Enter one of the 3 values'
    win = -1

# Determines outcome of the match
r = 'rock'
p = 'paper'
s = 'scissors'

if p1 == r and p2 == s:
    win = p1
elif p2 == p:
    win = p2
elif p2 == r:
    win = 0
    
if p1 == p and p2 == r:
    win = p1
elif p2 == s:
    win = p2
elif p2 == p:
    win = 0
    
if p1 == s and p2 == p:
    win = p1
elif p2 == r:
    win = p2
elif p2 == s:
    win = 0

# Prints message based on outcome
if win == p1:
    print 'Player 1 wins!'
if win == p2:
    print 'Player 2 wins!'
if win == 0:
    print 'The match was a tie!'
if win == -1:
    print 'Try again!'
