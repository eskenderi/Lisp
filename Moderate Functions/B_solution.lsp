(defun MIN-FIRST (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST (cdr L))))
			(if (<= (car L) (car X))
				L
				 (cons (car X) (cons (car L) (cdr X))) ))
		L))