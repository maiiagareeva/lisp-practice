
(defun pprint (L marg)

       (cond ((atom L) 
                      (prog nil (setmarg marg)
                                (print L)
                      )
              )
             
             ((< (length L) 3)

                      (prog nil (setmarg marg)
                                (print L)
                      )

             (T       (prog nil
                                (terpri)
                                (setmarg marg)
                                (prints _LPAR)
                                (prints (car L))
                                (print-tail (cdr L) marg)))
       ))

(defun print-tail (L marg)

       (cond  ((null L) (prints _RPAR))
              (T        (prog nil (terpri)
                                  (setmarg marg)
                                  (pprint (car L) (+ marg 3))
                                  (print-tail (cdr L) marg)))
       ))

(defun setmarg (m)
       
       (cond ((= m 1) (prints " "))
             (T (setmarg (- m 1)))
       )
)

 
                             