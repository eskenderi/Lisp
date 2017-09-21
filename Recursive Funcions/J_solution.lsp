
(defun SET-UNION (K L) 
	(if L 
		(if (member (car L) K) 
			(SET-UNION K (cdr L))
			(cons (car L) (SET-UNION K (cdr L)) ))
	 K))