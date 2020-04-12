#||
    3) Определите функцию, заменяющую в 
    исходном списке все вхождения заданного значения другим.
||#

(print "Лабораторная 3")

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

(print "__________________________________________________________________________")

(terpri)

#||
    7) Определите функцию, удаляющую из исходного списка элементы с четными номерами.
||#

(print "Лабораторная 7")

(defun removeEvenPos (list)
  (cond ((null list) nil)
        (t (cons (car list) (removeEvenPos(cddr list))))))

(print(removeEvenPos '(1 2 2 4 4 7 6 9 8)))
;;    (1 2 4 6 8)

(print(removeEvenPos '(4 2 2 8 4 8)))
;;     4 2 4

(print(removeEvenPos '(1 2)))
;;     (1) 

(print "__________________________________________________________________________")

(terpri)

#||
    1) Запишите последовательности вызовов CAR и CDR, выделяющие из 
    приведенных ниже списков символ цель. Упростите эти вызовы с помощью комбинации селекторов:
    • (1 2 цель 3 4)
    • ((1) (2 цель) (3 (4))) 
    • ((1 (2 (3 4 цель))))
||#

(print "Лабораторная 1")

(print(car (cdr (cdr '(1 2 цель 3 4) ))))
(print(caddr '(1 2 цель 3 4) ))

(print(car (cdr (car (cdr '((1) (2 цель) (3 (4))) )))))
(print(car (cdadar '(((1) (2 цель) (3 (4))) ))))

(print(car (cdr (cdr (car (cdr (car (cdr (car '((1 (2 (3 4 цель)))) )))))))))
(print(caddar (cdadar '((1 (2 (3 4 цель)))) )))

(print "__________________________________________________________________________")

(terpri)

#||
    10) Определите функцию, осуществляющую удаление указанного 
        количества последних элементов исходного списка.
||#

(print "Лабораторная 10")

(defun removeLastElements(num list)
	(cond ((<= (list-length list) num) nil)
		(T (cons (car list) (removeLastElements num (cdr list))))))

(print(removeLastElements 3 '(1 2 3 0 4 5)))
;;      1 2 3

(print(removeLastElements 3 '()))
;;      NIL

(print(removeLastElements 1 '(1 2 3 0 4 5)))
;;      1 2 3 0 4

(print "__________________________________________________________________________")

(terpri)

#||
    11) Определите функцию, осуществляющую разделение исходного списка на два подсписка. 
        В первый из них должно попасть указанное количество элементов с начала списка,
        во второй — оставшиеся элементы.
||#

(print "Лабораторная 11")

(defun separateList(list n)
  (if list
      (if (zerop n)
          (cons nil (cons list nil))
          ((lambda (elemement result) (cons (cons elemement (car result)) (cdr result)))
  (car list) (separateList (cdr list) (1- n))))))


(print (separateList '(1 2 3 4 5 8) 2))
;; ((1 2) (3 4 5 8))

(print (separateList '() 2))
;; NIL

(print (separateList '(1 2 3 4) 0))
;; (NIL (1 2 3 4)) 

(print "__________________________________________________________________________")

(terpri)

#||
    14) Определите функцию, осуществляющую перестановку двух элементов списка с заданными номерами.
||#

(print "Лабораторная 14")

(defun swapTwoElements(list pos1 pos2)
 (cond ((> pos1 0)
   (cons (car list) (swapTwoElements(cdr list) (1- pos1) (1- pos2))))
    ((> pos2 1)
    ((lambda (result) (cons (car result) (cons (cadr list) (cdr result))))
        (swapTwoElements(cons (car list) (cddr list)) (1- pos1) (1- pos2))))
    (T (cons (cadr list) (cons (car list) (cddr list))))))

(print(swapTwoElements '(1 2 3 4 5) 0 1))
;; (2 1 3 4 5) 

(print(swapTwoElements '(1 2 3 4 0 8) 1 5))
;; (1 8 3 4 0 2)

(print(swapTwoElements '(1 2 3 4 0 8 9 2 22) 3 7))
;; (11 -5 2 3 4 5 1) 

(print "__________________________________________________________________________")

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