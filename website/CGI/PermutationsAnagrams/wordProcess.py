#!/usr/bin/python

import cgi
import itertools

def htmlTop():
    print '''Content-type:text/html\n\n
            <!DOCTYPE html>
            <html lang="en-US">
                <head>
                    <meta charset="utf-8" />
                    <link rel="stylesheet" type="text/css" href="../../mystyle.css">
                    <title> Permutations and Anagram Identifier </title>
                </head>
                <body>'''

def htmlTail():
    print '''</body>
            </html>'''

def getData():
    wordForm = cgi.FieldStorage()
    word = wordForm.getvalue('word')
    return word

word = getData()

def permutations(word):
    permlist = []
    for w in itertools.permutations(word):
        perm = ''.join(w)
        permlist.append(perm)
    permlist = list(set(permlist))
    return permlist

fileIn = open('/etc/dictionaries-common/words', 'r')
d = fileIn.read().split()

def main():
    htmlTop()
    print '<h1>Permutations and Anagrams Identifier</h1>'
    print '<h4>Permutations:</h4>'
    print '<ol>'
    permlist = permutations(word)
    for p in permlist:
        print '<li>{}</li>'.format(p)
    print '</ol>'
    print '<h4>Anagrams:</h4>'
    print '<ol>'
    for p in permlist:
        if p in d:
            print '<li>{}</li>'.format(p)
    print '</ol>'
    print '<br>'
    print '<form method="post" action="wordForm.html">'
    print '<input type="submit" name="tryword" value="Try Another Word"/>'
    print '</form>'
    print '<form method="post" action="../../index.html">'
    print '<input type="submit" name="return" value="Return To Homepage"/>'
    print '</form>'
    htmlTail()
    
if __name__ == "__main__":
    try:
        main()
    except:
        cgi.print_exception()

fileIn.close()
