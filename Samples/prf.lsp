
(prog (f s)

           (cond ((Null (filOpen 'f "c:\autoexec.bat" 0)) (return 'error!)))

           (terpri)
           (prints "*** c:\autoexec.bat ***")
           (terpri)
           (terpri)
           (terpri) 

         L (setq s (filGetline 'f))
           (cond ((null s) (go EOF))
                  (T       (go pr)))
        Pr (prints s) (terpri)
           (go l)
       EOF (filClose 'f) 

           (terpri)
           (prints "*** Конец файла ***")
           (terpri)

           (return 'ok!)
           
)
