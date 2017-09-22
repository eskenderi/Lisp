(defun TR-FAC (M N)(
		if (= M 1)
		N
		(TR-FAC (- M 1) (* M N))))
(defun SLOW-PRIMEP (N) (= (- N 1) (mod (TR-FAC (- N 1) 1) N)))
(defun LargerPrimeThan (N) (
		if (SLOW-PRIMEP N)
		N
		(LargerPrimeThan (+ N 1))))