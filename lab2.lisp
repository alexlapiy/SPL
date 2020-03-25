#||
    7) Определите функцию, удаляющую из исходного списка элементы с четными номерами.
||#

(defun removeEvenFromList (list)
    (cond ((null list) nil)
        ((evenp (car list)) (removeEvenFromList (cdr list)))
        (t (cons (car list) (removeEvenFromList (cdr list))))
))

;;; > (removeEvenFromList '(1 2 2 4 4 7 6 9 8))
;;    (1 7 9)