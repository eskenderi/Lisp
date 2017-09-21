(defun SAME-SIGN (a b) (and (numberp a) 
							(numberp b) 
							(or 
								(and (= a 0) (= b 0)) 
								(and (> b 0) (> a 0)) 
								(and (< a 0) (< a 0)))))