;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw09) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1

;; Number -> Boolean
(define pos?
  (λ (n)
    (> n 0)))

;; Unit Testing
(check-expect (pos? 3) true)
(check-expect (pos? 2) true)
(check-expect (pos? -2) false)


; 2

;; Number Number Number -> Boolean
(define increasing?
  (λ (a b c)
    (< a b c)))

;; Unit Testing
(check-expect (increasing? 1 2 3) true)
(check-expect (increasing? 5 5 8) false)
(check-expect (increasing? 9 8 1) false)