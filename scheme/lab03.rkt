;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; 1
(define powFast-iter
  (λ (b n ans)
    (cond ((= n 0) ans)
          ((even? n) (powFast-iter (sqr b) (/ n 2) ans))
          (else (* (* ans b) (powFast-iter b (- n 1) ans))))))

(define powFastI
  (λ (b n)
    (powFast-iter b n 1)))

(check-expect (powFastI 3 3) 27)
(check-expect (powFastI 2 4) 16)


; 2
(define c (time (powFastI 2 1e6)))
cpu time: 0 real time: 1 gc time: 0


; 3
(powFastI 2 10)
(pfiter 4 5 1)
(* 4 (pfiter 4 4 1))
(* 4 (pfiter 16 2 1))
(* 4 (pfiter 256 1 1))
(* 4 (* 256 (pfiter 256 0 1)))
(* 4 (* 256 1))
(* 4 256)
1024 ; 8 steps

; 4
(powFastI b n) requires (- n b) steps