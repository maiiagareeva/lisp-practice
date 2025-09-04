
(grwCreate 'w 640 480 "Треугольники" &HEEEEEE)

(grwSetParm 'w 3 1 &HFFFFFF) 

(grwShow 'w)

(prog (x1 y1 x2 y2 x3 y3 r g b cb cf rr1 rr2 rr3 xm ym xx yy i)  

      (grwScale 'w 0 640 0 480)

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

          (setq cb (fix2bit (+ b (* 256 g) (* 65536 r))))

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cf (fix2bit (+ b (* 256 g) (* 65536 r))))

          (setq rr1 (sqr (+ (^ (- x1 x2) 2) (^ (- y1 y2) 2))))
          (setq rr2 (sqr (+ (^ (- x2 x3) 2) (^ (- y2 y3) 2))))
          (setq rr3 (sqr (+ (^ (- x1 x3) 2) (^ (- y1 y3) 2))))

          (cond ((lessp (+ rr1 rr2) rr3) (go beg_loop)))
          (cond ((lessp (+ rr1 rr3) rr2) (go beg_loop)))
          (cond ((lessp (+ rr2 rr3) rr1) (go beg_loop)))

          (cond ((lessp (- (+ rr1 rr2) rr3) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr1 rr3) rr2) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr2 rr3) rr1) 0.001) (go beg_loop)))

          (grwLine 'w x1 y1 x2 y2 cb)
 
          (grwLine 'w x2 y2 x3 y3 cb)

          (grwLine 'w x3 y3 x1 y1 cb)

          (setq xm (* 0.5 (+ x2 x3)))
          (setq ym (* 0.5 (+ y2 y3)))
 
          (setq xx (* 0.5 (+ x1 xm)))
          (setq yy (* 0.5 (+ y1 ym)))

          (grwFill 'w xx yy cf cb)

          (setq k (grwInkey 'w))

          (cond ((eq k 27) (return 'ok)))

          (setq i (add1 i))

          (cond ((lessp i 100) (go beg_loop)))  

          (return 'ok)          

)

(gcd)

