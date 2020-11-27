#lang sicp

; (p) is defined in terms of itself. calling (p) will create infinite recursive calls to 
; itself. The program will hang if (p) is evaluated.

; In applicative-order evaluation, all arguments are evaluated before being applied. The 
; program will therefore hang upon being called in this case.

; In normal-order evaluation, all arguments are expanded into the body of the procedure. (p) is therefore not evaluated until the body of the if clause. If evaluates the predicate first, which in this case is true, (= x 0), so the function returns 0 and never evaluates y (p). The program will complete successfully.