
(prog (i x)
          (setq i 0)

     l    (setq x (fix (rnd 20)))
          (print x)
          (terpri)
          (setq i (add1 i))
          (cond ((lessp i 100) (go l))
                (T        (return 'ok))
          )
)