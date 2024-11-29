;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define INVADER-X-SPEED 1.5)  ;speeds (not velocities) in pixels per tick
(define INVADER-Y-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED 10)

(define HIT-RANGE 10)

(define INVADE-RATE 100) 

(define BACKGROUND (empty-scene WIDTH HEIGHT))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "blue")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "blue")))            ;saucer

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "black")       ;tread center
                       (ellipse 30 10 "solid" "green"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "black")       ;gun
                     (rectangle 20 10 "solid" "black"))))   ;main body

(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define MISSILE (ellipse 5 15 "solid" "red"))


;; Data Definitions:

(define-struct game (invaders missiles tank))
;; Game is (make-game  (listof Invader) (listof Missile) Tank)
;; interp. the current state of a space invaders game
;;         with the current invaders, missiles and tank position

;; Game constants defined below Missile data definition

#;
(define (fn-for-game s)
  (... (fn-for-loinvader (game-invaders s))
       (fn-for-lom (game-missiles s))
       (fn-for-tank (game-tank s))))



(define-struct tank (x dir))
;; Tank is (make-tank Number Integer[-1, 1])
;; interp. the tank location is x, HEIGHT - TANK-HEIGHT/2 in screen coordinates
;;         the tank moves TANK-SPEED pixels per clock tick left if dir -1, right if dir 1

(define T0 (make-tank (/ WIDTH 2) 1))   ;center going right
(define T1 (make-tank 50 1))            ;going right
(define T2 (make-tank 50 -1))           ;going left

#;
(define (fn-for-tank t)
  (... (tank-x t) (tank-dir t)))



(define-struct invader (x y dx))
;; Invader is (make-invader Number Number Number)
;; interp. the invader is at (x, y) in screen coordinates
;;         the invader along x by dx pixels per clock tick

(define I0 (make-invader  0 0 10))           ;not landed, moving right
(define I1 (make-invader  (+ 0 ( * INVADER-X-SPEED 10)) (+ 0 ( * INVADER-Y-SPEED 10)) 10))       ;exactly landed, moving left
(define I2 (make-invader  10 10 10)) ;> landed, moving right
(define I3 (make-invader  (+ 10 ( * INVADER-X-SPEED 10))  (+ 10 ( * INVADER-X-SPEED 10)) 10))
(define I4 (make-invader  WIDTH 0 10))
(define I5 (make-invader  (+ WIDTH ( * INVADER-X-SPEED ( - 10))) (+ 0 ( * INVADER-Y-SPEED 10)) -10))
(define I6 (make-invader  -1 0 10))
(define I7 (make-invader  (+ -1 ( * INVADER-X-SPEED 10)) (+ 0 ( * INVADER-Y-SPEED 10)) 10))


#;
(define (fn-for-invader invader)
  (... (invader-x invader) (invader-y invader) (invader-dx invader)))


(define-struct missile (x y))
;; Missile is (make-missile Number Number)
;; interp. the missile's location is x y in screen coordinates

(define M1 (make-missile 150 300))                       ;not hit I1
(define M2 (make-missile (invader-x I1) (+ (invader-y I1) 10)))  ;exactly hit I1
(define M3 (make-missile (invader-x I1) (+ (invader-y I1)  5)))  ;> hit I1

#;
(define (fn-for-missile m)
  (... (missile-x m) (missile-y m)))



(define G0 (make-game empty empty T0))
(define G1 (make-game empty empty T1))
(define G2 (make-game (list I1) (list M1) T1))
(define G3 (make-game (list I1 I2) (list M1 M2) T1))

;;----------------------
;;ListOfInvaders is one of :
;; - empty
;; - (list invader ListOfInvaders)
;; interp. a list of invaders

(define LOI0 false)
(define LOI1 (list I1 I2))

#;
(define (fn-for-los los)
  (cond [(false? los) (...)]                   ;BASE CASE
        [else (... (fn-for-los (first los))                 ;String
                   (fn-for-los (rest los)))]))


;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;; game -> game
;; start the world with G0
;; 
(define (main game)
  (big-bang game                   ; game
    (on-tick   tock)     ; game -> game
    (to-draw   render)   ; game -> Image
    (stop-when stop)      ; game -> Boolean
    ))    
;;-----------------------------------------
;; game -> game
;; produce the next game phase
;; invaders :
;; add new invader after using INVADE-RATE at different velocities ??


;(check-expect (tock G0) (make-game (list (make-invader 0 0 1)) empty empty))
;(check-expect (tock G0) (make-game (list (make-invader 0 0 2)  (make-invader 10 10 10)) empty empty))

 
(define (tock s)
  (add-rand-invader (update-invader (game-invaders s) ) ))
;;------------------------------------------------------------
;;; ++ivaders++


;; LOI -> LOI
;; advance all the invaders x and y by dx
;; advance current x and y by dx
;; if x is width or 0  nigate dx

(check-expect (update-invader false) false)
(check-expect (update-invader  (list I0)) (list I1))
(check-expect (update-invader  (list I0 I2))
              (list I1 I2))
(check-expect (update-invader  (list I4 I2))
              (list I5 I3))
(check-expect (update-invader  (list I6 I2))
              (list I7  I3))


;(define (update-invader loi) false)


(define (update-invader los)
  (cond [(false? los) false]                   ;BASE CASE
        [else (list (check-for-edge (first los))                 ;String
                    (update-invader (rest los)))]))

;; invader -> invader
;; advance invader id is inbound
; if invader-x > width (negates dx and subtract it from x
; if invader-x < 0 (negates dx and add it to x

(check-expect ( check-for-edge I0 ) I1)
(check-expect ( check-for-edge I2 ) I3)
(check-expect ( check-for-edge I4 ) I5)
(check-expect ( check-for-edge I6 ) I7)

;(define (check-for-edge i) I1)
;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; loi -> loi
;; add invader at random points
;; y = 0 but x and dx is random
;; !!!

(define (add-rand-invader loi) loi)


;; game -> Image
;; render ... 
;; !!!
(define (render game) ...)

;; last-world? -> game
;; use the function last-world? to check if any invader toched home teritory
;;!!!
(define (stop last-world?) G0)