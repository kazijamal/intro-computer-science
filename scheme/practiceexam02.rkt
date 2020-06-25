;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname practiceexam02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define xor
  (λ (a b)
    (and (not (and a b))
         (or a b))))

(define xor3
  (λ (a b c)
    (and (not (and a b c))
         (xor (xor a b) c))))

(define xor4
  (λ (a b c d)
    (cond ((and a b c d) false)
          ((not (or a b c d)) false)
          ((xor3 a b c) (if (or (xor3 a b d)
                                 (xor3 b c d)
                                 (xor3 a b d)) 
                            true
                            false))
          (else false))))

(xor4 true true true false)
(xor4 true false false false)
