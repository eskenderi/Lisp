
(defun NEG-NUMS (L) (cond 
						((equal L nil) '()) 
						((>= (car L) 0) (NEG-NUMS (cdr L)))
						(t (cons (car L) (NEG-NUMS (cdr L)))) ))