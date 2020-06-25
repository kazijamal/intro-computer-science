# reads in a string
string = raw_input('Enter a string: ')

# prints length
length = len(string)
print 'length = ', length
# prints first character
first = string[0]
print 'first character = ', first
# prints last character
last = string[len(string) - 1]
print 'last character = ', last
# prints middle character
mid = string[len(string) / 2]
print 'middle character = ', mid
# prints first half of the string
fhalf = string[first:mid]
print 'first half = ', fhalf
# prints last half of the string
lhalf = string[mid:last]
print 'last half = ', lhalf
# prints the string repeated twice
twice = string * 2
print 'repeated twice = ', twice
# prints the string with 'zzz' added to the end
zzz = string + 'zzz'
print zzz
