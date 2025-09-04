
(defun fdir (aDir)

  (try 
      
       (prog (tail ff fn)
   
             (setq tail (sysDir (strCat aDir "\*.*") &H1F))
                         
             (cond ((null tail) (return 'Not_Found)))  

          @L (cond ((null tail) (return t)))

             (setq ff (car tail))
                     
             (setq tail (cdr tail))

             (setq fn (strCat (strCat aDir "\") ff))

             (prints (cons fn (sysGetAttr fn)))
                     
             (terpri)

             (go @L)

       )

   except

       (say (errormessage))

  )

)

