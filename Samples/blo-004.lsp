
(bloCreate 'buf 8000)

(setq z 1.0)

(for i 1 1000 ( (float2blo 'buf z (+ 1 (* (- i 1) 8)) 8) (setq z (add1 z))) )

(filOpen 'out "aaaaaaaa.aaa" _BINARY_WRITE)

(filPutBlob 'out 'buf)

(filClose 'out)

(bloDestroy 'buf)

