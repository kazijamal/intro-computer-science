import random

# function
flipCoin = lambda : 'heads' if (random.randint(0,1) == 0) else 'tails'

# output 3 function calls
print flipCoin()
print flipCoin()
print flipCoin()

# function
rollDie = lambda n : random.randint(1,n)

# output 3 function calls
print rollDie(2)
print rollDie(6)
print rollDie(32)
