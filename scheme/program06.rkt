;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname program06) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define onesDigit
  (λ (n)
    (abs (remainder n 10))))

(define removeOnesDigit
  (λ (n)
    (quotient n 10)))

(define tensDigit
  (λ (n)
    (onesDigit (removeOnesDigit n))))

(define hundredsDigit
  (λ (n)
    (tensDigit (removeOnesDigit n))))

(tensDigit 2015)

(removeOnesDigit (removeOnesDigit 2015))