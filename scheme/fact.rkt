#lang racket
(define fact
  (λ (n)
    (if (= n 1)
        1
        (* n (fact (- n 1))))))

(define x (fact 4))
display x