

(grwCreate 'w 640 480 "ѕчелиные соты" &HEEEEEE)

(grwSetParm 'w 2 1 &HFFFFFF) 

(grwShow 'w)

(prog (r fi z hx hy vx vy n hxx hyy m cx cy k Om x y r g b cf)  

      (grwScale 'w -100 100 -100 100)

      (setq r 10)
      (setq fi (/ _pi 3))
      (setq z 8)  

      (setq hx (* r (sqr 3.0)))
      (setq hy 0)
 
      (setq vx (* r (sqr 3.0) (cos fi)))

      (setq vy (* r (sqr 3.0) (sin fi)))

      (for n (- 0 Z) z   

           ( 

              (setq hxx (* hx n))
              (setq hyy (* hy n))

              (for m (- 0 Z) z   

                   (

                       (setq vxx (* vx m))
                       (setq vyy (* vy m))

                       (setq cx (+ vxx hxx))
                       (setq cy (+ vyy hyy))

                       (setq k 0)

                       (setq Om (* 0.5 Fi))

                  L    (cond ((eq k 0) (grwPset 'w 
                                                (+ cx (* r (cos Om)))
                                                (+ cy (* r (sin Om)))
                                                &H000000))
                             (T        (grwLine 'w 
                                                (+ cx (* r (cos Om)))
                                                (+ cy (* r (sin Om)))
                                                nil nil 
                                                &H000000))
                       )
  
                       (setq k -1)                              

                       (setq Om (+ Om Fi))

                       (cond ((lessp Om (+ (* 2.0 _pi) Fi)) (Go L)))

                 
                   ))

           ))

     @L      

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cf (fix2bits (+ b (* 256 g) (* 65536 r))))

          (setq x (+ -100 (rnd 200)))
          (setq y (+ -100 (rnd 200)))
           
          (grwFill 'w x y cf &H000000) 

          (setq k (grwInkey 'w))

          (cond ((eq k 27) (return 'ok)))
        
          (go @L)
  

)

(gcd)




 



