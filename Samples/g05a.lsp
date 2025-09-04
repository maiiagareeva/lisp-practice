
(defun animation (w)

(prog (x1 y1 x2 y2 vx vy k)

      (grwCreate w 600 600 "Анимация" &HFFFFFF)

      (grwShow w)

      (grwScale w -105 105 -105 105)

      (setq x1 0)

      (setq y1 0)

      (setq vx (rnd 10))

      (setq vy (rnd 10))

      (cond ((eq vx vy) (setq vy (+ 2 vy)))) 

      (grwSetParm w 1 0 &HFF0000)
 
      (grwCircle w x1 y1 3 &HFF0000)

 Loop 
       
      (setq x2 (+ x1 (* vx 0.5)))

      (setq y2 (+ y1 (* vy 0.5)))

      (grwSetParm w 1 0 &HFFFFFF)

      (grwCircle w x1 y1 3 &HFFFFFF)

      (grwRefresh w 0)
 
      (grwSetParm w 1 0 &HFF0000)

      (grwCircle w x2 y2 3 &HFF0000)

      (grwRefresh w 0)

      (setq k (grwInkey w))

      (cond ((eq k 27) (return k)))

      (cond ((greaterp x2 100) (setq vx (- 0 vx))))

      (cond ((greaterp y2 100) (setq vy (- 0 vy))))

      (cond ((lessp x2 -100) (setq vx (- 0 vx))))

      (cond ((lessp y2 -100) (setq vy (- 0 vy))))
      
      (setq x1 x2)

      (setq y1 y2) 

      (go Loop)

))



 