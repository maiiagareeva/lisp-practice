//
//  Головная программа
//

(defun main nil

   //
   //  Программа отображения диалога _Dlg_
   //

   (prog nil

      (dlgCreate '_Dlg_ 244 206 "Тест homeLisp")

      (dlgAddControl '_Dlg_ '_BUT_1 _BUTTON 8 7 219 52 '("Tahoma" 8,25 1 0 0) "Комплексный графический тест")

      (dlgAddControl '_Dlg_ '_BUT_2 _BUTTON 10 63 218 52 '("Tahoma" 8,25 1 0 0) "Комплексный COM-тест")

      (dlgAddControl '_Dlg_ '_BUT_3 _BUTTON 10 122 218 51 '("Tahoma" 8,25 1 0 0) "Завершение работы")

      //
      // Обработчик события CLICK для кнопки _BUT_1
      //

      (defun _BUT_1_Click  Nil 

              (prog nil

                    (dlgHide '_dlg_)
                    (graph 'd)
                    (dlgShow '_dlg_) 

              ) 

      )

      //
      //   Назначение процедуры-события _BUT_1_Click  контролу _BUT_1
      //

      (dlgSetEvent '_BUT_1 '_BUT_1_Click )


      //
      // Обработчик события CLICK для кнопки _BUT_2
      //

      (defun _BUT_2_Click  Nil 

              (prog nil

                    (dlgHide '_dlg_)
                    (start_Excel)
                    (dlgShow '_dlg_) 

              ) 

      )

      //
      //   Назначение процедуры-события _BUT_2_Click  контролу _BUT_2
      //

      (dlgSetEvent '_BUT_2 '_BUT_2_Click )


      //
      // Обработчик события CLICK для кнопки _BUT_3
      //

      (defun _BUT_3_Click  Nil 

              (prog nil
                    (dlgHide '_dlg_)
                    //(dlgDestroy '_dlg_)
                    //(exit)
              )  

      )

      //
      //   Назначение процедуры-события _BUT_3_Click  контролу _BUT_3
      //

      (dlgSetEvent '_BUT_3 '_BUT_3_Click )

      //
      //   Отображение диалога _Dlg_
      //

      (dlgShow '_Dlg_)

   )

)

//
//   Запуск Excel
//

(defun start_Excel nil

       (prog (i j) 

           (comCreateObject 'xls "Excel.Application")

           (comPropGetO 'xls "WorkBooks" 'workbooks)

           (comPropLet 'xls "Visible" -1)

           (comPropLet 'xls "displayalerts" 0)

           (comMethodO 'workbooks "ADD" 'wb)

           (compropGetO 'wb "Sheets" 'Sht 1)


           (compropGetO 'Sht "cells" 'cell 1 1)

           (comPropLet 'cell "Value" 5)

           (comDestroyObject 'cell)


           (compropGetO 'Sht "cells" 'cell 1 2)

           (comPropLet 'cell "Value" 10)

           (comDestroyObject 'cell)


           (compropGetO 'Sht "cells" 'cell 1 3)

           (comPropLet 'cell "Value" 15)

           (comDestroyObject 'cell)


           (comPropGetO 'Sht "range" 'range "A1:C1")

           (comMethod 'range "select")


           (comPropGetO 'xls "charts" 'charts)

           (comMethodO 'charts "ADD" 'chart)

           (comPropLet 'chart "Type" -4100)

           (setq j 5)

           (for i 1 36 (
                         (comPropLet 'chart "Rotation" j)
                         (setq j (+ j 5)) 
                         (sleep* 200)
                       )
           )

           (for i 1 36 (
                         (comPropLet 'chart "Rotation" j)
                         (setq j (- j 5)) 
                         (sleep* 200)
                       )
           )

          (comMethod 'xls "quit")

          (comDestroyObject 'wb)

          (comDestroyObject 'Sht)

          (comDestroyObject 'xls)

          (comDestroyObject 'charts)

          (comDestroyObject 'chart)

          (comDestroyObject 'range)

          (comDestroyObject 'workbooks)

       )

)


//
//    Организующая программа
//

(defun graph (w) (prog (n u z) 

                      (grwCreate w 600 400 "Комплексный графический тест" &HFFFFFF)
              
                      (grwShow w)

                      (setq z 1) 

                     L@ (setq z (menu w '(" Треугольники   " 
                                          "     Круги      "
                                          "    Эллипсы     " 
                                          "     Точки      "
                                          "     Боксы      " 
                                          "      Муар      " 
                                          " Прямоугольники "
                                          "     Спирали    " 
                                          "  Цветные соты  "
                                          " Не может быть! " )
                              z )
                        )

                      (cond ((eq z 1) (setq u (triangle w)))
                            ((eq z 2) (setq u (fillcirc w)))
                            ((eq z 3) (setq u (ellipse w)))
                            ((eq z 4) (setq u (points w)))
                            ((eq z 5) (setq u (fboxes w)))
                            ((eq z 6) (setq u (muar w)))
                            ((eq z 7) (setq u (rect w)))
                            ((eq z 8) (setq u (spiral w)))
                            ((eq z 9) (setq u (honey w)))
                            ((eq z 10) (setq u (penrose w)))
                            ( T       (go E@))
                      )

                      (gc)

                      (go L@)

                   E@ (grwDestroy w)
                      (return u)
                 )
)    

//
//  Несуществующий объект
//

(Defun penrose (w)

(prog (h0 h1 h2 w0 w1 w2 clr OX OY NX NY IX IY JX JY MX MY HX HY GX GY BX BY CX CY DX DY EX EY FX FY KX KY LX LY AX AY)

      (grwCls w)

      (grwScale w -105 105 -105 105)

      (grwSetParm w 1 0 &HFFFFFF) 

      (setq clr &HCCCCCC)

      (setq OX 0)

      (setq OY 0)

      (setq h0 25)
  
      (setq h1 25)

      (setq h2 25)

      (setq w0 20)

      (setq w1 20)

      (setq w2 20)

      (setq NX (+ w0 OX))

      (setq NY (- OY h0))

      (setq IX (+ w0 OX))

      (setq IY (+ h0 OY)) 

      (setq Jx (- OX w0))
 
      (setq JY (+ h0 OY))
 
      (setq MX (- OX W0)) 

      (setq MY (- OY h0))

      (setq HX (+ W0 OX)) 

      (setq HY (- OY h0 h1))

      (setq GX (- OX w0 w1))     

      (setq GY (- OY h0 h1))

      (setq BX (- OX w0 w1))

      (setq BY (+ h0 h1 h2 OY))
  
      (setq CX (+ w0 w1 w2 OX))

      (setq CY (+ h0 h1 h2 OY))

      (setq DX (+ w0 w1 w2 OX))

      (setq DY HY) 

      (setq EX (+ w0 w1 OX))
 
      (setq EY (- OY h0 h1 h2))  

      (setq FX (- OX w0 w1 w2))

      (setq FY (- OY h0 h1 h2)) 

      (setq AX FX)

      (setq AY (+ OY h0 h1)) 

      (setq KX JX)
 
      (setq KY AY)

      (setq LX EX)

      (setq LY AY)


      (grwRect w JX JY NX NY &H000000)

      (grwline w AX AY BX BY &H000000)
      (grwline w BX BY CX CY &H000000)
      (grwline w CX CY DX DY &H000000)
      (grwline w EX EY FX FY &H000000)
      (grwline w FX FY AX AY &H000000)
      (grwline w DX DY EX EY &H000000)
      
      (grwFill w (+ FX 3) (+ FY 3) &HFFFF00 &H000000)

      (grwline w BX BY GX GY &H000000)
      (grwline w GX GY HX HY &H000000)
      (grwline w HX HY NX NY &H000000)
      (grwline w IX IY LX LY &H000000)
      
      (grwline w LX LY KX KY &H000000)
      (grwline w KX KY JX JY &H000000)
      (grwline w LX LY EX EY &H000000)
      (grwline w GX GY MX MY &H000000)

      (grwPrint w -45 90 "Несуществующий объект Пенроуза" &H0000FF)  

@Inkey 

      (setq k (grwInkey w))

      (cond ((eq k 27) (go @Ret)))

      (go @Inkey)

@Ret  (grwSavePic w 1 "penrose.gif")
      (return 'ok) 

)


)


//
//  Соты
//

(Defun honey (w)

(prog (r fi z hx hy vx vy n hxx hyy m cx cy k Om x y r g b cf)  

      (grwCls w) 

      (grwScale w -100 100 -100 100)

      (setq r 10)
      (setq fi (/ _pi 3))
      (setq z 8)  

      (setq hx (* r (sqr 3.0)))
      (setq hy 0)
 
      (setq vx (* r (sqr 3.0) (cos fi)))

      (setq vy (* r (sqr 3.0) (sin fi)))

      (for n (- 0 Z) z   

           ( 

              (setq hxx (* hx n))
              (setq hyy (* hy n))

              (for m (- 0 Z) z   

                   (

                       (setq vxx (* vx m))
                       (setq vyy (* vy m))

                       (setq cx (+ vxx hxx))
                       (setq cy (+ vyy hyy))

                       (setq k 0)

                       (setq Om (* 0.5 Fi))

                  L    (cond ((eq k 0) (grwPset w 
                                                (+ cx (* r (cos Om)))
                                                (+ cy (* r (sin Om)))
                                                &H000000))
                             (T        (grwLine w 
                                                (+ cx (* r (cos Om)))
                                                (+ cy (* r (sin Om)))
                                                nil nil 
                                                &H000000))
                       )
  
                       (setq k -1)                              

                       (setq Om (+ Om Fi))

                       (cond ((lessp Om (+ (* 2.0 _pi) Fi)) (Go L)))

                 
                   ))

           ))

     @L      

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cf (fix2bit (+ b (* 256 g) (* 65536 r))))

          (setq x (+ -100 (rnd 200)))
          (setq y (+ -100 (rnd 200)))
           
          (grwFill w x y cf &H000000) 

          (setq k (grwInkey w))

          (cond ((eq k 27) (go @Ret)))
        
          (go @L)
  
     @Ret (grwSavePic w 1 "honey.gif")

          (return 'ok)

)

)

//
//  Спирали
//

(defun spiral (w) (prog (r g b c p fi ff x y k x0 y0 j)

                        (grwCls w)
 
                        (grwScale w -100 100 -100 100)

                   L0

                        (setq r (rnd 255))
                        (setq g (rnd 255))
                        (setq b (rnd 255))

                        (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))

                        (setq x0 (- (rnd 200.0) 100))

                        (setq y0 (- (rnd 200.0) 100))

                        (setq p 0)

                        (setq fi 0.0)

                   L1

                        (setq k (grwInkey w))

                        (cond ((eq k 27) (go Ret)))

                        (setq FF (/ (* Fi _Pi) 180.0))  

                        (setq y (+ y0 (* (sin FF) FF)))

                        (setq x (+ x0 (* (cos FF) FF)))
 
                        (cond ((eq p 0) (grwPset w x y c))
                              (T        (grwLine w x y nil nil c))
                        )
      
                        (setq p 1) 
     
                        (setq fi (+ fi 10.0))       

                        (cond ((lessp fi (* 360 3)) (go L1))) 

                        (go L0)

                    Ret (gc) (return 'ok) 

                )

)

//
//  Рисование прямоугольников
//

(defun rect (w)  (prog (r g b i x y ww hh)
 
                    (grwCls w)

                    (grwScale w 0 100 0 100) 

                    (setq i 300)

                 L 

                    (setq k (grwInkey w))

                    (cond ((eq k 27) (go Ret)))

                    (setq x (rnd 100))
                    (setq y (rnd 100))
                    (setq ww (rnd 30))
                    (setq hh (rnd 30))
                    (setq r (rnd 255))
                    (setq g (rnd 255))
                    (setq b (rnd 255))
       
                    (grwRect w x y (+ x ww) (+ y hh) (fix2bit (+ b (* 256 g) (* 65536 r))))

                    (setq i (sub1 i))

                    (cond ((eq i 0) (go Ret)))

                    (go L)

                Ret (gc) 

                    (grwSavePic w 1 "rect.gif")

                    (return 'ok!)


))

//
//  Рисование кругов
//

(defun fillcirc (w) 

      (prog (r g b i x y ww hh c rr k)

            (grwScale w 0 100 0 100) 

            (grwCls w) 

            (setq i 300)

      L
            (setq k (grwInkey w))
            (cond ((eq k 27) (return 'ok!)))

            (setq x (rnd 100))
            (setq y (rnd 100))
            (setq rr (rnd 30))
            (setq r (rnd 255))
            (setq g (rnd 255))
            (setq b (rnd 255))

            (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))

            (grwSetParm w 1 0 c)
       
            (grwcircle w x y rr c)

            (setq i (sub1 i))

            (cond ((eq i 0) (go Ret)))

            (go L)

       Ret
            (grwSavePic w 1 "circles.gif")

            (return 'ok!) 

     )

)

//
//  Рисование заполненных боксов
//

(defun fboxes (w)

(prog (r g b i x y ww hh k)

      (grwScale w 0 100 0 100) 

      (grwCls w)

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq ww (rnd 30))
      (setq hh (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwFrect w x y (+ x ww) (+ y hh) (fix2bit (+ b (* 256 g) (* 65536 r))))

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (Go Ret)))

      (go L)

  Ret
      (grwSavePic w 1 "boxes.gif")

      (return 'ok!) 

)

)

//
//  Рисование эллипсов
//

(defun ellipse (w)

(prog (r g b i x y ww hh c aa k)

      (grwScale w 0 100 0 100) 

      (grwCls w)

      (setq i 300)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq rr (rnd 30))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
      (setq aa (rnd 2.0))

      (cond ((lessp aa 0.001) (setq aa 0.3)))  

      (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))

      (grwSetParm w 1 0 c)
       
      (grwellipse w x y rr c aa)

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (go Ret)))

      (go L)

  Ret
      (grwSavePic w 1 "ellipses.gif")

      (return 'ok!) 

))

//
//  Рисование цветных точек
//

(defun points (w)

(prog (r g b i x y k)

      (grwScale w 0 100 0 100) 

      (grwSetParm w 3 nil nil)

      (grwCls w)

      (setq i 800)

   L  (setq x (rnd 100))
      (setq y (rnd 100))
      (setq r (rnd 255))
      (setq g (rnd 255))
      (setq b (rnd 255))
       
      (grwPset w x y (fix2bit (+ b (* 256 g) (* 65536 r))))

      (setq k (grwInkey w))

      (cond ((eq k 27) (return 'ok!)))

      (setq i (sub1 i))

      (cond ((eq i 0) (go Ret)))

      (go L)

  Ret
      (grwSavePic w 1 "points.gif")

      (return 'ok!) 


))

//
//  Рисование треугольников
//

(defun triangle (w) 

(prog (x1 y1 x2 y2 x3 y3 r g b cb cf rr1 rr2 rr3 xm ym xx yy i)  

      (grwScale w 0 640 0 480)

      (grwCls w) 

      (setq i 0) 

      beg_loop

          (setq x1 (rnd 640))
          (setq y1 (rnd 480))

          (setq x2 (rnd 640))
          (setq y2 (rnd 480))

          (setq x3 (rnd 640))
          (setq y3 (rnd 480))

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cb (fix2bit (+ b (* 256 g) (* 65536 r))))

          (setq r (rnd 255))
          (setq g (rnd 255))
          (setq b (rnd 255))

          (setq cf (fix2bit (+ b (* 256 g) (* 65536 r))))

          (setq rr1 (sqr (+ (^ (- x1 x2) 2) (^ (- y1 y2) 2))))
          (setq rr2 (sqr (+ (^ (- x2 x3) 2) (^ (- y2 y3) 2))))
          (setq rr3 (sqr (+ (^ (- x1 x3) 2) (^ (- y1 y3) 2))))

          (cond ((lessp (+ rr1 rr2) rr3) (go beg_loop)))
          (cond ((lessp (+ rr1 rr3) rr2) (go beg_loop)))
          (cond ((lessp (+ rr2 rr3) rr1) (go beg_loop)))

          (cond ((lessp (- (+ rr1 rr2) rr3) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr1 rr3) rr2) 0.001) (go beg_loop)))
          (cond ((lessp (- (+ rr2 rr3) rr1) 0.001) (go beg_loop)))

          (grwLine w x1 y1 x2 y2 cb)
 
          (grwLine w x2 y2 x3 y3 cb)

          (grwLine w x3 y3 x1 y1 cb)

          (setq xm (* 0.5 (+ x2 x3)))
          (setq ym (* 0.5 (+ y2 y3)))
 
          (setq xx (* 0.5 (+ x1 xm)))
          (setq yy (* 0.5 (+ y1 ym)))

          (grwFill w xx yy cf cb)

          (setq k (grwInkey w))

          (cond ((eq k 27) (return 'ok!)))

          (setq i (add1 i))

          (cond ((lessp i 100) (go beg_loop)))  

          (grwSavePic w 1 "triangles.gif")

          (return 'ok!)          

))

//
//  Рисование муара
//

(defun muar(w)

      (prog (nline wi dx qx c x1 x2 i k)

            (grwCls w)

            (grwSetParm w 1 nil nil)

            (grwScale w 0 640 0 480)

            (setq nline 213)

            (setq wi (/ 640.0 3.0))

            (setq dx (/ Wi nline))

            (setq qx (/ 640.0 nline))

       L0   (setq r (rnd 255))
            (setq g (rnd 255))
            (setq b (rnd 255))
            (setq c (fix2bit (+ b (* 256 g) (* 65536 r))))
      
            (setq i 1) 

       L1

            (setq k (grwInkey w))

            (cond ((eq k 27) (go Ret)))

            (setq x1 (+ Wi (* dx (- i 1))))

            (setq x2 (* qx (- i 1)))

            (grwLine w x1 1 x2 479 c)     

            (grwLine w x1 479 x2 1 c)     

            (setq i (add1 i))      

            (cond ((lessp i nline) (go L1)))

            (go L0)

       Ret
            (gc) 

            (grwSavePic w 0 "muar.gif")

            (return 'ok!) 

))


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

             (grwFont w "FIXEDSYS" 12 nil nil)
                      
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

(main)

//
//  Конец
//
