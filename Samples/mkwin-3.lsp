
(grwCreate 'w1 300 300 "Пробное окно - 1" &HFFFFFF)

(grwScale 'w1 -100 100 -100 100)

(grwSetParm 'w1 1 0 &HFFFFFF &HFF0000)

(grwShow 'w1)

(setq fi 60.0)

(grwDraw 'w1 '(C &H0000FF))

(setq x -80)

(setq y -80)

(setq cc (bits2Fix &HEE88AA))

(for j 1 8 (

              (grwDraw 'w1 (list 'M x y))

              (for i 1 6 ( (grwDraw 'w1 (list 'U 10 'R 10 ))  
                           (grwDraw 'w1 (list T fi))
                           (setq fi (+ fi 60.0)) 
                         )
               )

               (grwDraw 'w1 (list 'M (+ x -3.5) (+ x 15) 'P (fix2Bits cc) &H0000FF) )

               (setq x (+ x 20))
               (setq y (+ y 20))
 
               (setq cc (add1 cc))

              )
)
                       

