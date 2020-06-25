;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;1
;a
;;Number -> Boolean
(define betweenBa? ;; a < b
  (λ (n a b)
    (< a n b)))

;; Unit Testing
(check-expect (betweenBa? 3 2 6) true)


;b
;; Number -> Boolean
(define between? ;; a < or > b
  (λ ( n a b)
    (or (< a n b) (< b n a))))

;; Unit Testing
(check-expect (between? 7 4 9) true)
(check-expect (between? 3 2 6) true)


; 2
;; Boolean Boolean -> Boolean
(define xor
  (λ (a b)
    (and
     (or a b)
     (not (and a b)))))

;; Unit Testing
(check-expect (xor true true) false)
(check-expect (xor true false) true)
(check-expect (xor false true) true)
(check-expect (xor false false) false)
