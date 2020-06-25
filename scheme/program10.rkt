;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; 1
;; Integer -> Integer
;; n is positive
(define factR
  (λ (n)
    (if (= n 0)
        1
        (* n (factR (- n 1))))))

; 3
;; Tail Recursion
(define fact-iter
  (λ (n ans)
    (if (= n 0)
        ans
        (fact-iter (- n 1) (* n ans)))))

;; Interface
(define factI
  (λ (n)
    (fact-iter n 1)))

(factR 4)
(factI 4)
