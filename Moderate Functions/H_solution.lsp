 (defun UNREPEATED-ELTS (L) (
		if(> (length L) 1) 
			(if (equal (car L) (cadr L))
					(if (equal (cadr L) (caddr L)) 
						(UNREPEATED-ELTS (cdr L)) 
						(UNREPEATED-ELTS (cddr L)))
					(cons (car L) (UNREPEATED-ELTS (cdr L))))
		L))