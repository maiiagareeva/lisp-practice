
(grwCreate 'w 400 400 "Спирали" &HFFFFFF)

(grwShow 'w)

(grwSetParm 'w 3 nil nil)

(prog (r g b c p fi ff x y k)

      (grwScale 'w -100 100 -100 100)

  L0

      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))

      (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))

      (setq p 0)

      (setq fi 0.0)

  L1

      (setq k (grwInkey 'w))

      (cond ((eq k 27) (return 'ok)))

      (setq FF (/ (* Fi _Pi) 180.0))  

      (setq y (* (sin FF) FF))

      (setq x (* (cos FF) FF))
 
      (cond ((eq p 0) (grwPset 'w x y c))
            (T        (grwLine 'w x y nil nil c))
      )
      
      (setq p 1) 
     
      (setq fi (+ fi 10.0))       

      (cond ((lessp fi (* 360 5)) (go L1))) 

      (go L0)

) 

(grwDestroy 'w)

(gc)