;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab04) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Part I
;; a.
(define fibR
  (λ (n)
    (if (or (= n 1) (= n 2))
        1
        (+ (fibR (- n 1))
           (fibR (- n 2))))))

(check-expect (fibR 1) 1)
(check-expect (fibR 2) 1)
(check-expect (fibR 3) 2)
(check-expect (fibR 4) 3)
(check-expect (fibR 5) 5)
(check-expect (fibR 6) 8)