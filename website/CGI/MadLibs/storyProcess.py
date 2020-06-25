#!/usr/bin/python

import cgi

def htmlTop():
    print '''Content-type:text/html\n\n
            <!DOCTYPE html>
            <html lang="en-US">
                <head>
                    <meta charset="utf-8" />
                    <link rel="stylesheet" type="text/css" href="../../mystyle.css">
                    <title> MadLibs </title>
                </head>
                <body>'''

def htmlTail():
    print '''</body>
            </html>'''

def getData():
    storyForm = cgi.FieldStorage()
    return {"storyType": storyForm.getvalue("storyType"),
            "pn1": storyForm.getvalue("pn1"),
            "pln1": storyForm.getvalue("pln1"),
            "pastv1": storyForm.getvalue("pastv1"),
            "n1": storyForm.getvalue("n1"),
            "pn2": storyForm.getvalue("pn2"),
            "pastv2": storyForm.getvalue("pastv2"),
            "pn3": storyForm.getvalue("pn3")}

storyForm = getData()

scifiDoc = open("sci-fi.txt",'r')
horrorDoc = open("horror.txt",'r')
mysteryDoc = open("mystery.txt",'r')

scifi = scifiDoc.read()
horror = horrorDoc.read()
mystery = mysteryDoc.read()

def main():
    htmlTop()
    print '<h1>A {} Story</h1>'.format(storyForm["storyType"])
    if storyForm["storyType"] == "Sci-Fi":
        print '<p>{}</p>'.format(scifi.format(** storyForm))
    if storyForm["storyType"] == "Horror":
        print '<p>{}</p>'.format(horror.format(** storyForm))
    if storyForm["storyType"] == "Mystery":
        print '<p>{}</p>'.format(mystery.format(** storyForm))
    print '<form method="post" action="storyForm.html">'
    print '<input type="submit" name="story" value="Make Another Story"/>'
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

scifiDoc.close()
horrorDoc.close()
mysteryDoc.close()