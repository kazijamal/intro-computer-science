;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname classworkOctober2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; 1.1
;; 10, 12, 8, 3, 6, 19, false, 4, 16, 6, 16

; 1.2
(/ (+ 5
      4
      (- 2
         (- 3
          (+ 6 1/3))))
   (* 3
      (- 6 2)
      (- 2 7)))

; 1.3
;; Number Number Number -> Number
(define procedure
  (λ (a b c)
    (+ (* (max a b c) (max a b c))
       (* (max a b) (max a b)))))

;; Unit Testing
(check-expect (procedure 4 3 8) 80)
(check-expect (procedure -3 7 12) 193)

