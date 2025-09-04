(SMACRO for ( LAMBDA (i ibeg iend meat) 

            (PROG (stmt) 

                  (COND ((LESSP (EVAL iend) (EVAL ibeg)) (RETURN nil)))

                  (SETQ stmt (LIST (QUOTE PROG) NIL (LIST (QUOTE SETQ) i ibeg)))
                  (SETQ stmt (append stmt (LIST (QUOTE beg_loop)))) 
                  (SETQ stmt (append stmt meat)) 
                  (SETQ stmt (append stmt (LIST (LIST (QUOTE SETQ) i (LIST (QUOTE ADD1) i)))))
                  (SETQ stmt (append stmt (LIST (LIST (QUOTE COND) (LIST (LIST (QUOTE GREATERP) i iend) (LIST (QUOTE RETURN) iend))))))
                  (SETQ stmt (append stmt (LIST (LIST (QUOTE GO) (QUOTE beg_loop)))))
                  (RETURN stmt))) 
)



