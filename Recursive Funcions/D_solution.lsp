
(defun INSERT (N L) (cond 
					((equal L nil) (cons N '()))
					((< N (car L)) (cons N L))
					(t (cons (car L) (INSERT N (cdr L))))))