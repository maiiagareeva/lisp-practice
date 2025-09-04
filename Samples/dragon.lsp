(defun ST (x1 y1 x2 y2 k)

          (cond ((> k 0) 
                 
                  (prog (xn yn)

                     (setq xn (+ (\ (+ x1 x2) 2) (\ (- y2 y1) 2)))
 
                     (setq yn (- (\ (+ y1 y2) 2) (\ (- x2 x1) 2)))

                     (ST x2 y2 xn yn (- k 1))

                     (ST x1 y1 xn yn (- k 1))

                  )  

                )  

                (T 
                    (prog nil
                       (grwLine 'w x1 y1 x2 y2 color)
                    )
                )
          ) 

 )

(prog (c)

       (grwCreate 'w 600 600 "Кривая дракона..." _WHITE)
       (grwShow 'w)
       (grwScale 'w -1500 1500 -1500 1500)
       (setq color _RED)

       (setq nn (str2fix (ask "Задайте порядок кривой")))

       (try

           (prog nil  
                (ST -800 -300 800 700 nn)  
           @Ink (setq c (grwInkey 'w 50))
                (cond ((= c 0) (go @Ink)))
                (grwDestroy 'w)
                (return 'Ok) 
           )

        except

           (prog nil (Say "Ошибка!") 
                     (return 'Bad)       
           )
        )
)