#!/usr/bin/python

import cgi

def htmlTop():
    print '''Content-type:text/html\n\n
            <!DOCTYPE html>
            <html lang="en-US">
                <head>
                    <meta charset="utf-8" />
                    <link rel="stylesheet" type="text/css" href="../../mystyle.css">
                    <title> Data Analysis: Elements </title>
                </head>
                <body>'''

def htmlTail():
    print '''</body>
            </html>'''

data = open('elements.csv','r')

head = ['Weight','Boil','Melt','Density','Vapour','Fusion']
weight = ['Weight','1.01','256.10','126.76']
boil = ['Boil','4.26','6203.16','2513.44']
melt = ['Melt','3.46','4000.16','1275.74']
density = ['Density','71','22600','7229.48']
vapour = ['Vapour','0.08','678.39','255.45']
fusion = ['Fusion','0.02','33.71','12.18']
properties = [weight,boil,melt,density,vapour,fusion]

def main():
    htmlTop()
    print '<h1>Data Analysis: Elements</h1>'
    rows = data.readlines()
    nrows = list()
    for row in rows:
        row = row.strip()
        row = row.split(',')
        row.pop()
        nrows.append(row)
    elements = nrows[1: ]
    print '<h2>There are {} elements</h2>'.format(len(elements))
    print '<h4>The first element is {}</h4>'.format((elements[0])[0])
    print '<h4>The last element is {}</h4>'.format((elements[-1])[0])
    print '<h2>Search Elements By Name Or Number</h2>'
    print '<form method="post" action="searchProcess.py">'
    print '<input type="text" name="element" placeholder="e.g. Carbon/6"'
    print '<br>'
    print '<input type="submit" name="submitelement" value="Search Elements" />'
    print '</form>'
    print '<br>'
    print '<table>'
    print '<th>Property</th>'
    print '<th>Minimum</th>'
    print '<th>Maximum</th>'
    print '<th>Average</th>'
    for x in properties:
        print '<tr>'
        for y in x:
            print '<td> {} </td>'.format(y)
        print '</tr>'
    print '</table>'
    print '<br>'
    print '<h1>Elements</h1>'
    print '<table>'    
    for x in nrows[0]:
        print '<th> {} </th>'.format(x)
    for row in elements:
        print '<tr>'
        for x in row:
            print '<td> {} </td>'.format(x)
        print '</tr>'
    print '</table>'
    print '<br>'
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
