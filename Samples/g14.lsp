
(grwCreate 'w 500 500 "Двадцатиугольник" &HEEEEEE)

(grwSetParm 'w 2 1 &HFFFFFF) 

(grwShow 'w)

(grwScale 'w -150 150 -150 150)

(grwFont 'w "Courier" 16 T nil)

(setq mnu-1 "Пункт-1")
(setq mnu-2 "Пункт-2")

(setq hh (grwTextH 'w mnu-1))
(setq ww (grwTextW 'w mnu-2))

(print 'ww=) 
(print ww)
(terpri)

(print 'hh=) 
(print hh)
(terpri)

(setq x (+ -150 (* (- 300 ww) 0.5))))
(setq y (+ -150 (* (- 300 hh) 0.5))))

(grwPrint 'w x y mnu-1 &H000000)

(grwPrint 'w x (- y hh) mnu-2 &HFF0000)

(prog (k n)

      L  (setq k (grwInkey 'w))

         (cond ((eq k 27) (return 0)))

         (cond ((eq k 13) (return n)))

         (cond ((eq k 38) (go L1)))

         (cond ((eq k 40) (go L2)))

         (go L)
    
      L1 

         (grwPrint 'w x y mnu-1 &HFF0000)

         (grwPrint 'w x (- y hh) mnu-2 &H000000)

         (setq n 1)

         (go L)

      L2 

         (grwPrint 'w x y mnu-1 &H000000)

         (grwPrint 'w x (- y hh) mnu-2 &HFF0000)

         (setq n 2)

         (go L)


)

(grwDestroy 'w)

(gcd)

