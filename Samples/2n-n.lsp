(defun 2^n-n (n) 
    
       (prog (i x z) 

             (setq x 0)

             (setq z 2) 

             (for i 1 n 
       
                  ( (cond ( (= (remainder (- z i) 7) 0) (prog nil (printline i) (setq x (add1 x)) )))
                    
                    (setq z (* z 2))

                    )
             )
             

             (return x)            
       )
)

