
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
  
              (setq stmt (append stmt (list (list 'cond (list (list 'lessp i iend) (list 'go 'beg_loop))))))

              (setq stmt (append stmt (list (list 'return nil))))

              (return stmt)  

            )

        )

)
    


                         
