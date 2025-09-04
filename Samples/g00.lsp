
(grwCreate 'win-1 300 300 "Проба" &HEEFFEE)

(grwScale 'win-1 -10 10 -10 10)

(grwShow 'win-1)

(prog (x y) 
             (setq x -5)
             (setq y -5)
         loop 
             (grwRect 'win-1 x y (+ x 5) (+ y 5) _RED)
             (setq x (+ 0.1 x))
             (setq y (+ 0.1 y))
             (cond ((lessp x 5) (go loop))
                   (t (return 'Ok!))
             )           
)

 