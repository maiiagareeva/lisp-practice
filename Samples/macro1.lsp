
//
//   Первый пример МАКРО
//

(smacro mprint_1 (lambda (ss n) (Prog (u z)
                                           (setq u n)
                                           (setq z '(Prog nil))
                                         a (setq z (append z (list (list 'print ss))))
                                           (setq z (append z (list (list 'terpri))))
                                           (setq u (- u 1))
                                           (cond ((eq u 0) (return z))
                                                 (t (go a))
                                           )
                                )
                 )
)


(smacro mprint_2 (lambda (ss n f) (Prog (u z)
                                           (setq u n)
                                           (setq z '(Prog nil))
                                           
                                           (cond ((NULL f) (go a))
                                                 (T        (go b)) 
                                           )

                                         a (setq z (append z (list (list 'print ss))))
                                           (setq z (append z (list (list 'terpri))))
                                           (setq u (- u 1))
                                           (cond ((eq u 0) (return z))
                                                 (t (go a))
                                           )

                                         b (setq z (append z (list (list 'print (list 'quote ss)))))
                                           (setq z (append z (list (list 'terpri))))
                                           (setq u (- u 1))
                                           (cond ((eq u 0) (return z))
                                                 (t (go b))
                                           )

                                )
                 )
)

