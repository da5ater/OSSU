;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname letterGrade) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Letter-grade is one of :
;; - A
;; - B
;; - C

;; interp. the letter grade in a course
;;<examples are redundent for enumerations> 

#;
(define (fn-for-letter-grade lg)
  (cond [(string=? l "A") (...)]
        [(string=? lg "B") (...)]
        [(string=? lg "C") (...)]) )

;; template rules used :
;; - one of: 3 cases
;; - atomic ditinct : "A"
;; - atomic ditinct : "B"
;; - atomic ditinct : "C"

;; function :

;; letter-grade -> letter-grade
;; produce next highest letter grade ( no change for a )

;(define (bumb-up lg) "A")

(check-expect (bumb-up "A") "A")
(check-expect (bumb-up "B") "A")
(check-expect (bumb-up "C") "B")

;; <use template from letter-grade>

(define (bumb-up lg)
  (cond [(string=? lg "A") "A"]
        [(string=? lg "B") "A"]
        [(string=? lg "C") "B"]) )
