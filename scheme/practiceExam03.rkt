;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname practiceExam03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; I
;; a.
(define fib-iter
  (λ (first second n)
    (cond ((= n 1) first)
          ((= n 2) second)
          (else (fib-iter second (+ first second) (- n 1))))))

(define fibI
  (λ (n)
    (fib-iter 1 1 n)))

(check-expect (fibI 1) 1)
(check-expect (fibI 2) 1)
(check-expect (fibI 3) 2)
(check-expect (fibI 4) 3)
(check-expect (fibI 5) 5)
(check-expect (fibI 6) 8)

;; b.
(fibI 8)
(fib-iter 1 1 8)
(fib-iter 1 2 7)
(fib-iter 2 3 6)
(fib-iter 3 5 5)
(fib-iter 5 8 4)
(fib-iter 8 13 3)
(fib-iter 13 21 2)
21

;; c.
8 steps

;; d.
(define c (time (fibI 100)))
; Yes, because it takes 100 steps (n steps).


; II
;; a.
(define phi (/ (+ 1 (sqrt 5)) 2))

;; b.
(define dist
  (λ (a b)
    (abs (- a b))))

;; c.
1. 3
2. 2
3. 13
4. 12
5. -4
6. -3
7. 9

;; d.
(define closestInteger
  (λ (x)
    (