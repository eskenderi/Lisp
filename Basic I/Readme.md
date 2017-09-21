A.	Define a LISP function MIN-2 with the following properties.   MIN-2 takes two arguments.  If          those arguments have values A and B, and A and B are numbers, then MIN-2 returns A if A ≤ B      and returns B if A > B; but if A or B is not a number MIN-2 returns the symbol ERROR. 
Examples: (MIN-2 21.3 7/2)    => 7/2   (MIN-2 17.5 29)    => 17.5     (MIN-2 5 'APPLE) => ERROR       				(MIN-2 '(31) '(54)) => ERROR 
```lisp
(defun MIN-2 (a b) 
(if (and (numberp a) (numberp b)) 
	(if (< a b) (car (cons a nil)) 
		(car (cons b nil))) 
	(car '(ERROR))))
```
B.	Write a LISP function SAFE-AVG that takes 2 arguments and returns the average of those arguments if they are numbers. If one or both arguments is not a number, the function should return NIL. 
Examples: (SAFE-AVG  23  47.4) => 35.2       	(SAFE-AVG  3  8) => 11/2                          (SAFE-AVG '(23.1) 47.3) => NIL   	(SAFE-AVG 'ORANGE 'PLUM) => NIL     
```lisp
(defun SAFE-AVG (a b) 
	(if (and (numberp a) (numberp b)) 
		(/ (+ a b) 2) nil))
```

C.	Write a LISP predicate ODD-GT-MILLION that takes one argument, and which returns T if its argument is an odd integer greater than a million, but returns NIL otherwise. Hint: Make use of the predicate INTEGERP.  Examples:   
(ODD-GT-MILLION 92010231) => T (ODD-GT-MILLION 17) => NIL 
(ODD-GT-MILLION 92010232) => NIL	(ODD-GT-MILLION 21/5) => NIL		
(ODD-GT-MILLION 1718671.24) => NIL	(ODD-GT-MILLION '(2010231)) => NIL       
(ODD-GT-MILLION 'APPLE) => NIL 
```lisp
(defun ODD-GT-MILLION (a) 
	(if (and (integerp a) (> a 1000000))
		t nil))
```

D.	Write a LISP predicate MULTIPLE-MEMBER that takes two arguments and behaves as follows:  If the first argument is a symbol or number and the second is a list, then MULTIPLE-MEMBER returns a true value if the first argument occurs at least twice in the second argument, and returns NIL otherwise.       
Examples: (MULTIPLE-MEMBER 'A '(B A B B A C A D)) => (A C A D) 
i.	(MULTIPLE-MEMBER 'A '(B A B B C C A D)) => (A D)                                                
ii.	(MULTIPLE-MEMBER 'A '(B A B B C D)) => NIL 
[Notice that the behavior of MULTIPLE-MEMBER is unspecified in cases where the first      argument is not a symbol or number, and in cases where the second argument is not a list.  In other words, your definition may return any value or produce an evaluation error in such cases.] 
```lisp
(defun MULTIPLE-MEMBER (a l) 
	(if (member a (cdr (member a l))) 
		t nil))
```

E.	Define a LISP function MONTH->INTEGER which takes as argument a symbol that should     
be the name of a month, and which returns the number of the month.  For example, 
(MONTH->INTEGER 'MARCH) => 3  and  (MONTH->INTEGER 'JUNE) => 6.  If the  
argument is not a symbol that is the name of a month, the function should return the symbol  
ERROR.  E.g.,  (MONTH->INTEGER 'C) => ERROR,  (MONTH->INTEGER 7) => ERROR,      and (MONTH->INTEGER '(MARCH)) => ERROR. 
```lisp
(defun MONTH->INTEGER (a) (case a ('january 1)		('february 2)		('march 3)
				('april 4)		('may 5)		('june 6)
				('july 7)		('august 8)		('september 9)
				('october 10)		('november 11)		('december 12)
				(otherwise 'ERROR)
))
```

F.	Define a LISP function SCORE->GRADE which takes a single argument, s, and returns a symbol according to the following scheme:  
	s ≥ 90		  A                    		73 ≤ s < 77       C+                 			
	87 ≤ s < 90       A–            	 	70 ≤ s < 73       C     
	83 ≤ s < 87       B+                            60 ≤ s < 70       D 
	80 ≤ s < 83       B                     	s < 60            F 
	77 ≤ s < 80       B–                    
If the argument s is not a number then the function should return NIL.  
Examples:  (SCORE->GRADE 86.3) => B+   (SCORE->GRADE 106) => A    (SCORE->GRADE –10.1) => F    (SCORE->GRADE 59.9) => F     
	(SCORE->GRADE 83) => B+    (SCORE->GRADE 74) => C+	(SCORE->GRADE 67) => D        (SCORE->GRADE 87.0) => A–              		(SCORE->GRADE '(86.3)) => NIL    (SCORE->GRADE 'DOG) => NIL        
```lisp
(defun SCORE->GRADE (s) (if (numberp s) (if (>= s 90) (car (cons 'a nil)) 
						(if (>= s 87) (car (cons 'a- nil))
						(if (>= s 83) (car (cons 'b+ nil))
						(if (>= s 80) (car (cons 'b nil))
						(if (>= s 77) (car (cons 'b- nil))
						(if (>= s 73) (car (cons 'c+ nil))
						(if (>= s 70) (car (cons 'c nil))
						(if (>= s 60) (car (cons 'd nil))
						(car (cons 'f nil))
							)))))))) nil))
```

G.	Define a LISP function GT with the following properties.  GT takes two arguments.  It returns T if both arguments are numbers and the first argument is strictly greater than the second. In all other cases GT returns NIL. 
```lisp
(defun GT (a b) 
	(and (numberp a) (numberp b) (> a b)))
```

H.	Define a LISP function SAME-SIGN with the following properties. SAME-SIGN takes two arguments. It returns T if both arguments are equal to zero, if both are negative numbers, or if both are positive numbers.  In all other cases SAME-SIGN returns NIL.   
Examples:  (SAME-SIGN 0 –2) => NIL      (SAME-SIGN –3 –9) => T     (SAME-SIGN 'A 'A) => NIL 
```lisp
(defun SAME-SIGN (a b) (and 
			(numberp a) (numberp b) 
			(or 
			(and (= a 0) (= b 0)) 
			(and (> b 0) (> a 0)) 
			(and (< a 0) (< a 0)))))```

I.	Define a LISP function SAFE-DIV with the following properties.   SAFE-DIV takes two                arguments.  If both arguments are numbers and the second is not equal to zero, then it returns         the result of dividing the first argument by the second.  In all other cases it returns NIL.   
Examples:  (SAFE-DIV  6  4) =>  3/2    (SAFE-DIV  6.0  4) =>  1.5    (SAFE-DIV  6  0) =>  NIL                         (SAFE-DIV  6  0.0) =>  NIL      (SAFE-DIV  '(6)  4) =>  NIL 

```lisp
(defun SAFE-DIV (a b) 
	(and (numberp a) (numberp b) (/= b 0) (/ a b)))
```

