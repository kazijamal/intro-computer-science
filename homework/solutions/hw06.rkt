;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw06) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; 1
;; Number Number -> Number
(define max2
  (λ (a b)
    (* 1/2
       (+ a
          b
          (abs (- a b))))))

;; Unit Testing
;(check-expect (max2 3 5) 5)
;(check-expect (max2 5 3) 5)
;(check-expect (max2 -3 -5) -3)
;(check-expect (max2 3 3) 3)


;;; 2
;; Number Number Number -> Number
(define max3
  (λ (a b c)
    (max2 (max2 a
                b)
          c)))

;; Unit Testing
;(check-expect (max3 1 2 3) 3)
;(check-expect (max3 -12 -4 -5) -4)
