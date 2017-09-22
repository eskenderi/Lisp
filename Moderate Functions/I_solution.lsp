 (defun REPEATED-ELTS (L) (
		if(> (length L) 1) 
			(if	(equal (car L) (cadr L))
					(if (equal (cadr L) (caddr L)) 
						(REPEATED-ELTS (cdr L))
						(cons (car L) (REPEATED-ELTS (cddr L))))
					(REPEATED-ELTS (cdr L)))
		'()))