
(grwCreate 'w 640 480 "Муар" &HFFFFFF)

(grwShow 'w)

(grwSetParm 'w 1 nil nil)

(prog (nline wi dx qx c x1 x2 i k)

      (grwScale 'w 0 640 0 480)

      (setq nline 213)

      (setq wi (/ 640.0 3.0))

      (setq dx (/ Wi nline))

      (setq qx (/ 640.0 nline))

  L0

      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
      (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))
      (setq i 1) 

  L1

      (setq k (grwInkey 'w))

      (cond ((eq k 27) (return 'ok)))

      (setq x1 (+ Wi (* dx (- i 1))))

      (setq x2 (* qx (- i 1)))

      (grwLine 'w x1 1 x2 479 c)     

      (grwLine 'w x1 479 x2 1 c)     

      (setq i (add1 i))      

      (cond ((lessp i nline) (go L1)))

      (go L0)

) 

(gc)

