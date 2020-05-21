#|| 
    1) Определите макрос, который возвращает свой вызов.
 ||#   

 (print "Задача 1")
 
(defmacro self_call_macro (val)
   `'(self_call_macro, val))

(print (self_call_macro (1 2 3 4 5)))
(print (self_call_macro ()))

(print "__________________________________________________________________________")

(terpri)

#||
    2) Определите макрос (POP стек), который читает из стека верхний 
       элемент и меняет значение переменной стека.
||#


 (print "Задача 2")

(defmacro stack_pop (list)
  `(let ((first (car , list)))(setq , list(cdr , list)) first))

(setq stack '(2 4 5 5 8 6))
        
        
(print  (stack_pop stack))
(print  (stack_pop stack))
(print  (stack_pop stack))
(print stack)

(print "__________________________________________________________________________")

(terpri)

#||
    3) Определите лисповскую форму (IF условие p q) в виде макроса.
||#

 (print "Задача 3")

(defmacro if_condition (condition p q)
    `(if , condition, p, q))

(setq a '(1 2 3))
(print (if_condition (list a) 'True 'False))
(print (if_condition (< 1 2) 'True 'False))
(print (if_condition (> 1 2) 'True 'False))

(print "__________________________________________________________________________")

(terpri)

#||
    5) Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.
||#

 (print "Задача 5")

(defmacro rep (e p)
    `(cond (, p nil)
          (t(and (print , e)(rep, e ,p)))
     ))

(setq i 0)
(rep (setq i(+ i 1)) (equal i 10)) 