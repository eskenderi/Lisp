**A.**
```lisp
(defun INDEX (N L) (
		if L
		(if (> N 1) (INDEX (- N 1) (cdr L)) 
					(car L))
		'ERROR))
```
**B.**
``` lisp
(defun MIN-FIRST (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST (cdr L))))
			(if (<= (car L) (car X))
				L
				 (cons (car X) (cons (car L) (cdr X))) ))
		L))
```
**C**
```lisp
(defun SSORT (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST L)))
			(cons (car X) (SSORT (cdr X))))
		L))
```
**D**
```lisp
;partition from assignment 4
(defun PARTITION (L N)
  (if L
       (let ((lst (PARTITION (cdr L) N)))
         (if (< (first L) N) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
```
**E**
```lisp
 (defun QSORT (L) (
		if (> (length L) 1)
		(let ((X (PARTITION L (car L))))
				(if (car X)
					(append (QSORT (car X)) (QSORT (cadr X)))
					(cons (first (second X)) (QSORT (rest (second X)))) ))
		 L))
```
**F**
```lisp
 (defun MERGE-LISTS (L1 L2) (
		cond ((and (endp L1) (endp L2)) '())
			((endp L1) L2)
			((endp L2) L1)
			(t (if (< (car L1) (car L2))
					(cons (car L1) (MERGE-LISTS (cdr L1) L2))
					(cons (car L2) (MERGE-LISTS L1 (cdr L2)))))
		))
```
**G**
```lisp
;split-list from assignment 4
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
```
**H**
```lisp
 (defun REMOVE-ADJ-DUPL (L) (
		if (> (length L) 1)
			(if (equal (car L) (cadr L)) 
				(REMOVE-ADJ-DUPL (cdr L))
				(cons (car L) (REMOVE-ADJ-DUPL (cdr L))))
			L))
```
**I**
```lisp
 (defun UNREPEATED-ELTS (L) (
		if(> (length L) 1) 
			(if	(equal (car L) (cadr L))
					(if (equal (cadr L) (caddr L)) 
						(UNREPEATED-ELTS (cdr L)) 
						(UNREPEATED-ELTS (cddr L)))
					(cons (car L) (UNREPEATED-ELTS (cdr L))))
		L))
```
**J**
```lisp
 (defun REPEATED-ELTS (L) (
		if(> (length L) 1) 
			(if	(equal (car L) (cadr L))
					(if (equal (cadr L) (caddr L)) 
						(REPEATED-ELTS (cdr L))
						(cons (car L) (REPEATED-ELTS (cddr L))))
					(REPEATED-ELTS (cdr L)))
		'()))
```
**K**
```lisp
 (defun COUNT-REPETITIONS (L) (
		if L
			(let ((X (COUNT-REPETITIONS (cdr L))))
				(if (and (listp (car X)) (equal (car L) (cadr (car X))))
					(cons (list (+ (caar X) 1) (car L)) (cdr X))
					(cons (list 1 (car L)) X) ))
		'()))
```
**L**
```lisp
 (defun SUBSET (F L) (
		if L
			(if (apply F (list (car L)))
				(cons (car L) (SUBSET F (cdr L))) 
				(SUBSET F (cdr L)))
			'()))
```
**M**
```lisp
;i
(defun OUR-SOME (F L) (
		if L
			(if (apply F (list (car L)))
				L
				(OUR-SOME F (cdr L)))
		'()))
;ii
(defun OUR-EVERY (F L) (
		if (> (length L) 1)
			(and (apply F (list (car L))) (OUR-EVERY F (cdr L)))
		(apply F (list (car L)))))
```
**N**
```lisp
;Modified partition2 from assignment 4
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
```
**O**
```lisp
 (defun FOO (F L) (
		
		))
```
**P**
```lisp
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
```
**Q**
```lisp
 (defun SLOW-PRIMEP (N) (= (- N 1) (mod (TR-FAC (- N 1) 1) N)))
(defun LargerPrimeThan (N) (
		if (SLOW-PRIMEP N)
		N
		(LargerPrimeThan (+ N 1))))
;(LARGERPRIMETHAN 20000)
;=>20011

```
**R**
```lisp
 (defun TRANSPOSE1 (M) (
		if (null (car M))
		nil
		(cons (mapcar #'car M) (TRANSPOSE1 (mapcar #'cdr M)))
		))

```
**S**
```lisp
 (defun TRANSPOSE2 (M) (
		if (endp (cdar M))
			(cons (mapcar #'car M) '())
			(cons (mapcar #'car M) (TRANSPOSE2 (mapcar #'cdr M)))
		))
;
```
**T**
```lisp

(defun TRANSPOSE3 (M)
    (apply #'mapcar #'list M)
)
```

