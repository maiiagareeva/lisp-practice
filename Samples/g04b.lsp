
(defun disp (w) 

   (prog (k)
       
         (setq x2 (+ x1 (* vx 3)))

         (setq y2 (+ y1 (* vy 3)))

         (grwFill 'w        // идентификатор окна
                  x1        // X точки начала заливки 
                  y1        // Y точки начала заливки
                  _WHITE    // цвет границы
                  _WHITE    // цвет заливки
         )

         (grwCircle 'w      // идентификатор окна
                    x2      // X центра
                    y2      // Y центра
                    5       // Радиус
                    _RED    // цвет
         )

         (grwFill 'w        // идентификатор окна
                  x2        // X точки начала заливки 
                  y2        // Y точки начала заливки
                  _RED      // цвет границы
                  _RED      // цвет заливки
         )

         (setq k (grwInkey 'w))

         (cond ((eq k 27)  (return k))
               ((eq k 109) (prog nil (setq vx (* 0.75 vx)) (setq vy (* 0.75 vy)) ))
               ((eq k 107) (prog nil (setq vx (* 1.25 vx)) (setq vy (* 1.25 vy)) ))

         )


         (cond ((greaterp x2 95) (setq vx (- 0 vx))))

         (cond ((greaterp y2 95) (setq vy (- 0 vy))))

         (cond ((lessp x2 -95) (setq vx (- 0 vx))))

         (cond ((lessp y2 -95) (setq vy (- 0 vy))))
      
         (setq x1 x2)

         (setq y1 y2) 

         (return Nil)

   )

)

(defun start nil (prog nil

         (grwCreate 'w 300 300 "Анимация" &HFFFFFF)

         (grwScale 'w -110 110 -110 110)

         (setq x1 0)          // начальные координаты
         (setq y1 0)          // начальные координаты

         (setq vx (rnd 10.0)) // начальные скорости
         (setq vy (rnd 10.0)) // начальные скорости

         (cond ((<= (abs vx) 0.1) (Go SetV)))
         (cond ((<= (abs vy) 0.1) (Go SetV)))

         (grwFrect 'w x1 y1 (+ x1 5) (- y1 5) &HFF0000) 

         (grwShow 'w 'disp 362 194)

         (grwDestroy 'w)

         (gc) 

                 )

)

//
// Пуск
//

(start)

(gc)



 