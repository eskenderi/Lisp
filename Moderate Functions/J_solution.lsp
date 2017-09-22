(defun COUNT-REPETITIONS (L) (
		if L
			(let ((X (COUNT-REPETITIONS (cdr L))))
				(if (and (listp (car X)) (equal (car L) (cadr (car X))))
					(cons (list (+ (caar X) 1) (car L)) (cdr X))
					(cons (list 1 (car L)) X) ))
		'()))