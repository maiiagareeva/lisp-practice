
(sexpr outn (lambda (ss n) (Prog (u) (setq u n) a (terpri) (print ss) (setq u (- u 1)) (cond ((eq u 1) (return nil)) (t (go a))))))

//(smacro outns (lambda (ss n) (Prog (u z) (setq u n) (setq z '(Prog nil)) a (setq z (append z (list (list 'print ss)))) (setq u (- u 1)) (cond ((eq u 0) (return z)) (t (go a))))))

(smacro outns (lambda (ss n) (Prog (u z) (setq u n) (setq z '(Prog nil))
 a (setq z (append z (list (list 'print ss))))
   (setq z (append z (list (list 'terpri))))
   (setq u (- u 1)) (cond ((eq u 0) (return z)) (t (go a))))))
