;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |my version|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; My world program  (make this more specific)

;; =================
;; Constants:
(define HIGHT 1000)
(define WIDTH HIGHT)
(define MTS (empty-scene HIGHT WIDTH))

(define CRAD 10)
(define CCOLOR "red")
(define CMODE "solid")

(define EWIDTH 40)
(define EHIGHT 20)
(define EMODE "solid")
(define ECOLOR "yellow")

(define ROT 60)

(define CENTER (circle CRAD CMODE CCOLOR))
(define BETAL  (ellipse EWIDTH EHIGHT EMODE ECOLOR))

(define FLOWER (overlay CENTER
                        BETAL
                        (rotate ROT BETAL)
                        (rotate (* ROT 2) BETAL)))

(define MAX 10)


;; =================
;; Data definitions:

(define-struct flower (X Y M))
;; flower is (make-flower int int int)
;;interp. a flower image that has
;;   x -> current x position on the screen
;;   y -> current y position on the screen
;;   M -> the multiplier in which the flower groflower 

(define F1 (make-flower 500 500 2 )) ; flower image at haf the screen with a multiplier of 2, 2 times;

#;
(define (fn-for-flower f)
  (... (flower-X f)(flower-Y f)(flower-M f) (flower-C f)))

;; template rules used :
;; - compound - 3 fields

;; =================
;; Functions:

;; flower -> flower
;; start the world with F1
;; 
(define (main flower)
  (big-bang flower                   ; flower
    (on-tick   tock)     ; flower -> flower
    (to-draw   render)   ; flower -> Image
    (on-mouse   handle-mouse)))    ; flower KeyEvent -> flower

;; flower -> flower
;; produce the next flower where by advancing the current multiplier  un til multiplier reach MAX;!!!

(check-expect (tock (make-flower 200 100 2)) (make-flower 200 100  3)) 
;(define (tock f) F1)

(define (tock f)
  (if (>= (flower-M f)  MAX ) (make-flower (flower-X f)(flower-Y f) (flower-M f))
      (make-flower (flower-X f)(flower-Y f) (+ (flower-M f) 1) )))

;; flower -> Image
;; render image of flower at C and Y but with CRAD , CWIDTH< CHIGHT myltiplied by 2

(check-expect (render (make-flower 500 500 2)) (place-image (draw-flower (make-flower 500 500 2))
                                                              500 500 MTS))
;(define (render flower) (circle  10 "solid" "red"))

(define (render f)
  (place-image
   (draw-flower f) (flower-X f) (flower-Y f) MTS))


;flower KeyEvent -> flower
;; change the x and y position of current flower on mouse click

(define (handle-mouse f x y me)
  (cond [(mouse=? me "button-down") (make-flower  x y 2 )]
        [else
         f]))

;; flower -> IMAGE
;; create the flower shape

(check-expect (draw-flower F1) (overlay (circle (* CRAD (flower-M F1)) CMODE CCOLOR)
                                        (ellipse (* EWIDTH (flower-M F1)) (* EHIGHT (flower-M F1)) EMODE ECOLOR)
                                        (rotate ROT (ellipse (* EWIDTH (flower-M F1)) (* EHIGHT (flower-M F1)) EMODE ECOLOR))
                                        (rotate (* ROT 2) (ellipse (* EWIDTH (flower-M F1)) (* EHIGHT (flower-M F1)) EMODE ECOLOR))))

;(define (draw-flower f) (circle 200 "solid" "red"))

(define (draw-flower f)
  (overlay (circle (* CRAD (flower-M f)) CMODE CCOLOR)
           (ellipse (* EWIDTH (flower-M f)) (* EHIGHT (flower-M f)) EMODE ECOLOR)
           (rotate ROT (ellipse (* EWIDTH (flower-M f)) (* EHIGHT (flower-M f)) EMODE ECOLOR))
           (rotate (* ROT 2) (ellipse (* EWIDTH (flower-M f)) (* EHIGHT (flower-M f)) EMODE ECOLOR))))