#!/usr/bin/python

import cgi

def htmlTop():
    print '''Content-type:text/html\n\n
            <!DOCTYPE html>
            <html lang="en-US">
                <head>
                    <meta charset="utf-8" />
                    <link rel="stylesheet" type="text/css" href="../../mystyle.css">
                    <title> Element Search </title>
                </head>
                <body>'''

def htmlTail():
    print '''</body>
            </html>'''

def getData():
    search = cgi.FieldStorage()
    element = search.getvalue('element')
    return element.title()

element = getData()

data = open('elements.csv','r')

def main():
    htmlTop()
    print '<h1>Element Search</h1>'
    rows = data.readlines()
    nrows = list()
    for row in rows:
        row = row.strip()
        row = row.split(',')
        row.pop()
        nrows.append(row)
    elements = nrows[1: ]
    search = 0
    for x in elements:
        if element == x[0] or element == x[1]:
            print '<table>'    
            for row in nrows[0]:
                print '<th> {} </th>'.format(row)
            print '<tr>'
            for y in x:
                print '<td> {} </td>'.format(y)
            print '</tr>'
            print '</table>'
            search += 1
    if search == 0:
        print '<h2>That element was not found</h2>'
    print '<br>'
    print '<form method="post" action="dataAnalysis.py">'
    print '<input type="submit" name="data" value="Return To Data Analysis: Elements"/>'
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

data.close()