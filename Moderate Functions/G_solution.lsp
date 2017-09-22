(defun REMOVE-ADJ-DUPL (L) (
		if (> (length L) 1)
			(if (equal (car L) (cadr L)) 
				(REMOVE-ADJ-DUPL (cdr L))
				(cons (car L) (REMOVE-ADJ-DUPL (cdr L))))
			L))