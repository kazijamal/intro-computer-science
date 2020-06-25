#lang racket

; 6
(define length
  (λ (L)
    (if (null? L)
        0
        (+ 1 (length (cdr L))))))

(length '(1 2 3)) ;3

(define maxList
  (λ (L)
    (if (= (length L) 1)
        (car L)
        (max (car L)
             (max (car L)
                  (maxList (cdr L)))))))

(maxList '(100)) ;100
(maxList '(0 3 2 5 4)) ;5
(maxList '(-3 -1 -5)) ;-1


; 7
(define myLast
  (λ (L)
    (if (= (length L) 1)
        (car L)
        (myLast (cdr L)))))

(myLast '(3)) ;3
(myLast '(1 2 3 4 5)) ;5


; 8
(define item
  (λ (n L)
    (if (zero? n)
        (car L)
        (item (- n 1) (cdr L)))))

(item 0 '(a b)) ;'a
(item 1 '(a b)) ;'b
(item 2 '(a b (c d) e)) ;'(c d)
(item 3 '(a b (c d) e)) ;'e


; 9
(define reduceR
  (λ (op L)
    (op (myLast L) (item (- (length L) 1) L))))

(reduceR + '(1 2 3)) ;((3 + 2) + 1) = 6
(reduceR max '(1 2 3)) ; max (max (3 2) 1) = 3
(reduceR min '(1 2 3)) ; min (min (3 2) 1) = 1