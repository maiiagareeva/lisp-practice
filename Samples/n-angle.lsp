;;
;;  Правильный n-угольник
;;
;;  Файфель Б.Л.
;;

(defun nangle (n w c)
  (prog (i j fi)  
       (grwCreate w 500 500 "Правильный n-угольник" &HFFFFFF)
       (grwSetParm w 1 1 &HFFFFFF) 
       (grwShow w)
       (grwScale w -150 150 -150 150)
       (setq fi (/ (* 2 _pi) n))
       (iter (for i from 1 to n) (grwPset w (* 100 (cos (* i fi))) (* 100 (sin (* i fi))) c))
       (iter (for i from 1 to n)
             (iter (for j from 1 to n) (unless (= i j) 
                                         (grwLine 'w (* 100 (cos (* i fi))) (* 100 (sin (* i fi)))
                                                     (* 100 (cos (* j fi))) (* 100 (sin (* j fi)))
                                                     c))))))

(nangle 21 'w _BLUE)

