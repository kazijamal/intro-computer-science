Part I 
===================
a. [2,7,12,17]
b. [1,2,2,7]
c. [17,12,7,2]
d. [a,b,c]
e. [3,8,13,18]
f. [2,7,12,17,-1]
g. '2-7-12-17--1'
h. 18
j. [2,7,12,17,-1,-1]

Part II
========
def filter(f,L):
  '''Assumes f is a function, L a list.
     Returns those items of list for which f(item) is true.'''
  ans = []
  for i in L:
    if f(i):
      ans += [i]
  return ans

Part III
===================
a. str
b. str
c. bin(6)
   bin(6/2) + bin(6%2)
   bin(3) + bin(0)
   (bin(3/2) + bin(3%2)) + '0'
   (bin(1) + bin(1)) + '0'
   ('1' + '1') + '0'
   ('11') + '0'
   '110'
d. 0
   1
   10
   11
   100
   101
   110
   111
e. 21

Part IV 
===================
(a) (i.)
    (ii.) [5,1,4,3] ; 9
(b)
