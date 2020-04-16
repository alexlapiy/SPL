(print "----------ВЫПОЛНЕНЫ ПОЛНОСТЬЮ----------")
(terpri)

#||
    5) Определите функцию, которая увеличивает элементы исходного 
       списка на единицу.
||#


(print "Лабораторная 5")

(defun incrementList (list)
    (cond ((null list) nil)
        ((cons (+ (car list) 1) (incrementList(cdr list))))
))

(print(incrementList '(1 2 3 4 0)))
;;    (2 3 4 5 1)

(print(incrementList '(0 0 0 0 0 0 0 -1)))
;;    (1 1 1 1 1 1 1 0) 

(print(incrementList '(10 -6 1 2 3 4 0)))
;;    (11 -5 2 3 4 5 1) 

(print "__________________________________________________________________________")

(terpri)