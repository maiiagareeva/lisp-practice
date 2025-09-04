
(defun max2 (x y) (cond ((lessp x y) y)
                        (T           x)
                 ) 
                 
)


(sexpr sexpand (lambda (x f) (cond ((NULL (cdr x)) (car x)                             )
                                  (T              (list f (car x) (sexpand (cdr x) f) ))
                            ) 
              ) 
                  
)

(smacro expand (lambda (x f) (sexpand x f)))


