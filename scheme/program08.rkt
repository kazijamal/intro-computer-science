;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program08) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define myabs
  (λ (x)
    (if (> x 0) x (- x))))

(check-expect (myabs 3) 3)
(check-expect (myabs -3) 3)

(define rect
  (λ (t)
    (if (>= t 1/2) (if (> t