
//
//   Дать n-й элемент массива
//

(defun item (array index) (prog (i c tmp)
                                (setq i 1)
                                (setq tmp array)
                          @L    (setq c (car tmp))
                                (cond ((eq i index) (return c)))
                                (setq i (add1 i))
                                (setq tmp (cdr tmp))
                                (go @L)
                          )
)          

//
//  Гафическое меню
//

(defun menu (w mnu nn)

       (prog (ww hh x y a n sz color)

             (setq sz (length mnu))

             (grwSetParm w 2 1 &HFFFFFF) 

             (grwScale w -150 150 -150 150)

             (grwCls w)

             (grwFont w "FIXEDSYS" 12 T nil)
                      
             (setq hh (grwTextH w (item mnu 1)))

             (setq ww (grwTextW w (item mnu 1)))

             (setq x (+ -150 (* (- 300 ww) 0.5)))

             (setq y (* 0.5 sz hh))

             // Рисуем начальное положение

             (for j 1 sz
             
                  (
                     (setq color (cond ((eq j nn) &HFF0000)
                                       (T         &H000000)
                                 )
                      )

                     (grwPrint w x (- y  (* (- j 1) hh))  (item mnu j) color)                      

                  )
              )

             // Обработка клавиатурного ввода 

             (setq n nn)

             (setq a (prog (k)

              @Inkey (setq k (grwInkey w))

                     (cond ((eq k 27) (return 0)))

                     (cond ((eq k 13) (return n)))

                     (cond ((eq k 38) (prog nil (setq n (sub1 n)) (cond ((eq n 0) (setq n sz))))))

                     (cond ((eq k 40) (prog nil (setq n (add1 n)) (cond ((eq n (add1 sz)) (setq n 1))))))

                     (cond ((eq k 0)(go @inkey)))

                     // Рисуем текущее положение

                     (for j 1 sz
             
                          (
                             (setq color (cond ((eq j n) &HFF0000)
                                               (T        &H000000)
                                         )
                             )

                             (grwPrint w x (- y  (* (- j 1) hh))  (item mnu j) color)                      

                          )
                     )

                     (go @Inkey)

                  )

             )

             (return a)
                
       )

)


//

(grwCreate 'w 300 300 "Меню" &HFFFFFF)

(grwShow 'w)

(menu 'w  
      '("Треугольники"
        "   Круги    "
        "  Эллипсы   "
        "   Точки    "
        "   Боксы    "
        "   Муар     ")
      1
)

(grwDestroy 'w)


    




