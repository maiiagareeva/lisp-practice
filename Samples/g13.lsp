
(grwCreate 'w 300 300 "����� ������" &HAADDFF)

(grwSetParm 'w 1 0 nil &HFF0000)

(grwShow 'w)

(setq y 1)
(setq z 8)

(for i 1 10 ( (grwFont 'w "Tahoma" z T T)(grwPrint 'w 1 y "�����")(setq y (+ y 20)) (setq z (+ z 1) )))

 