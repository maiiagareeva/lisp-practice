
///

(defun graph (w) (prog (n u z) 
              
                   L@ (setq z (menu w))

                      (cond ((eq z 1) (setq u (triangle w)))
                            ((eq z 2) (setq u (fillcirc w)))
                            ( T       (go E@))
                      )

                      (grwDestroy w)

                      (go L@)

                   E@ (grwDestroy w)
                      (return u)
                 )
)    

///

(defun fillcirc (w) 

      (prog (r g b i x y ww hh c rr k)

            (grwShow w) 

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

////

(defun triangle (w) 

(prog (x1 y1 x2 y2 x3 y3 r g b cb cf rr1 rr2 rr3 xm ym xx yy i)  

      (grwShow w) 

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

   )

)

////

(defun menu (w) (prog (mnu-1 mnu-2 ww hh x y a)

                       (grwCreate w 500 500 "√рафический тест" &HFFFFFF)

                       (grwSetParm w 2 1 &HFFFFFF) 

                       (grwShow w)

                       (grwScale w -150 150 -150 150)

                       (grwFont w "FIXEDSYS" 12 T nil)

                       (setq mnu-1 "÷ветные треугольники")
                       (setq mnu-2 "    ÷ветные круги   ")
                       
                       (setq hh (grwTextH w mnu-1))
                       (setq ww (grwTextW w mnu-1))

                       (setq x (+ -150 (* (- 300 ww) 0.5)))
                       (setq y (+ -150 (* (- 300 hh) 0.5)))

                       (grwPrint w x y mnu-2 &H000000)

                       (grwPrint w x (- y hh) mnu-1 &HFF0000)

                       (setq a (prog (k n)

                             (setq n 1)

                          L  (setq k (grwInkey w))

                             (cond ((eq k 27) (return 0)))

                             (cond ((eq k 13) (return n)))

                             (cond ((eq k 38) (prog nil (setq n (sub1 n)) (cond ((eq n 0) (setq n 2))))))

                             (cond ((eq k 40) (prog nil (setq n (add1 n)) (cond ((eq n 3) (setq n 1))))))

                             (cond ((eq k 0)(go L)))
    
                             (cond ((eq n 1)

                                           (prog nil

                                                (grwPrint w x y mnu-2 &H000000)

                                                (grwPrint w x (- y hh) mnu-1 &HFF0000)
                                           ))

                                   (T     (prog nil

                                                (grwPrint w x y mnu-2 &HFF0000)

                                                (grwPrint w x (- y hh) mnu-1 &H000000)

                                           ))

                             )

                             (go L)

                 ))

                 (return a)

))

/////////////////////////////

(graph 'd)

(gcd)






