(defun SET-EXCL-UNION (K L)
	(if L 
		(if (member (car L) K) 
			(SET-EXCL-UNION (SET-REMOVE (car L) K) (cdr L)) 
			(SET-EXCL-UNION (cons (car L) K) (cdr L))) 
		K))