(defun SSORT (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST L)))
			(cons (car X) (SSORT (cdr X))))
		L))