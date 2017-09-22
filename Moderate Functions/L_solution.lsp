(defun OUR-SOME (F L) (
		if L
			(if (apply F (list (car L)))
				L
				(OUR-SOME F (cdr L)))
		'()))
(defun OUR-EVERY (F L) (
		if (> (length L) 1)
			(and (apply F (list (car L))) (OUR-EVERY F (cdr L)))
		(apply F (list (car L)))))