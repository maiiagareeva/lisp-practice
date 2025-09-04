
(grwCreate 'w 600 600 "Повороты" &HFFFFFF)

(grwShow 'w)

(prog (A B X0 Fi rt tt)

      (grwScale 'w -100 100 -100 100)

      (setq A 20.0) 
      (setq B 20.0)

      (setq X0 80) 

      (setq Fi 0.0)

   L1   (setq rfi (/ (* fi _pi) 180))

        (setq tt 0.0)

   L2      (setq rt (/ (* tt _pi) 180))      

           (setq x (+ x0 (* A (cos rt))))
           (setq y (* B (sin rt)))

           (setq xx (+ (* x (cos rfi)) (* y (sin rfi))))
           (setq yy (- (* y (cos rfi)) (* x (sin rfi))))

           (grwPset 'w xx yy &HFF) 

           (setq tt (+ tt 10))

           (cond ((lessp tt 361) (go L2)))

           (setq fi (+ fi 17))

           (cond ((lessp fi 361) (go L1)))

)

(gc)

(grwCls 'w)

(grwDestroy 'w)


 