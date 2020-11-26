#lang sicp

; Primative expressions, means of combination, means of abstraction

; 1.1.1 Expressions
486

; Are combined with procedures (eg. + - / *) to form compound expressions
(+ 137 349)

; There is no limit to complexity of compounding
(+  ( * 3 
        (+  (* 2 4)
            (+ 3 5)))
    (+  ( - 10 7)
        6))

; 1.1.2 Naming and the Environment

; Provides the means to refer to computational objects
; keyword: define
(define size 2)

; causes interpreter to associate the value 2 with the name size
size

; for example
(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
circumference

; 1.1.3 Evaluating Combinations

; To evaluate a combination, do the following
    ; 1. Apply the subexpressions of the combination
    ; 2. Apply the procedure that is the leftmost subexpression (the operator) to the 
    ; arguments that are the values of the other subexpressions

; The evaluation rule is recursive in nature, because, in order to evaluate the 
; combination we must first perform the evaluation process on each element of the 
; combination

; The evaluation rule is recursive because it includes as one of its steps the need to 
; invoke the rule itself

; 1.1.4 Compound Procedures

; A more powerful abstraction technique by which a compound operation can be given a name
; and referred to as a unit. For example, squaring:
(define (square x) (* x x))
; to square something, multiply it by itself

; the general form:
; (define (<name>  <formal parameters>)
    ; <body>)

(square 21)

(square (+ 2 5))

(square (square 3))

; We can also use square as a building block in defining other procedures
; for example x^2 + y^2
(define (sum-of-squares x y)
    (+ (square x) (square y)))

(sum-of-squares 3 4)

; Now we can use sum-of-squares as a building block in constructing further procedures
(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))

(f 5)

; 1.1.5 The substitution model for procedure application


