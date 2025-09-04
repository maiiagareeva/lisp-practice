
(grwCreate 'w 300 300 "Анимация" &HFFFFFF)

(grwShow 'w)

(grwScale 'w -105 105 -105 105)

(prog (x1 y1 x2 y2 vx vy k)

      (setq x1 0)
      (setq y1 0)
      (setq vx (rnd 10))
      (setq vy (rnd 10))

      (grwFrect 'w x1 y1 (+ x1 5) (- y1 5) &HFF0000) 

 Loop 
       
      (setq x2 (+ x1 (* vx 3)))

      (setq y2 (+ y1 (* vy 3)))

      (grwFrect 'w x1 y1 (+ x1 5) (- y1 5) &HFFFFFF)       

      (grwFrect 'w x2 y2 (+ x2 5) (- y2 5) &HFF0000)

      (grwRefresh 'w 3)

      (setq k (grwInkey 'w))

      (cond ((eq k 27) (return k)))

      (cond ((greaterp x2 95) (setq vx (- 0 vx))))

      (cond ((greaterp y2 95) (setq vy (- 0 vy))))

      (cond ((lessp x2 -95) (setq vx (- 0 vx))))

      (cond ((lessp y2 -95) (setq vy (- 0 vy))))
      
      (setq x1 x2)

      (setq y1 y2) 

      (go Loop)

)

(gc)

(grwCls 'w)

(grwDestroy 'w)


 