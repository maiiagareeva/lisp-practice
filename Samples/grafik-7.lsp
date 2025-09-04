
(defun grafik (f% g% xmin xmax w Ttl) 

              (prog (x i y z ymin ymax dx dy ddx ddy zx zy)

                // Поиск максимума и минимума функций 

                (setq dx (/ (- xmax xmin) 100))

                (setq ymin (f% xmin))
                (setq ymax (f% xmax))

                (setq x xmin)
                 
         L1     (setq y (f% x))

                (cond ((lessp y ymin) (setq ymin y)))

                (cond ((greaterp y ymax) (setq ymax y)))

                (setq x (+ x dx))

                (cond ((lessp x xmax) (go L1)))


                (setq x xmin)
                 
         L2     (setq y (g% x))

                (cond ((lessp y ymin) (setq ymin y)))

                (cond ((greaterp y ymax) (setq ymax y)))

                (setq x (+ x dx))

                (cond ((lessp x xmax) (go L2)))


                (setq ymin (min ymin 0))


                (setq ddy (* 0.05 (- ymax ymin)))
                (setq ddx (* 0.05 (- xmax xmin)))

                (grwCreate w 600 600 Ttl &HFFFFFF)

                (grwShow w)

                (grwScale w (- xmin ddx) (+ xmax ddx) (- ymin ddy) (+ ymax ddy))

                (grwSetParm w 1 0 &HFF0000 &HFF0000)

                (setq dy (/ (- ymax ymin) 20)) 


                // рисование сетки


                (setq y 0)

            Q1  (grwLine w xmin y xmax y &HDDDDDD)       

                (setq y (+ y dy))

                (cond ((leeqp y ymax) (go Q1)))

                (setq y 0)

            Q2  (grwLine w xmin y xmax y &HDDDDDD)       

                (setq y (- y dy))

                (cond ((greaterp y ymin) (go Q2)))                  


                (setq dx (/ (- xmax xmin) 20))

                (setq x xmin)

             Q3 (grwLine w x ymin x ymax &HDDDDDD)  

                (setq x (+ x dx))

                (cond ((leeqp x xmax) (go Q3)))


                // рисование координатных осей


                (setq zx 0)                

                (setq zy 0)

                (grwLine w zx ymax zx ymin &H000000)

                (grwLine w xmin zy xmax zy &H000000)

                (grwFont w "COURIER NEW" 6 T nil)
 

                // разметка координатных осей


                (setq y 0)

            Z1  (grwPrint w zx y (format y "#.00") &H000000)       

                (setq y (+ y dy))

                (cond ((leeqp y ymax) (go Z1)))

                (setq y 0)

             Z2 (grwPrint w zx y (format y "#.00") &H000000)       

                (setq y (- y dy))

                (cond ((greaterp y ymin) (go Z2)))                  


                (setq dx (/ (- xmax xmin) 10))

                (setq x xmin)

             Z3 (grwPrint w x zy (format x "#0.00") &H000000)  

                (setq x (+ x dx))

                (cond ((leeqp x xmax) (go Z3)))


                 // Рисование графиков


                 (grwSetParm w 3 0 &HFF0000 &HFF0000)

                 (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (f% x) &HFF0000)

          L3     (grwLine w x (f% x) nil nil &HFF0000)

                 (setq x (+ x dx))
                       
                 (cond ((greaterp x xmax) (Go L4)))
                         
                 (go L3)
          
          L4     (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (g% x) &H0000FF)

          L5     (grwLine w x (g% x) nil nil &H0000FF)

                 (setq x (+ x dx))
                       
                 (cond ((greaterp x xmax) (return 'ok!)))
                         
                 (go L5)

))

(grafik (function asn) (function acs) -1 1 'w "Две функции на одном чертеже")

(gc)



