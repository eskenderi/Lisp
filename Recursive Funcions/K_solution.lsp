
(defun SET-REMOVE (N L) 
	(if L 
		(if (equal N (car L)) 
			(SET-REMOVE N (cdr L))
			(cons (car L) (SET-REMOVE N (cdr L)))) 
		'()))
