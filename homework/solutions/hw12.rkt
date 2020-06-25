;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hw12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1
(define xor3
    (lambda (a b c)
          (cond ((and a b c) #f)
                ((xor a b) (not c))
		(else c))))

(xor3 false false true)

;; no questions are evaluated, and the answer
;; evaluated is c, which follows else; none of
;; the questions are true, therefore no other
;; questions or answers must be evaluated

; 2
;; Boolean Data Data -> Data
(define newIf
  (λ (a b c)
    (cond (a b)
          (else c))))

;; Unit Testing
(check-expect (newIf (even? 3) 1 2) 2)
(check-expect (newIf (odd? 3) 1 2) 1)

;; (newIf (even? 3) (/ 3 0) 2) results in a division by zero error,
;; while (if (even? 3) (/ 3 0) 2) does not because since newIf
;; contains a conditional, the coniditonal must evaluate question1
;; since it is the only question (not including else), and that results
;; in evaluation of the answer (/ 3 0) which is a divison by zero error