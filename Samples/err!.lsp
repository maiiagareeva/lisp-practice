
(defun fqq (n) (prog (z) (setq z (eval n)) (return z)))

(fqq 'z)

(fqq 'o)

//#################################################################

(defmacro fqq (n) (prog (stmt)
    (setq stmt (list 'PROG (list 'z) (list 'setq 'z (eval n)) (list 'print 'z) (list 'RETURN 'z)))
    (return stmt))
)

 


