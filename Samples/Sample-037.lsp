
//
// Наибольший общий делитель
//

(defun *gcd (x y) (cond 
                      ((eq y 0) nil)
                      (T
                         (prog (xx yy r)
                               (setq xx x)
                               (setq yy y)
                          loop
                               (setq r (remainder xx yy))
                               (cond ((eq r 0) (return yy)))
                               (setq xx yy)
                               (setq yy r)
                               (go loop)
                         )          
                      )
                  )
)

//
// Сократить дробь
//

(defun  simplify (x) (prog (num denom g)
                      (setq num (car x))
                      (setq denom (cadr x))
                      (setq g (*gcd num denom))
                      (cond ((eq g 1) (return (list num denom)))
                            (T (return (list (\ num g) (\ denom g))))
                      )
                     )
)

//
// Сложить две дроби
//

(defun r_add (x y) (simplify (list (+ (* (cadr y) (car x)) (* (cadr x) (car y))) (* (cadr x) (cadr y)))))
 
//
// Вывести дробь
//

(defun r_out (x) (prog (tmp)
                       (setq tmp (simplify x)) 
                       (cond ((= (car tmp) 0)  (print 0))
                             ((= (cadr tmp) 1) (print (car tmp)))
                             ((> (car tmp) (cadr tmp)) (prog (cc) (setq cc (\ (car tmp) (cadr tmp))) (print cc) (prints " ") (r_out (simplify (list (- (car tmp) (* cc (cadr tmp))) (cadr tmp) )))))    
                             (T  (prog nil (print (car tmp)) (print '/) (print (cadr tmp)))) 
                       )
                       (return tmp)
 
                 )
)

//
// 3n+1
//

(defun *3n+1 (n) (prog (r m)

                 loop   

                    (print n) (terpri)

                    (cond ((eq n 1) (return n)))

                    (setq r (remainder n 2))

                    (setq m (quotient n 2))

                    (cond ((eq r 0) (setq n m))
                          (t (setq n (+ (* 3 n) 1))))

                    (go loop) 
 
                 )
)
