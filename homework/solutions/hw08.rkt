;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw08) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1
n= nonegative integer
d= positive integer
(remainder n d)
The set of integers contained in the interval [0, d)


; 2

;; Nonnegative_Integer -> Nonegative_Integer
(define minCoins
  (λ (cents)
    (+ (quotient cents 25) 
       (quotient (remainder cents 25) 10) 
       (quotient (remainder (remainder cents 25) 10) 5)
       (quotient (remainder (remainder (remainder cents 25) 10) 5) 1))))
    
    
;; Unit Testing
(check-expect (minCoins 28) 4) ; 1 q, 3 p
(check-expect (minCoins 143) 10) ; 5 q, 1 d, 1 n, 3 p

