
(defun ifact (n) (prog (i r)

                       (setq r 1)

                       (setq i 2)

              @Loop    (setq r (* r i))

                       (setq i (add1 i))

                       (cond ((<= i n) (go @Loop)))

                       (return r)
                   )
) 