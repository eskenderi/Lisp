(defun SINGLETONS (L) 
	(if (< 1 (length L)) 
		(if (member (car L) (cdr L)) 
			(SINGLETONS (SET-REMOVE (car L) (cdr L))) 
			(cons (car L) (SINGLETONS (cdr L))))
		L))