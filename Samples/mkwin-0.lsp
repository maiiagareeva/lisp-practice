
(grwCreate 'w1 300 300 "Пробное окно - 1" &HFFFFFF)

(grwScale 'w1 -100 100 -100 100)

(grwSetParm 'w1 3 0 &HFFFFFF &HFF0000)

(grwShow 'w1)

(grwDraw 'w1 '(U 20 R 20 M + 17 -12 E 11))

(grwCreate 'w2 300 300 "Пробное окно - 2" &HFFFFFF)

(grwScale 'w2 -100 100 -100 100)

(grwSetParm 'w2 3 0 &HFFFFFF &H0000FF)

(grwShow 'w2)

(grwDraw 'w2 '(U 20 R 20 M 17 -12 E 11))
