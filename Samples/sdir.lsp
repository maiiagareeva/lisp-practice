
(defun sdir (aDir) (prog (tail ff fn r)


                         (setq tail (sysDir (strCat aDir "\*.*") &H1F))
                         
                         (cond ((null tail) (return 'Not_Found)))  

                    @L
                         (cond ((null tail) (return r)))

                         (setq ff (car tail))
                     
                         (setq tail (cdr tail))

                         (setq fn (strCat (strCat aDir "\") ff))

                         (setq r (append r (cons fn (sysGetAttr fn))))

                         (refresh)

                         (go @L)

                        ))
