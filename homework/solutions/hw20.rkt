#lang racket

; 2
(define sum
  (λ (L)
    (if (null? L)
        0
        (+ (car L) (sum (cdr L))))))

; 3
(define numOfItems
  (λ (L)
    (if (null? L)
        0
        (+ 1 (numOfItems (cdr L))))))

(define avg
  (λ (L)
    (/ (sum L) (numOfItems L))))
