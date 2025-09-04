
(bloCreate 'buf 1600)

(filOpen 'inp "f8.bin" 5)

(filGetBlo 'inp 'buf)

(prog (i)

      (for i 1 20
                  (
                    (print (blo2flo 'buf (+ 1 (* (- i 1) 8)) 8))
                    (terpri)
                  )
      )

)

(filClose 'inp)

(bloDestroy 'buf)

 

 