
(grwCreate 'w 500 500 "Вертикальное меню" &HFFFFFF)

(grwSetParm 'w 2 1 &HFFFFFF) 

(grwShow 'w)

(grwScale 'w -150 150 -150 150)

(grwFont 'w "Tahoma" 24 T nil)

(setq mnu-1 "Пункт-1")
(setq mnu-2 "Пункт-2")

(setq hh (grwTextH 'w mnu-1))
(setq ww (grwTextW 'w mnu-2))

(setq x (+ -150 (* (- 300 ww) 0.5))))
(setq y (+ -150 (* (- 300 hh) 0.5))))

(grwPrint 'w x y mnu-2 &H000000)

(grwPrint 'w x (- y hh) mnu-1 &HFF0000)

(prog (k n)

      (setq n 1)

      L  (setq k (grwInkey 'w))

         (cond ((eq k 27) (return 0)))

         (cond ((eq k 13) (return n)))

         (cond ((eq k 38) (prog nil (setq n (sub1 n)) (cond ((eq n 0) (setq n 2))))))

         (cond ((eq k 40) (prog nil (setq n (add1 n)) (cond ((eq n 3) (setq n 1))))))

         (cond ((eq k 0)(go L)))
    
         (cond ((eq n 1)
                         (prog nil

                                   (grwPrint 'w x y mnu-2 &H000000)

                                   (grwPrint 'w x (- y hh) mnu-1 &HFF0000)
                          ))

                 (T     (prog nil

                                   (grwPrint 'w x y mnu-2 &HFF0000)

                                   (grwPrint 'w x (- y hh) mnu-1 &H000000)

                          ))

          )

          (go L)

)

(grwDestroy 'w)

(gcd)

