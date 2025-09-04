(defun getCode (w)

       (prog (k)

  @Get  (setq k (grwInkey w))

        (sleep* 20)

        (cond ((= k 0) (go @Get)))

        (return k)
       )

)

(grwCreate 'w 200 200 "Тестовое окно" &HDDDDEE)

(grwShow 'w 'getCode 100 100)

