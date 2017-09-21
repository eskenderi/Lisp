
(defun SUM (L) (cond ((equal L nil) 0) (t (+ (car L) (SUM (cdr L))))))