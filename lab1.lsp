#||
    3) Определите функцию, заменяющую в 
    исходном списке все вхождения заданного значения другим.
||#

(defun change (val valToChange list)
   (mapcar (lambda (arg)
    (cond ((eq valToChange arg) val) 
        (t arg))) list))

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

(defun removeEvenPos (list)
  (cond ((null list) nil)
        (t (cons (car list) (removeEvenPos(cddr list))))))

(print(removeEvenPos '(1 2 2 4 4 7 6 9 8)))
;;    (1 2 4 6 8)

(print(removeEvenPos '(4 2 2 8 4 8)))
;;     4 2 4

(print(removeEvenPos '(1 2)))
;;     (1) 

;; __________________________________________________________________________

(terpri)

#||
    1) Запишите последовательности вызовов CAR и CDR, выделяющие из 
    приведенных ниже списков символ цель. Упростите эти вызовы с помощью комбинации селекторов:
    • (1 2 цель 3 4)
    • ((1) (2 цель) (3 (4))) 
    • ((1 (2 (3 4 цель))))
||#

(print(car (cdr (cdr '(1 2 цель 3 4) ))))
(print(caddr '(1 2 цель 3 4) ))

(print(car (cdr (car (cdr '((1) (2 цель) (3 (4))) )))))
(print(car (cdadar '(((1) (2 цель) (3 (4))) ))))

(print(car (cdr (cdr (car (cdr (car (cdr (car '((1 (2 (3 4 цель)))) )))))))))
(print(caddar (cdadar '((1 (2 (3 4 цель)))) )))
 ;; __________________________________________________________________________

(terpri)

#||
    10) Определите функцию, осуществляющую удаление указанного 
        количества последних элементов исходного списка.
||#

(defun removeLastElements(num list)
	(cond ((<= (list-length list) num) nil)
		(T (cons (car list) (removeLastElements num (cdr list))))))

(print(removeLastElements 3 '(1 2 3 0 4 5)))
;;      1 2 3

(print(removeLastElements 3 '()))
;;      NIL

(print(removeLastElements 1 '(1 2 3 0 4 5)))
;;      1 2 3 0 4

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
;;    (1 1 1 1 1 1 1 0) 

(print(incrementList '(10 -6 1 2 3 4 0)))
;;    (11 -5 2 3 4 5 1) 

;; __________________________________________________________________________

(terpri)