;1
(defun MIN-2 (a b) (if (and (numberp a) (numberp b)) (if (< a b) (car (cons a nil)) (car (cons b nil))) (car '(ERROR))))
;2
(defun SAFE-AVG (a b) (if (and (numberp a) (numberp b)) (/ (+ a b) 2) nil))
;3
(defun ODD-GT-MILLION (a) (if (and (integerp a) (> a 1000000)) t nil))
;4
(defun MULTIPLE-MEMBER (a l) (if (member a (cdr (member a l))) t nil))
;5
(defun MONTH->INTEGER (a) (case a ('january 1)		('february 2)		('march 3)
								('april 4)		('may 5)		('june 6)
								('july 7)		('august 8)		('september 9)
								('october 10)		('november 11)		('december 12)
								(otherwise 'ERROR)
))

;6
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
;7
(defun GT (a b) (and (numberp a) (numberp b) (> a b)))
;8
(defun SAME-SIGN (a b) (and (numberp a) 
							(numberp b) 
							(or 
								(and (= a 0) (= b 0)) 
								(and (> b 0) (> a 0)) 
								(and (< a 0) (< a 0)))))
;9
(defun SAFE-DIV (a b) (and (numberp a) (numberp b) (/= b 0) (/ a b)))