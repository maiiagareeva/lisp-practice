
(defun qbcolor (n) (Cond ((eq n 0)  &H000000)
                         ((eq n 1)  &H800000)
                         ((eq n 2)  &H008000)
                         ((eq n 3)  &H808000)
                         ((eq n 4)  &H000080)
                         ((eq n 5)  &H800080)
                         ((eq n 6)  &H008080)
                         ((eq n 7)  &HC0C0C0)
                         ((eq n 8)  &H808080)
                         ((eq n 9)  &HFF0000)
                         ((eq n 10) &H00FF00)
                         ((eq n 11) &HFFFF00)
                         ((eq n 12) &H0000FF)
                         ((eq n 13) &HFF00FF)
                         ((eq n 14) &H00FFFF)
                         ((eq n 15) &HFFFFFF)
                     )
)

(defun isoline (f% xmin xmax ymin ymax w Ttl) 

              (prog (n x y z dx dy ddx ddy zx zy u q zmin zmax)

                // Поиск максимума и минимума функций 

                (setq dx (/ (- xmax xmin) 20))
                (setq dy (/ (- ymax ymin) 20))

                (setq zmin (f% xmin ymin))
                (setq zmax (f% xmin ymin))

                (setq x xmin)
                 
         L0     (setq y ymin)

         L1     (setq z (f% x y))

                (cond ((< z zmin) (setq zmin z)))

                (cond ((> z zmax) (setq zmax z)))

                (setq y (+ y dy))

                (cond ((<= y ymax) (go L1)))

                (setq x (+ x dx))

                (cond ((<= x xmax) (go L0)))

                (setq ddy (* 0.05 (- ymax ymin)))

                (setq ddx (* 0.05 (- xmax xmin)))

                (grwCreate w 600 600 Ttl &HFFFFFF)

                (grwShow w)

                (grwScale w (- xmin ddx) (+ xmax ddx) (- ymin ddy) (+ ymax ddy))

                (grwSetParm w 1 0 &HFF0000 &HFF0000)

                 // Рисование изолиний

                (grwSetParm w 2 0 &HFF0000 &HFF0000)

                (setq dx (/ (- xmax xmin) 100))
                (setq dy (/ (- ymax ymin) 100))

                (setq x xmin)
                 
                (setq n 0)

         LL0    (setq y ymin)

         LL1    (setq z (f% x y))

                (setq q (* 16 (/ (- zmax z) (- zmax zmin))))

                (setq u (fix q))

                (grwPset 'w x y (qbcolor u))                

                (setq y (+ y dy))

                (cond ((<= y ymax) (go LL1)))

                (setq n (add1 n))

                (cond ((= n 10) (prog nil (gc) (setq n 0))))

                (setq x (+ x dx))

                (cond ((<= x xmax) (go LL0)))

                (return 'ok!)
	
))

(defun g (x y) (+ (* x x) (* y y)) )

(isoline (function g) -20 20 -20 20 'w "Проба")



