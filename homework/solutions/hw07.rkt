;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw07) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Integer -> Digit
   ;  Digit : 0,1,2,...,8,9
   (define onesDigit
     (lambda (n)
         (abs (remainder n 10))))

;; Integer -> Integer
; Digit : 0,1,2,...,8,9
(define removeOnesDigit
  (λ (n)
    (quotient n 10)))

;; Unit Testing
(check-expect (removeOnesDigit 235) 23)
(check-expect (removeOnesDigit -335) -33)