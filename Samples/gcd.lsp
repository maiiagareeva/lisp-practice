
(defun *gcd (x y) (cond ((eq x y)                x)
                        ((greaterp y x) (*gcd y x))
                        ((eq (remainder x y) 0)  y)
                        (T              (*gcd y (remainder x y)))))