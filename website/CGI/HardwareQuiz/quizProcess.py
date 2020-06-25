#!/usr/bin/python

import cgi

def htmlTop():
    print '''Content-type:text/html\n\n
            <!DOCTYPE html>
            <html lang="en-US">
                <head>
                    <meta charset="utf-8" />
                    <link rel="stylesheet" type="text/css" href="../../mystyle.css">
                    <title> Online Hardware Quiz Results </title>
                </head>
                <body>'''

def htmlTail():
    print '''</body>
            </html>'''

def getData():
    quizForm = cgi.FieldStorage()
    return {"q1": quizForm.getvalue("q1"),
            "q2": quizForm.getvalue("q2"),
            "q3": quizForm.getvalue("q3"),
            "q4": quizForm.getvalue("q4"),
            "q5": quizForm.getvalue("q5"),
            "q6": quizForm.getvalue("q6"),
            "q7": quizForm.getvalue("q7"),
            "q8": quizForm.getvalue("q8"),
            "q9": quizForm.getvalue("q9"),
            "q10": quizForm.getvalue("q10")}

quizForm = getData()

questions = ['q1','q2','q3','q4','q5','q6','q7','q8','q9','q10']
answers = ['a3','a5','a2','a2','a4','a1','a4','a3','a2','a5']

def main():
    htmlTop()
    print '<h1>Online Hardware Quiz Results</h1>'
    num = 0
    correct = 0
    for q in questions:
        print '<h3>Question {}:</h3>'.format(num+1)
        if quizForm[q] == answers[num]:
            print '<p style="color:#00A11B;"> Correct! </p>'
            correct += 1
        else:
            print '<p style="color:#A10000;"> Incorrect. </p>'
        num += 1
    print '<h2>Your score: {}/10 or {}%</h2>'.format(correct, correct*10)
    print '<form method="post" action="quizForm.html">'
    print '<input type="submit" name="try" value="Try Again"/>'
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
