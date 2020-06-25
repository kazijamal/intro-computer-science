;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw05) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;; Test Cases
;(circle_area 2)
;(circle_area 3)


;;; Problem 2
;; Number -> Number
; r1 and r2 are radii
; r1 must be the greater radius
(define annulus_area
  (λ (r1 r2)
    (- (circle_area r1)
       (circle_area r2))))

;; Test Cases
;(annulus_area 3 2)
;(annulus_area 5 4)