(print "----------НОВЫЕ----------") 
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
    21) Определите функцию, удаляющую из списка первое вхождение данного элемента на верхнем уровне.
||#

(print "Лабораторная 21")

(defun removeFirst (num list)
    ((lambda (elemement) (and (setq first (car elemement)) (setq last (cdr elemement)))) list)
        (cond ((null first) list)
              ((eq first num) last)
              (t (cons first (removeFirst (cdr list) elemement)))))


(print (removeFirst 3 '(3 2 3 4 3 10)))
;;  (2 3 4 3 10) 

(print (removeFirst 1 '(1 1 1)))
;;  (1 1) 

(print (removeFirst 1 '(1)))
;;  NIL

(print "__________________________________________________________________________")

(terpri)

#||
    28) Определите функцию, вычисляющую, сколько всего атомов в списке (списоч-
        ной структуре).
||#

(defun atomCount(list)
	(length (mapcar (lambda (a) 
        (cond (t (atom a) (list t) nil))) list))
)

(print (atomCount '(1 2 (3 333) 331 1)))
;;  6
(print (atomCount '(1)))
;;  1
(print (atomCount '()))
;; 0



(print "__________________________________________________________________________")

(terpri)

(print "----------ИСПРАВЛЕНИЯ----------")
(terpri)


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

