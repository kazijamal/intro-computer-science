;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1. It can't short circuit because you have to check the value of both
; a and b to find out whether its true or false


; 2. 
;; Boolean Boolean -> Boolean
(define myand
  (λ (a b)
    (not (or (not a)
             (not b)))))
  
;; Unit Testing
(check-expect (myand true false) false)
(check-expect (myand true true) true)
(check-expect (myand false false) false)
(check-expect (myand false true) false)

; My version of the and logical operator can short circuit if the value of a is false,
; because the or logical operator is looking for at least one true value, so using not
; a as the first arguement for or means a false value for a returns a true argument,
; therefore short circuiting and making the whole function return false, with no need
; to check if the value of b is true or false.


; 3.
;; Integer -> Boolean
(define leapYear?
  (λ (year)
    (or (zero? (remainder year 400))
        (and (zero? (remainder year 4))
             (not (zero? (remainder year 100)))))))

;; Unit Testing
(check-expect (leapYear? 2000) true)
(check-expect (leapYear? 2000) true)
(check-expect (leapYear? 2100) false)
(check-expect (leapYear? 2017) false)


; 4.
;; Boolean Boolean -> Boolean
(define xor
  (λ (a b c)
    (and
     (not (and a b))
     (not (and b c))
     (not (and a c))
     (or a b c))))

;; Unit Testing
(check-expect (xor true true false) false)
(check-expect (xor true false true) false)
(check-expect (xor false false false) false)
(check-expect (xor true true true) false)
(check-expect (xor true false false) true)
(check-expect (xor false true false) true)