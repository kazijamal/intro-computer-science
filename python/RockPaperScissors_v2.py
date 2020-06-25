import random

print 'This is a game of Rock Paper Scissors.'
print 'It is a one player game against a random and fair computer.'

# Takes input from 1 player and makes a choice for the computer
p1 = raw_input('Player, enter your choice <rock,paper,scissors>: ')

if p1 != 'rock' or p1 != 'paper' or p1 != 'scissors':
    print 'Enter one of the 3 values'
    win = -1

c = random.randint(0,2)

# Determines outcome of the match
r = 'rock'
p = 'paper'
s = 'scissors'

if c == 0:
    c = r
if c == 1:
    c = p
if c == 2:
    c = s
    
if p1 == r and c == s:
    win = p1
elif c == p:
    win = c
elif c == r:
    win = 0
    
if p1 == p and c == r:
    win = p1
elif c == s:
    win = c
elif c == p:
    win = 0
    
if p1 == s and c == p:
    win = p1
elif c == r:
    win = c
elif c == s:
    win = 0

# Prints message based on outcome
if win == p1:
    print 'Player 1 wins!'
if win == c:
    print 'The computer wins!'
if win == 0:
    print 'The match was a tie!'
if win == -1:
    print 'Try again!'
