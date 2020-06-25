;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname program03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Coin denominations


;; Variables - coins
(define penny 1)
(define nickel (+ penny penny penny penny penny))
(define dime (+ nickel nickel))
(define quarter (* nickel nickel))

;; Exercise: Write an expression to compute the amount of money,
;; in cents, given 3 pennies, 2 nickels, 4 dimes, and 6 quarters.
(+ (* 3 penny) 
   (* 2 nickel) 
   (* 4 dime) 
   (* 6 quarter))
