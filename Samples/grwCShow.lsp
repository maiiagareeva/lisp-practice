(defun grwCshow (w X Y) (Prog (k)

       (Cond ((<> (sysmode) 3) (RaiseError "grwCShow: ������������ ����� ������")))  

       (grwShow w X Y) 

 @Get  (setq k (grwInkey w))

       (cond ((= k 0) (Go @Get)))

       (grwHide w)

       (Return k)

))

  


    