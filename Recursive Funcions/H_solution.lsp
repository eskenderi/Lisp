
(defun POS (N L)
	(if L (if (equal N (car L)) 1 (+ 1 (POS N (cdr L))))
			0))