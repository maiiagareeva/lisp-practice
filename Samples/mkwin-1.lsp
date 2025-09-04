
(grwCreate 'w1 300 300 "Пробное окно - 1" &HFFFFFF)

(grwScale 'w1 -100 100 -100 100)

(grwSetParm 'w1 1 0 &HFFFFFF &HFF0000)

(grwShow 'w1)

(setq fi 45.0)

(for i 1 8 ((grwDraw 'w1 '(U 20 R 20)) (grwDraw 'w1 (list T fi)) (setq fi (+ fi 45.0))))





