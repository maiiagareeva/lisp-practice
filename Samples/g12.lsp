
(grwCreate 'w 500 550 "Двадцатиугольник" &HEEEEEE)

(grwSetParm 'w 2 1 &HFFFFFF) 

(grwShow 'w)

(prog (i j fi)  

      (grwScale 'w -150 150 -150 150)

      (setq fi (/ _pi 10))

      (for i 1 20 
                
           (
              (grwPset 'w (* 100 (cos (* i fi))) (* 100 (sin (* i fi))) &HFF0000)
           ) 
       )

       (for i 1 20

           (

             (for j 1 i

                 (
                   (cond ((not (eq i j)) (grwLine 'w (* 100 (cos (* i fi))) (* 100 (sin (* i fi))) (* 100 (cos (* j fi))) (* 100 (sin (* j fi))) &HFF0000) ))
                  )

             ))   

       )

)

(gcd)




 



