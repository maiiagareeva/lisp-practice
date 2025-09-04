
(defun grafik (f) (prog (x i y z)

                        (grwCreate 'w 400 400 "График функции" &HFFFFFF)

                        (grwShow 'w)

                        (grwScale 'w -100 100 -6000 6000)

                        (grwSetParm 'w 1 0 &HFF0000 &HFF0000)

                        (setq y -6000)

                        (for i 1 20 ((grwLine 'w -100 y 100 y &HDDDDDD) (setq y (+ y 600))))

                        (setq x -100)

                        (for i 1 20 ((grwLine 'w x -6000 x 6000 &HDDDDDD) (setq x (+ x 10))))

                        (grwLine 'w 0 6000 0 -6000 &H000000)

                        (grwLine 'w -100 0 100 0 &H000000)

                         // разметка осей

                        (grwFont 'w "COURIER" 6 T nil)
 
                        (setq y 6000)

                        (for i 1 20 ((grwPrint 'w 0.1 y y &H000000) (setq y (- y 600))))

                        (setq x 100)

                        (for i 1 20 ((grwPrint 'w x -0.1 x &H000000) (setq x (- x 10))))

                        // Рисование графика

                        (grwSetParm 'w 3 0 &HFF0000 &HFF0000)

                        (setq x -100)

                        (grwPset 'w x (f x) &HFF0000)

                L       (grwLine 'w x (f x) nil nil &HFF0000)

                        (setq x (+ x 1))
                       
                        (cond ((greaterp x 100) (return 'ok!)))
                         
                        (go L) 

))

(defun ff (x) (+ (* x (cos x) 5) (* 12 x (sin x)) -800))

(grafik 'ff)





