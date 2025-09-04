
(defun grafik (f% g% xmin xmax w Ttl) 

              (prog (x i y z ymin ymax dx dy ddx ddy zx zy zval)

                // Поиск максимума и минимума функций 

                (setq dx (/ (- xmax xmin) 100))

                (setq ymin (f% xmin))

                (setq ymax (f% xmax))

                // Первая функция

                (setq x xmin)
                 
         L1     
                (try

                   (setq y (f% x))

                 except

                   (setq y Nil)
                ) 

                (cond ((null y) (go Next-x-1))) 

                (cond ((lessp y ymin) (setq ymin y)))

                (cond ((greaterp y ymax) (setq ymax y)))

       Next-x-1

                (setq x (+ x dx))

                (cond ((lessp x xmax) (go L1)))


                // Вторая функция

                (setq x xmin)

         L2     
                (try
                   
                   (setq y (g% x))
                                      
                 except
                   
                   (setq y Nil)

                )
 
                (cond ((null y) (go Next-x-2)))

                (cond ((lessp y ymin) (setq ymin y)))

                (cond ((greaterp y ymax) (setq ymax y)))

       Next-x-2

                (setq x (+ x dx))

                (cond ((lessp x xmax) (go L2)))

                (setq ymin (min ymin 0))


                (setq ddy (* 0.05 (- ymax ymin)))
                (setq ddx (* 0.05 (- xmax xmin)))

                (grwCreate w 600 600 Ttl &HFFFFFF)

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

                 (setq flg T)

          L3    
                 (try 

                     (setq zval (f% x))

                  except

                     (setq zval nil)

                 )  

                 (cond ((null zval) (go Next-1)))

                 (cond ((null flg)  (grwLine w x zval nil nil &HFF0000))
                       ( T          (grwPset w x zval &HFF0000)))

          Next-1
                 
                 (setq x (+ x dx))
                       
                 (cond ((greaterp x xmax) (Go L4)))

                 (setq flg (null zval)) 
                         
                 (go L3)


          
          L4     (setq x xmin)

                 (setq dx (/ (- xmax xmin) 100))

                 (grwPset w x (g% x) &H0000FF)

                 (setq flg T)

          L5

                 (try 

                     (setq zval (g% x))

                  except

                     (setq zval nil)

                 )  

                 (cond ((null zval) (go Next-2)))

                 (cond ((null flg)  (grwLine w x zval nil nil &H0000FF))
                       ( T          (grwPset w x zval &H0000FF)))

          Next-2

                 (setq x (+ x dx))
                       
                 (cond ((greaterp x xmax) (go L6)))
                 
                 (setq flg (null zval))
  
                 (go L5)

          L6     (grwShow w)

                 (kbd w) 

                 (grwHide w)

                 (grwDestroy w)

                 (return 'ok!)

))

(defun kbd (wi) (prog (x) 

          GetKey (setq x (grwInkey wi 30)) 

                 (cond ((eq x 0) (go GetKey)))

                 (return x)

                )
)


(setq flg nil)

(defun fun1 (x) (+ (* x 5) -9))

(defun fun2 (x) (/ (+ x 2) (- x 3)))

(grafik (function fun1) (function fun2) -5 5 'w-3 "Просто функции..")

(gc)

(grafik (function asn) (function acs) -1 1 'w-1 "Арксинус и арккосинус")

(gc)

(grafik (function ch) (function sh) -5 5 'w-2 "Гиперболический синус и косунус")


