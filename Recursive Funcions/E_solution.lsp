
(defun ISORT (L) (cond
		((equal L nil) '())
		(t (INSERT (car L) (ISORT (cdr L))))))