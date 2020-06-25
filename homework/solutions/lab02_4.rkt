;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab02_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Removes ones digit of an integer.
;; Integer -> Integer
(define removeOnesDigit
  (λ (n)
    (quotient n 10)))

; Returns ones digit of an integer.
;; Integer -> Integer
(define onesDigit
  (λ (n)
    (abs (remainder n 10))))

; Returns tens digit of an integer.
;; Integer -> Integer
(define tensDigit
  (λ (n)
    (onesDigit (removeOnesDigit n))))

; Evaluates whether a year is a leap year or not.
;; Integer -> Boolean
(define isLeapYear?
  (λ (year)
    (or (zero? (remainder year 400))
        (and (zero? (remainder year 4))
             (not (zero? (remainder year 100)))))))

; Returns last two digits of an integer.
;; Integer -> Integer
(define lastTwoDigits
  (λ (y)
    (+ (onesDigit y)
       (* (tensDigit y) 10))))

; Returns quotient of last two digits of a year and 4.
;; Integer -> Integer
(define quotientWith4
  (λ (y)
    (quotient (lastTwoDigits y) 4)))

; Receives a month and returns a code from 0-6.
;; Integer -> Integer
(define monthKey
  (λ (m)
    (cond ((or (= m 4) (= m 7)) 0)
          ((or (= m 1) (= m 10)) 1)
          ((= m 5) 2)
          ((= m 8) 3)
          ((or (= m 2) (= m 3) (= m 11)) 4)
          ((= m 6) 5)
          ((or (= m 9) (= m 12)) 6)
          (else "Invalid month."))))

; Receives a year and returns a code that is an element of the set {4, 2, 0, 6}
;; Integer -> Integer
(define centuryCode
  (λ (y)
    (cond ((= (removeOnesDigit (removeOnesDigit y)) 17) 4)
          ((= (removeOnesDigit (removeOnesDigit y)) 18) 2)
          ((= (removeOnesDigit (removeOnesDigit y)) 19) 0)
          ((= (removeOnesDigit (removeOnesDigit (removeOnesDigit y))) 2) 6)
          (else "Invalid year."))))

; Computes everything to find the day of a date in a year, except for finding the
; remainder when divided by 7 and evaluating the string corresponding to the day.
;; Integer Integer Integer -> String
(define allButRemainder
  (λ (m d y)
    (+ (if (and (or (= m 1) (= m 2)) (isLeapYear? y))
           (- (+ (quotientWith4 y) d (monthKey m)) 1)
           (+ (quotientWith4 y) d (monthKey m)))
       (centuryCode y) (lastTwoDigits y))))

; Takes allButRemainder, divides it by 7 and the remainder calculated, which is an integer
; from 0-6, corresponds to a string which is the day of the date.
;; Integer Integer Integer -> String
(define dayOfDate
  (λ (m d y)
    (cond ((= 0 (remainder (allButRemainder m d y) 7)) "Sat.")
          ((= 1 (remainder (allButRemainder m d y) 7)) "Sun.")
          ((= 2 (remainder (allButRemainder m d y) 7)) "Mon.")
          ((= 3 (remainder (allButRemainder m d y) 7)) "Tues.")
          ((= 4 (remainder (allButRemainder m d y) 7)) "Wed.")
          ((= 5 (remainder (allButRemainder m d y) 7)) "Thurs.")
          ((= 6 (remainder (allButRemainder m d y) 7)) "Fri."))))

(check-expect (dayOfDate 3 5 2014) "Wed.")
(check-expect (dayOfDate 12 15 2482) "Tues.")