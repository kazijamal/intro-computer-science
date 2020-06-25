#!/usr/bin/python

import cgi
import random

def htmlTop():
    print '''Content-type:text/html\n\n
    <!DOCTYPE html>
    <html lang="en-US">
        <head>
            <meta charset="utf-8" >
            <link rel="stylesheet" type="text/css" href="../../mystyle.css">
            <title>Magic Eight Ball</title>
        </head>
        <body>'''


def htmlTail():
    print '''</body>
        </html>'''

def main():
    htmlTop()
    print '<h1>Magic 8 Ball</h1>'
    print '<img src="../../Images/8ball.jpeg" />'
    answers = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes definitely', 'You may rely on it', 'You can count on it',
               'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Absolutely',
               'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again',
               'Don\'t count on it', 'No', 'My sources say no', 'Outlook not so good', 'Very doubtful', 'Chances aren\'t good']
    print '<h2> The response is:', answers[random.randint(0,22)], '</h2>'
    print '<form method="post" action="Magic_8-Ball.py">'
    print '<input type="submit" name="request" value="Request Another Response"/>'
    print '</form>'
    print '<form method="post" action="../../index.html">'
    print '<input type="submit" name="return" value="Return To Homepage"/>'
    print '</form>'
    htmlTail()


if __name__ == '__main__':
    try:
        main()
    except:
        cgi.print_exception()
