#lang racket

;; Integer Data -> List
(define makeList
  (λ (n x)
    (if (= n 0)
        '()
        (cons x (makeList (- n 1) x)))))

(makeList 0 'hi) ;'()
(makeList 1 'hi) ;'(hi)
(makeList 3 'hi) ;'(hi hi hi)

(makeList 3 'hi)
(cons 'hi (makeList 2 'hi))
(cons 'hi (cons 'hi (makeList 1 'hi)))
(cons 'hi (cons 'hi (cons 'hi '())))
(cons 'hi (cons 'hi '(hi)))
(cons 'hi '(hi hi))
'(hi hi hi)


(define length
  (λ (L)
    (if (null? L)
        0
        (+ 1 (length (cdr L))))))

;; Data List -> List
(define dupla
  (λ (x L)
    (makeList (length L) x)))

(dupla 0 '(a b c)) ;'(0 0 0)
(dupla 'a '()) ;'()
(dupla '() '(2 (3 4) 5 (()))) ;'(() () () ())

;; Data Data List -> List
(define insertL
  (λ (a b L)
    (cond ((null? L) L)
          ((equal? a (car L)) (cons b L))
          (else (cons (car L)
                      (insertL a b (cdr L)))))))
          

(insertL 'cat 'hat '(bat sat cat mat)) ;'(bat sat hat cat mat)   inserts b before first occurence of a in L
(insertL 6 5 '(0 1 2 3 4)) ;'(0 1 2 3 4)     if a is not present in L, return L
(insertL 6 5 '(4 6 6)) ;'(4 5 6 6)     if a appears more than once insert b before first occurence of a in L
