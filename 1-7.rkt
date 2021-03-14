#lang racket

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

; (define (good-enough? guess x)
;     (< (abs (- (* guess guess) x)) 0.0001))

(define (good-enough? guess x)
    (= (improve guess x) guess))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(define x 100000000000000)
(sqrt x)
(* (sqrt x) (sqrt x))

; tolerance too large for very small numbers
; tolerance too small for very large numbers given limited precision. After a certain point
; the answer will be identical every iteration, and will enter infinite loop

; the solution is to keep refining until the next guess is the same as the last