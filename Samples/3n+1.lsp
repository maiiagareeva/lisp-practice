(defun *3n+1 (n)

    (prog (r m)

  @  (printline n)

     (cond ((eq n 1) (return n)))

     (setq r (remainder n 2))

     (setq m (quotient n 2))

     (cond ((eq r 0) (setq n m))
           (t (setq n (+ (* 3 n) 1))))

     (go @) 
 
    )
)

