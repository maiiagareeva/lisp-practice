
(grwCreate 'w1 300 300 "Пробное окно - 1" &HFFFFFF)

(grwScale 'w1 -100 100 -100 100)

(grwSetParm 'w1 1 0 &HFFFFFF &HFF0000)

(grwShow 'w1)

(setq fi 60.0)

(grwDraw 'w1 '(C &H0000FF))

(for i 1 6 ((grwDraw 'w1 '(U 20 R 20)) (grwDraw 'w1 (list T fi)) (setq fi (+ fi 60.0))))

(grwDraw 'w1 '(M -7 30 P &HEE88AA &H0000FF))


//


(grwCreate 'w2 300 300 "Пробное окно - 2" &HFFFFFF)

(grwScale 'w2 -100 100 -100 100)

(grwSetParm 'w2 1 0 &HFFFFFF &H0000FF)

(grwShow 'w2)

(setq fi 20.0)

(grwDraw 'w2 '(M 50 -60))

(for i 1 18 ((grwDraw 'w2 '(U 20 R 20)) (grwDraw 'w2 (list T fi)) (setq fi (+ fi 20.0))))

(grwDraw 'w2 '(M 0 0 P &H6688AA &H0000FF))

 



