#||
    2) Определите функицонал (MAPLIST fn список) для одного списочного аргумента.
||#
(defun map_list (fn list)
	(cond
		((null list) nil)
		(t (cons (funcall fn list) (map_list fn (cdr list)))))
)

(map_list 'print '(8 3 44 23 123)) 
(map_list 'print '(1)) 

#||
    4) Определите функциональный предикат (КАЖДЫЙ пред список), который истинен в 
       том и только в том случае, когда, являющейся функциональным аргументом предикат 
       пред истинен для всех элементов списка список.
||#   

(defun every_ (p list)
   (null (mapcan #'(lambda (x) (if (funcall p x) nil (list t)) ) list)))   
   
  
(print (every_ 'evenp '(2 4 6)))  
(print (every_ (lambda (x) (> x 0)) '(3 1 2)))
(print (every_ (lambda (x) (< x 0)) '(3 1 2)))

