(defun wintest nil
   
   (prog (hh i k)

   (setq winlist '(w1 w2 w3 w4 w5 w6))

   (setq collist '(_WHITE _BLUE _GREEN _OLIVE _RED _YELLOW))

   (setq ww 100)

   (setq hh 100)

   (for i 1 6 ((grwCreate (car winlist) ww hh (fix2str ww) (car collist)) 

               (grwShow (car winlist))

@GetKey                    

               (setq k (grwInkey (car winlist))) 
                
               (cond ((= k 0) (go @GetKey)))               
 
               (grwDestroy (car winlist))               

               (setq winlist (cdr winlist))

               (setq collist (cdr collist)) 

               (setq ww (+ ww 20))

               (setq hh (+ hh 20))

              )

   ) 
))


