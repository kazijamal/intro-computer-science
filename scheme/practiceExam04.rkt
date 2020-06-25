#lang racket
;; I
; 1. 4
; 2. hat
; 3. '((sat (mat ((cat)))) fat (rat)))
; 4. (sat (mat ((cat))))
; 5. (caadr (cadadr L))
; 6. (car (cadadr L))
; 7. (pat hat (sat (mat ((cat)))) fat (rat))
; 8. '((pat) hat (sat (mat ((cat)))) fat (rat))
; 9. '((hat (sat (mat ((cat)))) fat (rat)))
; 10.(cons (car L)
;      (cons (caadr L)
;            (cons (car (cadadr L))
;                  (cons (caaadr (cadadr L))
;                        (cons (caddr L)
;                              (cons (car (cadddr L)) '()))))))

;; II
(define atom?
  (λ (L)
    (not (list? L))))

(define lat?
  (λ (L)
    (cond ((null? L) true)
          ((atom? (car L)) true (lat? (cdr L)))
          (else false))))

(lat? '()) ;true
(lat? '(ham and cheese)) ;true
(lat? '(ham () cheese)) ;false

;; III
(define mymap
  (λ (pred L)
    (if (null? L)
        L
        (cons (pred (car L)) (mymap pred (cdr L))))))

(mymap odd? '()) ;'()
(mymap even? '(0 1 2 3 4)) ;'(#t #f #t #f #t)
(mymap (lambda (n) (> n 3)) '(0 1 2 3 4)) ;'(#f #f #f #f #t)

;; IV
(define set
  (λ (L)
    (cond ((null? L)
           L)
          ((not (occurs? cddr (cadr L)))
           (cons (cadr L (cons (car L))) '())))))