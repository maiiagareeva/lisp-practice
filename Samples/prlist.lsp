(defun prlist (x) (cond ((null x) (terpri)) ((atom x) (prog nil (printsline x))) (T (prog nil (prlist (car x)) 
(prlist (cdr x))))))