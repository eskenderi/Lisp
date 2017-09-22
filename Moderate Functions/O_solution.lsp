 (defun TR-ADD (L N) (
		if(endp L)
		N
		(TR-ADD (cdr L) (+ N (car L)))
		))
(defun TR-MUL (L N) (
		if(endp L)
		N
		(TR-MUL (cdr L) (* (car L) N))))
(defun TR-FAC (M N)(
		if (= M 1)
		N
		(TR-FAC (- M 1) (* M N))))