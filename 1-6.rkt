#lang sicp

; because scheme uses applicative order when evaluating functions,
; all the arguements are evaluated prior to returning
; this results in an infinite loop because, even when an acceptable answer is found
; the scheme interpreter will continue to try and evaluate the second clause resulting in
; infinite recursion
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (* guess guess) x)) 0.0001))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 4)