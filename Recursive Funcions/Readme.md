A.	If L is any list of numbers then (SUM L) returns the sum of the elements of L. 
```lisp
(defun SUM (L) (cond ((equal L nil) 0) (t (+ (car L) (SUM (cdr L))))))
```
B.	If L is any list of real numbers then (NEG-NUMS  L) returns a new list that consists of the negative elements of L.
Example:    (NEG-NUMS '(–1 0 –8  2  0 8 –1 –8  2  8  4 –3 0) ) => (–1 –8 –1 –8 –3). 
```lisp
(defun NEG-NUMS (L) (cond 
						((equal L nil) '()) 
						((>= (car L) 0) (NEG-NUMS (cdr L)))
						(t (cons (car L) (NEG-NUMS (cdr L)))) ))
```
C.	C. If L is any list of numbers and N is a number then (INC-LIST-2 L N) returns a list of the same length as L in which each element is equal to (N + the corresponding element of L).
Examples:   (INC-LIST-2  ( )  5) => NIL	 (INC-LIST-2  '(3  2.1  1  7.9)  5) => (8  7.1  6  12.9) 
```lisp
(defun INC-LIST-2 (L N) (cond
						((equal L nil) '())
						(t (cons (+ N (car L)) (INC-LIST-2 (cdr L) N)))))
```
D.	If N is any real number and L is any list of real numbers in ascending order then (INSERT N L) returns a list of numbers in ascending order obtained by inserting N in an appropriate position in L.   
Examples: (INSERT 8 ( )) => (8)      (INSERT 4 '(0 0 1 2 4)) => (0 0 1 2 4 4)       (INSERT 4 '(0 0 1 3 3 7 8 8)) => (0 0 1 3 3 4 7 8 8) 
```lisp
(defun INSERT (N L) (cond 
					((equal L nil) (cons N '()))
					((< N (car L)) (cons N L))
					(t (cons (car L) (INSERT N (cdr L))))))
```
E.	If L is any list of real numbers then (ISORT L) is a list consisting of the elements of L in ascending order.
```lisp
(defun ISORT (L) (cond
		((equal L nil) '())
		(t (INSERT (car L) (ISORT (cdr L))))))
```
F.	If L is any list then (SPLIT-LIST L) returns a list of two lists, in which the first list consists of the 1st, 3rd, 5th, ... elements of L, and the second list consists of the 2nd, 4th, 6th, ... elements of L.  Examples: (SPLIT-LIST ()) => (NIL NIL)		(SPLIT-LIST '(A)) => ((A) NIL)
(SPLIT-LIST '(A B C D 1 2 3 4 5)) => ((A C 1 3 5) (B D 2 4)) 
(SPLIT-LIST '(B C D 1 2 3 4 5)) => ((B D 2 4) (C 1 3 5))  
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
```
G.	If L is a list of real numbers and P is a real number then (PARTITION L P) returns a list whose CAR is a list of the elements of L that are strictly less than P, and whose CADR is a list of the other elements of L. Each element of L must appear in the CAR or CADR of (PARTITION L P), and should appear there just as many times as in L. 
Examples: (PARTITION '(7 5 3 2 1 5) 1) => (NIL (7 5 3 2 1 5))
 (PARTITION () 9) => (NIL NIL) (PARTITION '(4 0 5 3 1 2 4 1 4) 4) => ((0 3 1 2 1) (4 5 4 4 ))
```lisp
(defun PARTITION (L N)
  (if L
       (let ((lst (PARTITION (cdr L) N)))
         (if (< (first L) N) 
         	(list (cons (first L) (first lst)) (second lst))
         	(list (first lst) (cons (first L) (second lst)))))
  '(nil nil)))
```
H.	Without using MEMBER, complete the following definition of a recursive function POS                   such that if L is a list and E is an element of L then (POS E L) returns the position of the first            occurrence of E in L, and such that if E is not an element of L then (POS E L) returns 0.   
Examples:  (POS 5 '(1 2 5 3 5 5 1 5)) => 3    (POS 'A '(3 2 1)) => 0    (POS '(3 B) '(3 B)) => 0 
(POS '(A B)  '((K)  (3 R C)  A  (A B)  (K L L)  (A B)))  => 4       (POS '(3 B) '((3 B))) => 1 
```lisp
(defun POS (N L)
	(if L (if (equal N (car L)) 1 (+ 1 (POS N (cdr L))))
			0))
```
I.	Define a recursive function SPLIT-NUMS such that if N is a non-negative integer then  
(SPLIT-NUMS N)  returns a list of two lists: The first of the two lists consists of the even                     integers between 0 and N in descending order, and the other list consists of the odd integers                  between 0 and N in descending order. 
Examples:   (SPLIT-NUMS 0) => ((0) NIL)     (SPLIT-NUMS 7) => ((6 4 2 0) (7 5 3 1))     (SPLIT-NUMS 8) => ((8 6 4 2 0) (7 5 3 1)) 
```lisp
(defun SPLIT-NUMS (N) 
	(if (> N 0) (let ((lst (SPLIT-NUMS (- N 1))))
				(if (evenp N) 
					(list (cons N (first lst)) (second lst))
					(list (first lst) (cons N (second lst)))))		
	'((0) ()) ))
```
J.	Define a recursive function SET-UNION such that if s1 and s2 are sets then (SET-UNION s1 s2)        is a set that contains the elements of s1 and the elements of s2, but no other elements.  Thus  (SET-UNION '(A B C D) '(C E F)) should return a list consisting of the atoms A, B, C, D, E, and F (in any order) in which no atom occurs more than once. 
```lisp
(defun SET-UNION (K L) 
	(if L 
		(if (member (car L) K) 
			(SET-UNION K (cdr L))
			(cons (car L) (SET-UNION K (cdr L)) ))
	 K))
```
K.	Define a recursive function SET-REMOVE such that if s is a set and x is an atom in s then 
(SET-REMOVE x s) is a set that consists of all the elements of s except x, but if s is a set and        x is an atom which is not in s then (SET-REMOVE x s) returns a set that is equal to s.   
```lisp
(defun SET-REMOVE (N L) 
	(if L 
		(if (equal N (car L)) 
			(SET-REMOVE N (cdr L))
			(cons (car L) (SET-REMOVE N (cdr L)))) 
		'()))
```
L.	Define a recursive function SET-EXCL-UNION such that if s1 and s2 are sets then  
(SET-EXCL-UNION s1 s2) is a set that contains all those atoms that are elements of exactly one        of s1 and s2, but no other atoms. (SET-EXCL-UNION s1 s2) does not contain any atoms that are         neither in s1 nor in s2, and also does not contain the atoms that are in both of s1 and s2.  
Example: (SET-EXCL-UNION '(A B C D) '(E C F G A)) should return a list consisting of the        atoms B, D, E, F, and G (in any order) in which no atom occurs more than once.   
```lisp
(defun SET-EXCL-UNION (K L)
	(if L 
		(if (member (car L) K) 
			(SET-EXCL-UNION (SET-REMOVE (car L) K) (cdr L)) 
			(SET-EXCL-UNION (cons (car L) K) (cdr L))) 
		K))
```
M.	Define a recursive function SINGLETONS such that if e is a list of numbers and/or symbols        then (SINGLETONS e) is a set that consists of all the atoms that occur just once in e.         Examples:   (SINGLETONS ( )) => NIL   (SINGLETONS '(G A B C B)) => (G A C)          
(SINGLETONS '(H G A B C B)) => (H G A C)     (SINGLETONS '(A G A B C B)) => (G C)                (SINGLETONS '(B G A B C B)) => (G A C)
```lisp
(defun SINGLETONS (L) 
	(if (< 1 (length L)) 
		(if (member (car L) (cdr L)) 
			(SINGLETONS (SET-REMOVE (car L) (cdr L))) 
			(cons (car L) (SINGLETONS (cdr L))))
		L))
```
