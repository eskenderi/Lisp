(defun INDEX (N L) (
		if L
		(if (> N 1) (INDEX (- N 1) (cdr L)) 
					(car L))
		'ERROR))