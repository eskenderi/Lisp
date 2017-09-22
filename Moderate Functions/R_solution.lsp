(defun TRANSPOSE2 (M) (
		if (endp (cdar M))
			(cons (mapcar #'car M) '())
			(cons (mapcar #'car M) (TRANSPOSE2 (mapcar #'cdr M)))
		))
