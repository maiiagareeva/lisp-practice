
(defun grafik (f% g% xmin xmax w Ttl) 

              (prog (x i y z ymin ymax dx dy ddx ddy zx zy)

                // Поиск максимума и минимума функций 

                (setq dx (/ (- xmax xmin) 100))

                (setq ymin (f% xmin))
                (setq ymax (f% xmax))

                (setq x xmin)
                 
         L1     (setq y (f% x))

                (cond ((<= y ymin) (setq ymin y)))

                (cond ((>= y ymax) (setq ymax y)))

                (setq x (+ x dx))

                (cond ((<= x xmax) (go L1)))


                (setq x xmin)
                 
         L2     (setq y (g% x))

                (cond ((<= y ymin) (setq ymin y)))

                (cond ((>= y ymax) (setq ymax y)))

                (setq x (+ x dx))

                (cond ((<= x xmax) (go L2)))


                (setq ymin (min ymin 0))


                (setq ddy (* 0.05 (- ymax ymin)))
                (setq ddx (* 0.05 (- xmax xmin)))

                (grwCreate w 600 600 Ttl &HFFFFFF)

                (grwShow w)

                (grwScale w (- xmin ddx) (+ xmax ddx) (- ymin ddy) (+ ymax ddy))

                (grwSetParm w 1 0 &HFF0000 &HFF0000)

                (setq dy (/ (- ymax ymin) 20)) 

                (setq y ymin)

                (for i 1 21 ((grwLine w xmin y xmax y &HDDDDDD) (setq y (+ y dy))))

                (setq x xmin)

                (setq dx (/ (- xmax xmin) 20)) 

                (for i 1 21 ((grwLine w x ymin x ymax &HDDDDDD) (setq x (+ x dx))))

                (setq zx 0)                
                (setq zy 0)

                // разметка осей

                (grwLine w zx ymax zx ymin &H000000)

                (grwLine w xmin zy xmax zy &H000000)

                (grwFont w "COURIER NEW" 7 T T)
 
                (setq y ymax)

                (for i 1 10 ((grwPrint w zx y (format y "#.00") &H000000) (setq y (- y dy dy))))

                (setq x xmax)

                (for i 1 10 ((grwPrint w x zy (format x "#0.00") &H000000) (setq x (- x dx dx))))

                 // Рисование графиков

                 (grwSetParm w 3 0 &HFF0000 &HFF0000)

                 (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (f% x) &HFF0000)

         L3      (grwLine w x (f% x) nil nil &HFF0000)

                 (setq x (+ x dx))
                       
                 (cond ((> x xmax) (Go L4)))
                         
                 (go L3)
          
          L4     (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (g% x) &H0000FF)

          L5     (grwLine w x (g% x) nil nil &H0000FF)

                 (setq x (+ x dx))
                       
                 (cond ((> x xmax) (return 'ok!)))
                         
                 (go L5)

))

(defun ff (x) (+ (sin (* 3 x)) (cos (* 5 x))))

(defun gg (x) (* (exp (* -0.3 x)) (sin x))))

(grafik 'ff 'gg -5 5 'w "Две функции на одном чертеже")

(gcd)



