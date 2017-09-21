; Solution to Problem 1
(defun SUM (L) (cond ((equal L nil) 0) (t (+ (car L) (SUM (cdr L))))))
; Solution to Problem 2
(defun NEG-NUMS (L) (cond 
						((equal L nil) '()) 
						((>= (car L) 0) (NEG-NUMS (cdr L)))
						(t (cons (car L) (NEG-NUMS (cdr L)))) ))
; Solution to Problem 3
(defun INC-LIST-2 (L N) (cond
						((equal L nil) '())
						(t (cons (+ N (car L)) (INC-LIST-2 (cdr L) N)))))
; Solution to Problem 4
(defun INSERT (N L) (cond 
					((equal L nil) (cons N '()))
					((< N (car L)) (cons N L))
					(t (cons (car L) (INSERT N (cdr L))))))
; Solution to Problem 5
(defun ISORT (L) (cond
		((equal L nil) '())
		(t (INSERT (car L) (ISORT (cdr L))))))
; Solution to Problem 6
(defun split-list (lst)
  (if lst
      (if (cddr lst)
          (let ((l (split-list (cddr lst))))
            (list
             (cons (car lst) (car l))
             (cons (cadr lst) (cadr l))))
        `((,(car lst)) ,(cdr lst)))
    '(nil nil)))
; Solution to Problem 7
(defun PARTITION (L N)
  (if L
       (let ((lst (PARTITION (cdr L) N)))
         (if (< (first L) N) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
; Solution to Problem 8
(defun POS (N L)
	(if L (if (equal N (car L)) 1 (+ 1 (POS N (cdr L))))
			0))
; Solution to Problem 9
(defun SPLIT-NUMS (N) 
	(if (> N 0) (let ((lst (SPLIT-NUMS (- N 1))))
				(if (evenp N) 
					(list (cons N (first lst)) (second lst))
					(list (first lst) (cons N (second lst)))))		
	'((0) ()) ))
; Solution to Problem 10
(defun SET-UNION (K L) 
	(if L 
		(if (member (car L) K) 
			(SET-UNION K (cdr L))
			(cons (car L) (SET-UNION K (cdr L)) ))
	 K))
; Solution to Problem 11
(defun SET-REMOVE (N L) 
	(if L 
		(if (equal N (car L)) 
			(SET-REMOVE N (cdr L))
			(cons (car L) (SET-REMOVE N (cdr L)))) 
		'()))
; Solution to Problem 12
(defun SET-EXCL-UNION (K L)
	(if L 
		(if (member (car L) K) 
			(SET-EXCL-UNION (SET-REMOVE (car L) K) (cdr L)) 
			(SET-EXCL-UNION (cons (car L) K) (cdr L))) 
		K))
; Solution to Problem 13
(defun SINGLETONS (L) 
	(if (< 1 (length L)) 
		(if (member (car L) (cdr L)) 
			(SINGLETONS (SET-REMOVE (car L) (cdr L))) 
			(cons (car L) (SINGLETONS (cdr L))))
		L))