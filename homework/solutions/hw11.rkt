;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1
;; Boolean Boolean Boolean -> Boolean
(define xor3
     (λ (a b c)
       (and (not (and a b c))
            (xor (xor a b) c))))

; a.
;; (xor3 true true false) returns false

; b.
;; xor3 will never short circuit because there exists the logical
;; operator and, meaning both the values of (not (and a b c)) as
;; well as (xor (xor a b) c)))) must be checked before it can
;; return a value; also, a user created function cannot short circuit


; 2
;; Number -> Number
(define rect
  (λ (t)
    (if (>= (abs t) 1/2)
        (if (= (abs t) 1/2) 1/2 0)
        1)))

;; Unit Testing
(check-expect (rect 5) 0)
(check-expect (rect -5) 0)
(check-expect (rect 1/2) 1/2)
(check-expect (rect -1/2) 1/2)
(check-expect (rect 0) 1)