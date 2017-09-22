(defun split-list (lst)
  (if lst
      (if (cddr lst)
          (let ((l (split-list (cddr lst))))
            (list
             (cons (car lst) (car l))
             (cons (cadr lst) (cadr l))))
        `((,(car lst)) ,(cdr lst)))
    '(nil nil)))

(defun MSORT (L) (
		if (> (length L) 1)
		(let ((X (SPLIT-LIST L)))
			(MERGE-LISTS (MSORT (car X)) (MSORT (cadr X))))
		L))