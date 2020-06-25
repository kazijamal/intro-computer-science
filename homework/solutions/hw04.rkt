;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname hw04) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Weights
(define exam_wt 0.8)
(define hw_wt 0.1)
(define participation_wt 0.1)

;; Exam Grades and Final
(define exam1 85)
(define exam2 88)
(define exam3 91)
(define exam4 95)
(define final 92)

;; Homework and Participation Grade
(define hw 100)
(define participation 90)

;;; Final Grade

;; Exam Grades and Final
(define examFinal
  (*
   (/
    (+ exam1 
       exam2 
       exam3 
       exam4
       (* 2
          final)
       )
    6)
   exam_wt)
  )

;; Homework
(define hwFinal (* hw
   hw_wt)
  )

;; Participation
(define participationFinal (* participation
   participation_wt)
  )

; Final Grade
(define finalGrade (+ examFinal
                 hwFinal
                 participationFinal)
  )

finalGrade


