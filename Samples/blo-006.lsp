
(bloCreate 'buf1 4000)

(filOpen 'inp "f0008.dbf" _BINARY_READ)

(filGetBlob 'inp 'buf1)

(filClose 'inp)

(bloDump* 'buf1 1 400)

(bloCreate 'buf2 1200)

(bloCopy 'buf1 'buf2 1 1 1200)

(bloDump* 'buf2 1 400)

(filOpen 'out "a.out" _OUTPUT)

(bloDump* 'out 'buf2)

(bloFill 'buf2 66)

(bloDump* 'out 'buf2)

(filClose 'out)

(bloDestroy 'buf1)

(bloDestroy 'buf2)
