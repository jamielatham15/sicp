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

; The interpreter evaluates the elements of the combination and applies the procedure (the value of the operator of the combination) to the arguements (the values of the 
; operands of the combination).

; Normal order evaluation method: "fully expand then reduce"
; Applicative order evaluation: "evaluate the arguments then apply"
; Lisp is applicative order.

; 1.1.6 Conditional Expressions and Predicates

(define (abs x)
    (cond   ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))
    )
)

(abs -1)
(abs 0)
(abs 1)

; cond is followed by parenthesized pairs of expressions (<p> <e>) called clauses
; the first expression in each pair is a predicate, that is, an expression whose value is 
; interpreted as either true or false

; each condition is evaluated until a predicate returns the value true.
; if none of the conditions is found to be true, cond remains undefined.

; another form using else:
(define (abs x)
    (cond   ((< x 0) (- x)
            (else x))))
; else causes the cond to return as its value the value of the corresponding <e> whenever
; all previous clauses have been bypassed

; and another using if:
(define (abs x)
    (if (< x 0)
        (- x)
        x))

; if is a restricted conditional used when there are precisely two cases in the analysis
; follows the form: (if <predicate> <consequent> <alternative>)

;  in addition to < > =, there are other logical comparison operators, the most common being: 

; and: expressions evaluates left to right. if any <e> evaluates to false, the value of 
; the expression is false and the remainder are not evaluated. If all are true, the expression is the value of the last one.

; or: expressions are evaluated one at a time, l to r order. If any <e> evaluates to true, that value is returned as the value of the expression, and the remainder are not
; evaluated.

; not: the value of a not expression is true when the expression <e> evaluates to false, 
; and false otherwise.

; and and or are special forms, not procedures, because the subexpressions are not all 
; necessarily evaluated. not is an ordinary procedure.

; 5 < x < 10 may be expresssed as:
(and (> x 5) (< x 10))

; define a greater or equal predicate 
(define (>= x y) (or (> x y) (= x y)))


