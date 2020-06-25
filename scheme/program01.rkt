;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname program01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; This is my first program

;; Variables
(define a 10)
(define b 2)

;; Basic Arithmetic
(+ a b)   ;; 12
(- a b)   ;; 8
(- b a)   ;; -8
(* a b)   ;; 20
(/ a b)   ;; 5
(/ b a)   ;; 0.2
(- a)     ;; -10

;; hw02 question 2

(define x 10)
(define y 5)
(define z 3)
(define t 2)

(*(/ x (- y z)) t)