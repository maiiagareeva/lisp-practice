;;
;;  Рациональная арифметика
;;
;;  Файфель Б.Л.
;;

;;
;; Наибольший общий делитель
;;

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

;;
;; Сократить дробь
;;

(defun  simplify (x) (prog (num denom g sgn)
                      (setq denom (cadr x))
                      (cond ((= denom 0) (raiseerror "Знаменатель равен нулю!")))
                      (setq num (car x))
                      (setq sgn 1)
                      (cond ((And (< num 0) (> denom 0)) (setq sgn -1))
                            ((And (> num 0) (< denom 0)) (setq sgn -1))
                            ((= num 0) (setq denom 1))
                      )
                      (setq num (abs num))
                      (setq denom (abs denom))
                      (setq g (*gcd num denom))
                      (cond ((eq g 1) (return (list (* num sgn) denom)))
                            (T (return (list (\ (* num sgn) g) (\ denom g))))
                      )
                     )
)

;;
;; Создать рациональное
;;

(defun ratCreate (num denom) (cons 'RATIONAL (simplify (list num denom))))

;;
;; Сложить две дроби
;;

(defun ratAdd (x y) (cond ((<> (car x) 'RATIONAL) Nil)
                         ((<> (car y) 'RATIONAL) Nil) 
                         (T (cons 'RATIONAL 
                                  (simplify (list (+ (* (caddr y) (cadr x))
                                                     (* (caddr x) (cadr y))
                                                  )
                                                  (* (caddr x) (caddr y)))
                                  )
                            )
                         )
                    )
)

;;
;; Вычесть две дроби
;;

(defun ratSub (x y) (cond ((<> (car x) 'RATIONAL) Nil)
                         ((<> (car y) 'RATIONAL) Nil) 
                         (T (cons 'RATIONAL 
                                  (simplify (list (- (* (caddr y) (cadr x)) 
                                                     (* (caddr x) (cadr y))
                                                  )
                                                  (* (caddr x) (caddr y)))
                                  )
                             )
                         )
                    )
)

;;
;; Перемножить дроби
;;

(defun ratMult (x y) (cond ((<> (car x) 'RATIONAL) Nil)
                           ((<> (car y) 'RATIONAL) Nil) 
                           (T (cons 'RATIONAL
                                    (simplify (list (* (cadr x) (cadr y))
                                                    (* (caddr x) (caddr y))
                                              )
                                    )                               
                              )
                           ) 
                     )
)

;;
;; Разделить дроби
;;

(defun ratDiv (x y) (cond ((<> (car x) 'RATIONAL) Nil)
                          ((<> (car y) 'RATIONAL) Nil) 
                          (T (cons 'RATIONAL
                                   (simplify (list (* (cadr x) (caddr y))
                                                   (* (caddr x) (cadr y))
                                             )
                                   )                               
                             )
                          ) 
                    )
)

;;
;; Обратить дробь
;;

(defun ratInv (x) (cond ((<> (car x) 'RATIONAL) Nil)
                        (T (cons 'RATIONAL (simplify (list (caddr x)
                                                           (cadr x)
                                                     )
                                           )
                           )
                        )
                  )
)

;;
;; Вывести дробь
;;

(defun ratPrint (x) (cond ((<> (car x) 'RATIONAL) Nil)
                          (T
                            (prog (tmp sgn)
                             (setq tmp (simplify (cdr x))) 
                             (cond ((< (car tmp) 0) (prints "-")))
                             (setq tmp (cons (abs (car tmp)) (cdr tmp)))
                             (cond ((= (car tmp) 0)  (printline 0))
                                   ((= (cadr tmp) 1) (printline (car tmp)))
                                   ((> (car tmp) (cadr tmp)) 
                                       (prog (cc) 
                                             (setq cc (\ (car tmp) (cadr tmp))) 
                                             (print cc)
                                             (ratPrint (cons 'RATIONAL (simplify (list (- (car tmp) (* cc (cadr tmp)))
                                                                                       (cadr tmp) 
                                                                                 )
                                                                       )
                                                       )
                                             )  
                                       )
                                   )    
                                   (T 
                                       (prog Nil 
                                             (prints "(") 
                                             (print (car tmp)) 
                                             (print '/) 
                                             (print (cadr tmp))
                                             (printsline ")") 
                                        )
                                   ) 
                             )
                             (return T)
                            )
                          )
                    )
)

(defun rat2flo (x) (cond ((<> (car x) 'RATIONAL) Nil)
                         (T (/ (cadr x) (caddr x)))
                   )
) 

;;
;; Тестирующие вызовы 
;;

(setq A (ratCreate 6 14))
(setq B (ratCreate 48 15))
(ratPrint (ratAdd A B))
(setq A (ratCreate 1 2))
(setq B (ratCreate 1 3))
(ratPrint (ratSub A B))
(terpri)
(ratPrint (ratInv B))
