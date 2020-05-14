#|| 
    8) Напишите генератор натуральных чисел: 0, 1, 2, 3, 4, 5, ...
 ||#   

(defun number_generator ()
    (let ((x -1)) (lambda () (setq x (+ 1 x))))
)
(setq numGen (number_generator))

(loop for a from 0 to 5
   do (print (funcall numGen))
)

(print "__________________________________________________________________________")

(terpri)


#||
    10) Напишитегенератор,порождающийпоследовательность(A), (B A), (A B A),
        (B A B A), ...
||#


#||
    12) Определите функцию, которая возвращает в качестве значения свой вызов.
||#

(defun self_call(list)
    (list 'self_call (list 'quote list)))


(print (self_call '(0)))
(print (self_call (quote (0))))





;------------------------- DONE ------------------------- 

;(print "Лаборатоная 2")
#||
    2) Определите функицонал (MAPLIST fn список) для одного списочного аргумента.
||#
(defun map_list (fn list)
	(cond
		((null list) nil)
		(t (cons (funcall fn list) (map_list fn (cdr list)))))
)

;(map_list 'print '(8 3 44 23 123)) 
;(map_list 'print '(1)) 

;(print "__________________________________________________________________________")

;(terpri)

;(print "Лаборатоная 4")

#||
    4) Определите функциональный предикат (КАЖДЫЙ пред список), который истинен в 
       том и только в том случае, когда, являющейся функциональным аргументом предикат 
       пред истинен для всех элементов списка список.
||#   

(defun every_ (p list)
   (null (mapcan (lambda (x) (if (funcall p x) nil (list t)) ) list)))   
   
  
;(print (every_ 'evenp '(2 4 6)))  
;(print (every_ (lambda (x) (> x 0)) '(3 1 2)))
;(print (every_ (lambda (x) (< x 0)) '(3 1 2)))

;(print "__________________________________________________________________________")

;(terpri)

;(print "Лабораторная 6")

#||
    6) Определите фильтр (УДАЛИТЬ-ЕСЛИ пред список), удаляющий из списка 
    список все элементы, которые обладают свойством, наличие которого проверяет предикат пред.
||#


(defun delete_if (elem list)
	(mapcan (lambda (x) (if (funcall elem x) nil (list x))) list)
) 

;(print (delete_if 'evenp '(1 2 3 4 5 6)))
;(print (delete_if (lambda (x) (> x 0)) '(3 1 2)))



