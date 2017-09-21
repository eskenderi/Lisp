
(defun INC-LIST-2 (L N) (cond
						((equal L nil) '())
						(t (cons (+ N (car L)) (INC-LIST-2 (cdr L) N)))))