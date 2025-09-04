
(grwCreate 'w 400 400 "Комплексный графический тест" &HFFFFFF)

(grwShow 'w)

(grwSetParm 'w 2 nil nil)

(prog (x y xx)

      (grwScale 'w -10 5 -100 100)

      (setq x -10)

    L (setq y (* (sin (* 7 x)) (exp (* -0.5 x))))

      (cond ((greaterp x -10) (grwLine 'w x y nil nil &HFF)) 
            (T                (grwPset 'w x y &HFF)))

      (setq x (+ x 0.05))

      (cond ((greaterp x 10) (return nil)))

      (go L)

) 

(gcd)

(grwCls 'w)

(grwSetParm 'w 3 nil nil)

(prog (r g b i x y)

      (grwScale 'w 0 100 0 100) 

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwPset 'w x y (fix2bits (+ b (* 256 g) (* 65536 r))))

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

)

(gcd)

(grwCls 'w)

(prog (r g b i x y ww hh)

      (grwScale 'w 0 100 0 100) 

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq ww (rnd 30))
      (setq hh (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwRect 'w x y (+ x ww) (+ y hh) (fix2bits (+ b (* 256 g) (* 65536 r))))

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

)

(gcd)

(grwCls 'w)

(prog (r g b i x y ww hh)

      (grwScale 'w 0 100 0 100) 

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq ww (rnd 30))
      (setq hh (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwFrect 'w x y (+ x ww) (+ y hh) (fix2bits (+ b (* 256 g) (* 65536 r))))

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

)

(gcd)

(grwCls 'w)

(prog (r g b i x y ww hh c rr)

      (grwScale 'w 0 100 0 100) 

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq rr (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))

      (setq c (fix2bits (+ b (* 256 g) (* 65536 r))))

      (grwSetParm 'w 1 0 c)
       
      (grwcircle 'w x y rr c)

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

)

(gcd)

(grwCls 'w)

(prog (r g b i x y ww hh c aa)

      (grwScale 'w 0 100 0 100) 

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

      (grwSetParm 'w 1 0 c)
       
      (grwellipse 'w x y rr c aa)

      (setq i (sub1 i))

      (cond ((eq i 0) (return nil)))

      (go L)

)

(gcd)

(grwDestroy 'w)


 