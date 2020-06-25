#lang racket

(define length
  (λ (L)
    (if (null? L)
        0
        (+ 1 (length (cdr L))))))

(define myLast
  (λ (L)
    (if (= (length L) 1)
        (car L)
        (myLast (cdr L)))))

(define nItem
  (λ (n L)
    (if (zero? n)
        (car L)
        (nItem (- n 1) (cdr L)))))

; a
(define reduceR
  (λ (op L)
    (if (= (length L) 2)
        (op (cadr L)
            (car L))
        (op (reduceR op (cdr L))
            (car L)))))

(reduceR + '(1 2 3))    ;6
(reduceR max '(1 2 3))  ;3
(reduceR min '(1 2 3))  ;1
(reduceR * '(1 2 3))    ;6
(reduceR - '(1 2 3 4))  ;-2 


; b
(define reduceL
  (λ (op L)
    (if (= (length L) 2)
        (op (car L)
            (cadr L))
        (reduceL op (cons (op (car L)
                              (cadr L))
                          (cddr L))))))

(reduceL + '(1 2 3 4))  ;10
(reduceL max '(1 2 3))  ;3
(reduceL min '(1 2 3))  ;1
(reduceL * '(1 2 3))    ;6
(reduceL - '(1 2 3 4))  ;-8