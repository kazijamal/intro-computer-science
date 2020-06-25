;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program04) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; I
((λ(x)(+ ((λ (y) (* 2 y)) 3) x)) 4)

; II
;; Number -> Number
(define f
  (λ (a b)
     (+ a (abs b))))

(f 1 2)

;; Unit Testing
;(check-expect (f 1 -3) 4)
;(check-expect (f -3 1) -2)
