red = raw_input('Input red value: ')
green = raw_input('Input green value: ')
blue = raw_input('Input blue value: ')

white = max( float(red)/255, float(green)/255, float(blue)/255)
cyan  = (white - float(red)/255) / white
magenta = (white - float(green)/255) / white
yellow  = (white - float(blue)/255) / white
black   = 1 - white

print 'cyan = ', cyan
print 'magenta = ', magenta
print 'yellow = ', yellow
print 'black = ', black
