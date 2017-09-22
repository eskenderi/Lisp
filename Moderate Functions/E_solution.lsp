 (defun MERGE-LISTS (L1 L2) (
		cond ((and (endp L1) (endp L2)) '())
			((endp L1) L2)
			((endp L2) L1)
			(t (if (< (car L1) (car L2))
					(cons (car L1) (MERGE-LISTS (cdr L1) L2))
					(cons (car L2) (MERGE-LISTS L1 (cdr L2)))))
		))