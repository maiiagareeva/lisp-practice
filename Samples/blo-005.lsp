
(bloCreate 'buf 8000)

(filOpen 'inp "aaaaaaaa.aaa" _BINARY_READ)

(filGetBlob 'inp 'buf)

(filClose 'inp)

(for i 1 1000 ( (print i) (prints " ")(print (blo2float 'buf (+ 1 (* (- i 1) 8)) 8))(terpri) ) )

(bloDestroy 'buf)

