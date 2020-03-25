#||
    5) Определите функцию, которая увеличивает элементы исходного 
       списка на единицу.
||#

(defun incrementList (list)
    (cond ((null list) nil)
        ((cons (+ (car list) 1) (incrementList(cdr list))))
))

;;; > (incrementList '(1 2 3 4 0))
;;    (2 3 4 5 1)