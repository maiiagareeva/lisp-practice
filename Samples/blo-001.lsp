
(bloCreate 'buf 400)

(filOpen 'inp "lispik.exe" 5)

(filGetBlo 'inp 'buf)

(blo2fix 'buf 4 4)

(bloDump* 'buf 1 400)


 