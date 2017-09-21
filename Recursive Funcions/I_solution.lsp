
(defun SPLIT-NUMS (N) 
	(if (> N 0) (let ((lst (SPLIT-NUMS (- N 1))))
				(if (evenp N) 
					(list (cons N (first lst)) (second lst))
					(list (first lst) (cons N (second lst)))))		
	'((0) ()) ))