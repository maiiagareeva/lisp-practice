
(defun grafik (f) (prog (x i y z)

                        (grwCreate 'w 300 300 "График функции" &HFFFFFF)

                        (grwShow 'w)

                        (grwScale 'w -100 100 -100 100)

                        (setq y -100)

                        (for i 1 20 ((grwLine 'w -100 y 100 y &HDDDDDD) (setq y (+ y 10))))

                        (setq x -100)

                        (for i 1 20 ((grwLine 'w x -100 x 100 &HDDDDDD) (setq x (+ x 10))))

                        (grwLine 'w 0 100 0 -100 &H000000)

                        (grwLine 'w -100 0 100 0 &H000000)

                        (setq x -100)

                        (grwPset 'w x (f x) &HFF0000)

                L       (grwLine 'w x (f x) nil nil &HFF0000)

                        (setq x (+ x 1))
                       
                        (cond ((greaterp x 100) (return 'ok!)))
                         
                        (go L) 

))





