
(grwCreate 'w 600 600 "Несуществующий объект Пенроуза" &HFFFFFF)

(grwShow 'w)

(grwScale 'w -105 105 -105 105)

(grwSetParm 'w 3 0 &HFFFFFF) 

(prog (h0 h1 h2 w0 w1 w2 clr OX OY NX NY IX IY JX JY MX MY HX HY GX GY BX BY CX CY DX DY EX EY FX FY KX KY LX LY AX AY)

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


      (grwRect 'w JX JY NX NY &H000000)

      (grwline 'w AX AY BX BY &H000000)
      (grwline 'w BX BY CX CY &H000000)
      (grwline 'w CX CY DX DY &H000000)
      (grwline 'w EX EY FX FY &H000000)
      (grwline 'w FX FY AX AY &H000000)
      (grwline 'w DX DY EX EY &H000000)
      
      (grwFill 'w (+ FX 3) (+ FY 3) &HFFFF00 &H000000)

      (grwline 'w BX BY GX GY &H000000)
      (grwline 'w GX GY HX HY &H000000)
      (grwline 'w HX HY NX NY &H000000)
      (grwline 'w IX IY LX LY &H000000)
      
      (grwline 'w LX LY KX KY &H000000)
      (grwline 'w KX KY JX JY &H000000)
      (grwline 'w LX LY EX EY &H000000)
      (grwline 'w GX GY MX MY &H000000)

      (return 'ok)

)
