
//
//    Организующая программа
//

(defun graph (w) (prog (n u z) 

                      (grwCreate w 600 400 "Комплексный графический тест" &HFFFFFF)
              
                      (grwShow w)

                      (setq z 1) 

                   L@ (setq z (menu w z))

                      (cond ((eq z 1) (setq u (triangle w)))
                            ((eq z 2) (setq u (fillcirc w)))
                            ((eq z 3) (setq u (ellipse w)))
                            ((eq z 4) (setq u (points w)))
                            ((eq z 5) (setq u (fboxes w)))
                            ((eq z 6) (setq u (muar w)))
                            ( T       (go E@))
                      )

                      (gcd)

                      (go L@)

                   E@ (grwDestroy w)
                      (return u)
                 )
)    

//
//  Рисование кругов
//

(defun fillcirc (w) 

      (prog (r g b i x y ww hh c rr k)

            (grwScale w 0 100 0 100) 

            (grwCls w) 

            (setq i 300)

      L
            (setq k (grwInkey w))
            (cond ((eq k 27) (return 'ok!)))

            (setq x (rnd 100))
            (setq y (rnd 100))
            (setq rr (rnd 30))
            (setq r (rnd 255))
            (setq g (rnd 255))
            (setq b (rnd 255))

            (setq c (fix2bits (+ b (* 256 g) (* 65536 r))))

            (grwSetParm w 1 0 c)
       
            (grwcircle w x y rr c)

            (setq i (sub1 i))

            (cond ((eq i 0) (return 'ok!)))

            (go L)

     )

)

//
//  Рисование заполненных боксов
//

(defun fboxes (w)

(prog (r g b i x y ww hh k)

      (grwScale w 0 100 0 100) 

      (grwCls w)

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq ww (rnd 30))
      (setq hh (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwFrect w x y (+ x ww) (+ y hh) (fix2bits (+ b (* 256 g) (* 65536 r))))

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (return 'ok!)))

      (go L)

)

)

//
//  Рисование эллипсов
//

(defun ellipse (w)

(prog (r g b i x y ww hh c aa k)

      (grwScale w 0 100 0 100) 

      (grwCls w)

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq rr (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
      (setq aa (rnd 2.0))

      (cond ((lessp aa 0.001) (setq aa 0.3)))  

      (setq c (fix2bits (+ b (* 256 g) (* 65536 r))))

      (grwSetParm w 1 0 c)
       
      (grwellipse w x y rr c aa)

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (return 'ok!)))

      (go L)

))

//
//  Рисование цветных точек
//

(defun points (w)

(prog (r g b i x y k)

      (grwScale w 0 100 0 100) 

      (grwSetParm w 3 nil nil)

      (grwCls w)

      (setq i 400)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwPset w x y (fix2bits (+ b (* 256 g) (* 65536 r))))

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

))

//
//  Рисование треугольников
//

(defun triangle (w) 

(prog (x1 y1 x2 y2 x3 y3 r g b cb cf rr1 rr2 rr3 xm ym xx yy i)  

      (grwScale w 0 640 0 480)

      (grwCls w) 

      (setq i 0) 

      beg_loop

          (setq x1 (rnd 640))
          (setq y1 (rnd 480))

          (setq x2 (rnd 640))
          (setq y2 (rnd 480))

          (setq x3 (rnd 640))
          (setq y3 (rnd 480))

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cb (fix2bits (+ b (* 256 g) (* 65536 r))))

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cf (fix2bits (+ b (* 256 g) (* 65536 r))))

          (setq rr1 (sqr (+ (^ (- x1 x2) 2) (^ (- y1 y2) 2))))
          (setq rr2 (sqr (+ (^ (- x2 x3) 2) (^ (- y2 y3) 2))))
          (setq rr3 (sqr (+ (^ (- x1 x3) 2) (^ (- y1 y3) 2))))

          (cond ((lessp (+ rr1 rr2) rr3) (go beg_loop)))
          (cond ((lessp (+ rr1 rr3) rr2) (go beg_loop)))
          (cond ((lessp (+ rr2 rr3) rr1) (go beg_loop)))

          (cond ((lessp (- (+ rr1 rr2) rr3) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr1 rr3) rr2) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr2 rr3) rr1) 0.001) (go beg_loop)))

          (grwLine w x1 y1 x2 y2 cb)
 
          (grwLine w x2 y2 x3 y3 cb)

          (grwLine w x3 y3 x1 y1 cb)

          (setq xm (* 0.5 (+ x2 x3)))
          (setq ym (* 0.5 (+ y2 y3)))
 
          (setq xx (* 0.5 (+ x1 xm)))
          (setq yy (* 0.5 (+ y1 ym)))

          (grwFill w xx yy cf cb)

          (setq k (grwInkey w))

          (cond ((eq k 27) (return 'ok!)))

          (setq i (add1 i))

          (cond ((lessp i 100) (go beg_loop)))  

          (return 'ok!)          

))

//
//  Рисование муара
//

(defun muar(w)

      (prog (nline wi dx qx c x1 x2 i k)

            (grwCls w)

            (grwSetParm w 1 nil nil)

            (grwScale w 0 640 0 480)

            (setq nline 213)

            (setq wi (/ 640.0 3.0))

            (setq dx (/ Wi nline))

            (setq qx (/ 640.0 nline))

       L0   (setq r (rnd 255))
            (setq g (rnd 255))
            (setq b (rnd 255))
            (setq c (fix2bits (+ b (* 256 g) (* 65536 r))))
      
            (setq i 1) 

       L1

            (setq k (grwInkey w))

            (cond ((eq k 27) (return 'ok)))

            (setq x1 (+ Wi (* dx (- i 1))))

            (setq x2 (* qx (- i 1)))

            (grwLine w x1 1 x2 479 c)     

            (grwLine w x1 479 x2 1 c)     

            (setq i (add1 i))      

            (cond ((lessp i nline) (go L1)))

            (go L0)

))

//
//  Графическое меню
//

(defun menu (w nn)

       (prog (mnu-1 mnu-2 mnu-3 mnu-4 mnu-5 mnu-6 ww hh x y a n)

             (grwSetParm w 2 1 &HFFFFFF) 

             (grwScale w -150 150 -150 150)

             (grwCls w)

             (grwFont w "FIXEDSYS" 12 T nil)

             (setq mnu-1 "Треугольники")
             (setq mnu-2 "   Круги    ")
             (setq mnu-3 "  Эллипсы   ")
             (setq mnu-4 "   Точки    ")
             (setq mnu-5 "   Боксы    ")
             (setq mnu-6 "   Муар     ")
                        
             (setq hh (grwTextH w mnu-1))
             (setq ww (grwTextW w mnu-1))

             (setq x (+ -150 (* (- 300 ww) 0.5)))

             (setq y (* 0.5 6 hh))

             (setq n nn)

             (cond ((eq n 1)

                    (prog nil

                          (grwPrint w x y mnu-6 &H000000)

                          (grwPrint w x (- y hh) mnu-5 &H000000)

                          (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                          (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                          (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                          (grwPrint w x (- y (* 5 hh)) mnu-1 &HFF0000)

                   ))

                   ((eq n 2)

                    (prog nil

                          (grwPrint w x y mnu-6 &H000000)

                          (grwPrint w x (- y hh) mnu-5 &H000000)

                          (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                          (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                          (grwPrint w x (- y (* 4 hh)) mnu-2 &HFF0000)

                          (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                   ))

                   ((eq n 3)

                    (prog nil

                          (grwPrint w x y mnu-6 &H000000)
 
                          (grwPrint w x (- y hh) mnu-5 &H000000)

                          (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                          (grwPrint w x (- y (* 3 hh)) mnu-3 &HFF0000)

                          (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                          (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                   ))

                   ((eq n 4)

                    (prog nil

                          (grwPrint w x y mnu-6 &H000000)

                          (grwPrint w x (- y hh) mnu-5 &H000000)

                          (grwPrint w x (- y (* 2 hh)) mnu-4 &HFF0000)

                          (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                          (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                          (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                   ))

                   ((eq n 5)

                    (prog nil

                          (grwPrint w x y mnu-6 &H000000)

                          (grwPrint w x (- y hh) mnu-5 &HFF0000)

                          (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                          (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                          (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                          (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                    ))

                    ((eq n 6)

                     (prog nil

                           (grwPrint w x y mnu-6 &HFF0000)

                           (grwPrint w x (- y hh) mnu-5 &H000000)

                           (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                           (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                           (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                           (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                    ))

             )

             (setq a (prog (k)

                   L (setq k (grwInkey w))

                     (cond ((eq k 27) (return 0)))

                     (cond ((eq k 13) (return n)))

                     (cond ((eq k 40) (prog nil (setq n (sub1 n)) (cond ((eq n 0) (setq n 6))))))

                     (cond ((eq k 38) (prog nil (setq n (add1 n)) (cond ((eq n 7) (setq n 1))))))

                     (cond ((eq k 0)(go L)))
    
                           (cond ((eq n 1)

                                  (prog nil

                                        (grwPrint w x y mnu-6 &H000000)

                                        (grwPrint w x (- y hh) mnu-5 &H000000)

                                        (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                                        (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                                        (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                                        (grwPrint w x (- y (* 5 hh)) mnu-1 &HFF0000)

                                 ))

                                 ((eq n 2)

                                  (prog nil

                                        (grwPrint w x y mnu-6 &H000000)

                                        (grwPrint w x (- y hh) mnu-5 &H000000)

                                        (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                                        (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                                        (grwPrint w x (- y (* 4 hh)) mnu-2 &HFF0000)

                                        (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                                  ))

                                  ((eq n 3)

                                   (prog nil

                                         (grwPrint w x y mnu-6 &H000000)

                                         (grwPrint w x (- y hh) mnu-5 &H000000)

                                         (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                                         (grwPrint w x (- y (* 3 hh)) mnu-3 &HFF0000)

                                         (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                                         (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                                  ))

                                  ((eq n 4)

                                   (prog nil

                                         (grwPrint w x y mnu-6 &H000000)

                                         (grwPrint w x (- y hh) mnu-5 &H000000)

                                         (grwPrint w x (- y (* 2 hh)) mnu-4 &HFF0000)

                                         (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                                         (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                                         (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                                  ))

                                  ((eq n 5)

                                   (prog nil

                                         (grwPrint w x y mnu-6 &H000000)

                                         (grwPrint w x (- y hh) mnu-5 &HFF0000)

                                         (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                                         (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                                         (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                                         (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                                  ))

                                  ((eq n 6)

                                   (prog nil

                                         (grwPrint w x y mnu-6 &HFF0000)

                                         (grwPrint w x (- y hh) mnu-5 &H000000)

                                         (grwPrint w x (- y (* 2 hh)) mnu-4 &H000000)

                                         (grwPrint w x (- y (* 3 hh)) mnu-3 &H000000)

                                         (grwPrint w x (- y (* 4 hh)) mnu-2 &H000000)

                                         (grwPrint w x (- y (* 5 hh)) mnu-1 &H000000)

                                  ))

                     )

                     (go L)
                               
             ))

            (return a)

))


//
//  Запуск ...
//

(graph 'd)







