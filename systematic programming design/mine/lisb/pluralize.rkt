;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pluralize) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; string -> string
;; put an s at the end of the given word

(check-expect (pluralize "dog") "dogs") 

;(define (pluralize s) "s")

(define (pluralize s)
  ( string-append s "s"))