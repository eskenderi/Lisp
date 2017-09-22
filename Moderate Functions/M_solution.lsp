(defun PARTITION2 (F L N)
  (if L
       (let ((lst (PARTITION2 F (cdr L) N)))
         (if (apply F (list (car L) N)) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
(defun QSORT1 (F L) (
		if (> (length L) 1)
		(let ((X (PARTITION2 F L (car L))))
				(if (car X)
					(append (QSORT1 F (car X)) (QSORT1 F (cadr X)))
					(cons (first (second X)) (QSORT1 F (rest (second X)))) ))
		 L))