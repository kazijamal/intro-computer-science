;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program05) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Variable/Constant Definitions
(define my_pi 3.14)

;;; Problem 1
;; Number -> Number
; r is a radius
(define circle_area
  (λ (r)
    (* my_pi
       r
       r)))

;; Unit Testing
;(check-expect (circle_area 1) 3.14)
;(check-expect (circle_area 2) 12.56)


;;; Problem 2
;; Number -> Number
; preconditions: r1 and r2 are radii of concentric circles           
(define annulus_area
  (λ (r1 r2)
    (abs (- (circle_area r1)
       (circle_area r2)))))

;; Unit Testing
;(check-expect (annulus_area 2 1) 9.42)
;(check-expect (annulus_area 1 2) -9.42)