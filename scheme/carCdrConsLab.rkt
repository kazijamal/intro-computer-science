#lang racket
(define L '(a b c d e))

; 1
(cons (cadr L) '())
; 2
(cons (car L) (cons (cadr L) '()))
; 3
(cons (cadr L) (cons (car L) '()))
; 4
(cons (cons (car L) '()) '())
; 5
(cons (cons 'a (cons (cadr L) '())) '())
; 6
(cons L '())
; 7
(cons (cons (cons (car L) '()) '()) '())
; 8
(cons (cadr (cddr L)) (cons (cadr (cddr L)) (cons (cadr (cdddr L)) '())))
; 9
(cons (car L) (cons (cadr (cdddr L)) '()))
; 10
(cons (cadr L) (cons (caddr L) (cons (cadr (cdr (cdr L))) '())))
; 11
(cons L (cons 