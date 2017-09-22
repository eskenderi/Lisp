(defun TRANSPOSE1 (M) (
		if (null (car M))
		nil
		(cons (mapcar #'car M) (TRANSPOSE1 (mapcar #'cdr M)))
		))