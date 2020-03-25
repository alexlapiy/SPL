#||
    3) Определите функцию, заменяющую в 
    исходном списке все вхождения заданного значения другим.
||#

(defun change (val valToChange list)
   (cond ((null list) nil)
         ((equal (car list) valToChange) (cons val (change val valToChange (cdr list))))
         ((cons (car list) (change val valToChange (cdr list))))))
         
;;; > (change 1 2 '(1 2 22 33 1 22 4))
;;    (1 1 22 33 1 22 4)
    