#||
    3) Определите функцию, заменяющую в 
    исходном списке все вхождения заданного значения другим.
||#

(defun change (val valToChange list)
   (cond ((null list) nil)
         ((equal (car list) valToChange) (cons val (change val valToChange (cdr list))))
         ((cons (car list) (change val valToChange (cdr list))))))
         
(print(change 1 2 '(1 2 22 33 1 22 4)))    
;;    (1 1 22 33 1 22 4)

(print(change 4 1 '(1 1 1 33 1 1 8)))    
;;    (4 4 4 33 4 4 8) 

(print(change 0 10 '(10 10 100 33 1 1 8)))    
;;    (0 0 100 33 1 1 8) 

;; __________________________________________________________________________

(terpri)

#||
    7) Определите функцию, удаляющую из исходного списка элементы с четными номерами.
||#

(defun removeEvenFromList (list)
    (cond ((null list) nil)
        ((evenp (car list)) (removeEvenFromList (cdr list)))
        (t (cons (car list) (removeEvenFromList (cdr list))))
))

(print(removeEvenFromList '(1 2 2 4 4 7 6 9 8)))
;;    (1 7 9)

(print(removeEvenFromList '(4 2 2 8 4 8)))
;;     NIL

(print(removeEvenFromList '(1 2 34 88 33 100 0 8)))
;;     (1 33) 

;; __________________________________________________________________________

(terpri)

#||
    5) Определите функцию, которая увеличивает элементы исходного 
       списка на единицу.
||#

(defun incrementList (list)
    (cond ((null list) nil)
        ((cons (+ (car list) 1) (incrementList(cdr list))))
))

(print(incrementList '(1 2 3 4 0)))
;;    (2 3 4 5 1)

(print(incrementList '(0 0 0 0 0 0 0 -1)))
;;     (1 1 1 1 1 1 1 0) 

(print(incrementList '(10 -6 1 2 3 4 0)))
;;     (11 -5 2 3 4 5 1) 

;; __________________________________________________________________________

(terpri)