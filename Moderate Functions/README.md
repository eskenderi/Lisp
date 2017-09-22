**A.** - Define a function to search for a specific item in a list and return its first appearance position.
```lisp
(defun INDEX (N L) (
		if L
		(if (> N 1) (INDEX (- N 1) (cdr L)) 
					(car L))
		'ERROR))
```
**B.** - Define a function to return the position of the minimum value of a list containing numbers only
``` lisp
(defun MIN-FIRST (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST (cdr L))))
			(if (<= (car L) (car X))
				L
				 (cons (car X) (cons (car L) (cdr X))) ))
		L))
```
**C** - Define an Insertion sorting function 
```lisp
(defun SSORT (L) (
		if (> (length L) 1)
		(let ((X (MIN-FIRST L)))
			(cons (car X) (SSORT (cdr X))))
		L))
```
**D** - Defining a Quick Sort function
```lisp
(defun PARTITION (L N)
  (if L
       (let ((lst (PARTITION (cdr L) N)))
         (if (< (first L) N) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
 (defun QSORT (L) (
		if (> (length L) 1)
		(let ((X (PARTITION L (car L))))
				(if (car X)
					(append (QSORT (car X)) (QSORT (cadr X)))
					(cons (first (second X)) (QSORT (rest (second X)))) ))
		 L))
```
**E** - Defining a function to merge two lists together in a sorted manner.
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
**F** - Defining a Merge Sort algorithm function
```lisp

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
**G** - Defining a function to remove any adjacent duplicate out of a list
```lisp
 (defun REMOVE-ADJ-DUPL (L) (
		if (> (length L) 1)
			(if (equal (car L) (cadr L)) 
				(REMOVE-ADJ-DUPL (cdr L))
				(cons (car L) (REMOVE-ADJ-DUPL (cdr L))))
			L))
```
**H** - Defining a function to omit non-repeated elements out of a list
```lisp
 (defun UNREPEATED-ELTS (L) (
		if(> (length L) 1) 
			(if (equal (car L) (cadr L))
					(if (equal (cadr L) (caddr L)) 
						(UNREPEATED-ELTS (cdr L)) 
						(UNREPEATED-ELTS (cddr L)))
					(cons (car L) (UNREPEATED-ELTS (cdr L))))
		L))
```
**I** - Defining a function to remove the repeated elements out of a list
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
**J** - Defining a function to return the number of repetitions on a list
```lisp
 (defun COUNT-REPETITIONS (L) (
		if L
			(let ((X (COUNT-REPETITIONS (cdr L))))
				(if (and (listp (car X)) (equal (car L) (cadr (car X))))
					(cons (list (+ (caar X) 1) (car L)) (cdr X))
					(cons (list 1 (car L)) X) ))
		'()))
```
**K** - Defining a function to return the subset list F of the list L
```lisp
 (defun SUBSET (F L) (
		if L
			(if (apply F (list (car L)))
				(cons (car L) (SUBSET F (cdr L))) 
				(SUBSET F (cdr L)))
			'()))
``` 
**L** - 
```lisp
(defun OUR-SOME (F L) (
		if L
			(if (apply F (list (car L)))
				L
				(OUR-SOME F (cdr L)))
		'()))
(defun OUR-EVERY (F L) (
		if (> (length L) 1)
			(and (apply F (list (car L))) (OUR-EVERY F (cdr L)))
		(apply F (list (car L)))))
```
**M** - Defining a function to perform quicksort over a list by making use of the apply call
```lisp

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
**O** - Defining recursive basic batch operation
```lisp
;Addition
 (defun TR-ADD (L N) (
		if(endp L)
		N
		(TR-ADD (cdr L) (+ N (car L)))
		))
;Multiplication
(defun TR-MUL (L N) (
		if(endp L)
		N
		(TR-MUL (cdr L) (* (car L) N))))
;Factorization
(defun TR-FAC (M N)(
		if (= M 1)
		N
		(TR-FAC (- M 1) (* M N))))
```
**P** - Defining function to return the next prime number larger than a specific number N
```lisp
 (defun SLOW-PRIMEP (N) (= (- N 1) (mod (TR-FAC (- N 1) 1) N)))
(defun LargerPrimeThan (N) (
		if (SLOW-PRIMEP N)
		N
		(LargerPrimeThan (+ N 1))))
;(LARGERPRIMETHAN 20000)
;=>20011

```
**Q** - Defining a slow transpose function
```lisp
 (defun TRANSPOSE1 (M) (
		if (null (car M))
		nil
		(cons (mapcar #'car M) (TRANSPOSE1 (mapcar #'cdr M)))
		))

```
**R** - Defining a faster transpose function 
```lisp
 (defun TRANSPOSE2 (M) (
		if (endp (cdar M))
			(cons (mapcar #'car M) '())
			(cons (mapcar #'car M) (TRANSPOSE2 (mapcar #'cdr M)))
		))

```
**S** - Defining the fastest transpose function
```lisp

(defun TRANSPOSE3 (M)
    (apply #'mapcar #'list M)
)
```

