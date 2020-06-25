;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program09) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Boolean Boolean Boolean -> Boolean
(define xor3
  (λ (a b c)
    (= 1 (+ (if a 1 0)
           (if b 1 0)
           (if c 1 0)))))

;; Unit Testing
(check-expect (xor3 true true true) false)
(check-expect (xor3 true true false) false)
(check-expect (xor3 true false false) true)
(check-expect (xor3 false false false) false)
(check-expect (xor3 true false true) false)

