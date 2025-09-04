
//
// Примитивная марко-функция, реализующая цикл FOR
//

(smacro for
 
        (lambda
          
           (i ibeg iend meat)

            (prog (stmt) 

              (setq stmt (list 'prog nil (list 'setq i ibeg)))
 
              (setq stmt (append stmt (list 'beg_loop)))

              (setq stmt (append stmt meat))
 
              (setq stmt (append stmt (list (list 'setq i (list 'add1 i)))))
  
              (setq stmt (append stmt (list (list 'cond (list (list 'greaterp i iend) (list 'return iend) )))))

              (setq stmt (append stmt (list  (list 'go 'beg_loop))))

              (return stmt)  

            )

        )

)
    
//  (PROG NIL (SETQ ii -10) 
//
//   beg_loop (PRINT ii)
//
//            (TERPRI)
//
//            (SETQ ii (ADD1 ii))
//
//            (COND ((GREATERP ii 10)(RETURN NIL)))
//
//            (GO beg_loop)
//   )


                         
