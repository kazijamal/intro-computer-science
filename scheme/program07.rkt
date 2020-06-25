;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program07) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Integer -> Boolean
(define myeven?
  (λ (n)
    (= (remainder n 2) 0)))

;; Unit Testing
(check-expect (myeven? 4) true)
(check-expect (myeven? -4) true)
(check-expect (myeven? 0) true)

;; Integer -> Boolean
(define myodd?
  (λ(n)
    (not (= (remainder n 2) 0))))

;; Unit Testing
(check-expect (myodd? 3) true)
(check-expect (myodd? -3) true)
