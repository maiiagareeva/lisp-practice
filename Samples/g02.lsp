
(grwCreate 'w 600 600 "Анимация" &HFFFFFF)

(grwShow 'w)

(grwScale 'w -100 100 -100 100)

(prog (x y)

      (setq x -100)
      (setq y 0)

    L (grwFrect 'w x y (+ x 20) (- y 20) &HFF0000)

      (grwCls 'w)

      (setq x (+ x 2))

      (cond ((greaterp x 120) (return nil)))

      (go L)

) 

(gcd)

(prog (x y)

      (setq x 0)
      (setq y 100)

    L (grwFrect 'w x y (+ x 20) (- y 20) &HFF)

      (grwCls 'w)

      (setq y (- y 2))

      (cond ((lessp y -120) (return nil)))

      (go L)

) 

(gcd)

(grwCls 'w)

(grwDestroy 'w)


 