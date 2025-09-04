

(defun bisect (fun a b eps &aux c fa fb fc)

     (setq fa (funcall fun a))

     (setq fb (funcall fun b))

     (loop

        (when (<= (abs (- b a)) eps) (return (* (+ a b) 0.5))) 

        (setq c (* 0.5 (+ a b)))

        (setq fc (funcall fun c))

        (when (<= (abs fc) eps) (return c))

        (when (AND (< fc 0) (> fa 0)) (setq b c) (setq fb (funcall fun b)))

        (when (AND (< fc 0) (> fb 0)) (setq a c) (setq fa (funcall fun a)))

        (when (AND (> fc 0) (< fb 0)) (setq a c) (setq fa (funcall fun a)))

        (when (AND (> fc 0) (< fa 0)) (setq b c) (setq fb (funcall fun b)))

     )

)
