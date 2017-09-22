(defun PARTITION (L N)
  (if L
       (let ((lst (PARTITION (cdr L) N)))
         (if (< (first L) N) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
 (defun QSORT (L) (
		if (> (length L) 1)
		(let ((X (PARTITION L (car L))))
				(if (car X)
					(append (QSORT (car X)) (QSORT (cadr X)))
					(cons (first (second X)) (QSORT (rest (second X)))) ))
		 L))