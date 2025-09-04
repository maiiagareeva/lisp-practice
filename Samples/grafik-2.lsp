
(defun grafik (f xmin xmax w) 

              (prog (x i y z ymin ymax dx dy ddx ddy)

                // Поиск максимума и минимума функции 

                (setq dx (/ (- xmax xmin) 100))

                (setq ymin (f xmin))
                (setq ymax (f xmax))

                (setq x xmin)
                 
         L0     (setq y (f x))

                (cond ((lessp y ymin) (setq ymin y)))

                (cond ((greaterp y ymax) (setq ymax y)))

                (setq x (+ x dx))

                (cond ((lessp x xmax) (go L0)))

                (setq ddy (* 0.05 (- ymax ymin)))
                (setq ddx (* 0.05 (- xmax xmin)))

                (grwCreate w 400 400 "График функции" &HFFFFFF)

                (grwShow w)

                (grwScale w (- xmin ddx) (+ xmax ddx) (- ymin ddy) (+ ymax ddy))

                (grwSetParm w 1 0 &HFF0000 &HFF0000)

                (setq dy (/ (- ymax ymin) 20)) 

                (setq y ymin)

                (for i 1 21 ((grwLine w xmin y xmax y &HDDDDDD) (setq y (+ y dy))))

                (setq x xmin)

                (setq dx (/ (- xmax xmin) 20)) 

                (for i 1 21 ((grwLine w x ymin x ymax &HDDDDDD) (setq x (+ x dx))))

                (setq zx (* 0.5 (+ xmax xmin)))
                (setq zy (* 0.5 (+ ymax ymin)))

                // разметка осей

                (grwLine w zx ymax zx ymin &H000000)

                (grwLine w xmin zy xmax zy &H000000)

                (grwFont w "COURIER" 6 T nil)
 
                (setq y ymax)

                (for i 1 10 ((grwPrint w zx y (format y "0.00e+") &H000000) (setq y (- y dy dy))))

                (setq x xmax)

                (for i 1 10 ((grwPrint w x zy (format x "00.0") &H000000) (setq x (- x dx dx))))

                 // Рисование графика

                 (grwSetParm w 3 0 &HFF0000 &HFF0000)

                 (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (f x) &HFF0000)

         L       (grwLine w x (f x) nil nil &HFF0000)

                 (setq x (+ x dx))
                       
                 (cond ((greaterp x xmax) (return 'ok!)))
                         
                 (go L) 

))

(defun ff (x) (+ (* x (cos x) 5) (* 12 x (sin x))))

(defun gg (x) (/ (* x x) (+ 1 (* x x x x))))

(grafik 'ff -20 20 'w1)

(gcd)

(grafik 'gg -20 20 'w2)

(gcd)



