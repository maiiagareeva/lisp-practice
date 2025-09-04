(defun listval (f xmin xmax n) (prog (xx dx res)
                              
                                   (setq dx (/ (- xmax xmin) n))

                                   (setq xx xmin)

                               @L  
                                   (setq y (f xx))

                                   (setq res (append res (cons xx y)))

                                   (setq xx (+ xx dx))

                                   (cond ((<= xx xmax) (go @L)))

                                   (return res)
                                 )
                                    
)
