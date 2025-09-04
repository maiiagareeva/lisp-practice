;;
;;  Комплексные числа
;;
;;  Файфель Б.Л.
;;


;;
;;  Создать комплексное число
;;

(defun cplxCreate (x y) (cons 'COMPLEX (list x y)))

;;
;;  Действительная часть комплексного числа
;;

(defun cplxRe (x) (cond ((<> (car x) 'COMPLEX) Nil)
                        (T (cadr x))
                  )
)

;;
;;  Мнимая часть комплексного числа
;;

(defun cplxIm (x) (cond ((<> (car x) 'COMPLEX) Nil)
                        (T (caddr x))
                  )
)

;;
;;  Сопряжение
;;

(defun cplxConj (x) (cond ((<> (car x) 'COMPLEX) Nil)
                        (T (cons 'COMPLEX (list (cadr x) (- (caddr x))))
                        )
                  )
)

;;
;; Модуль
;;

(defun cplxAbs (x) (cond ((<> (car x) 'COMPLEX) Nil)
                         (T (sqr (+ (* (cadr x) (cadr x)) (* (caddr x) (caddr x)))))  
                   )
)

;;
;; Аргумент
;;

(defun cplxArg (x) (cond ((<> (car x) 'COMPLEX) Nil)
                         (T 
                            (cond ((<= (abs (cadr x)) 0.1E-16) (* 0.5 _Pi (sign (caddr x))))
                                  (T (atn (/ (caddr x) (cadr x))))
                            )
                         )  
                   )
)

;;
;;  Сложение 
;;

(defun cplxAdd (x y) (cond ((<> (car x) 'COMPLEX) Nil)
                           ((<> (car y) 'COMPLEX) Nil)
                           (T (cplxCreate (+ (cadr x) (cadr y)) (+ (caddr x) (caddr y))))
                     ) 
)

;;
;;  Вычитание 
;;

(defun cplxSub (x y) (cond ((<> (car x) 'COMPLEX) Nil)
                           ((<> (car y) 'COMPLEX) Nil)
                           (T (cplxCreate (- (cadr x) (cadr y)) (- (caddr x) (caddr y))))
                     ) 
)

;;
;;  Умножение 
;;

(defun cplxMult (x y) (cond ((<> (car x) 'COMPLEX) Nil)
                           ((<> (car y) 'COMPLEX) Nil)
                           (T (cplxCreate (- (* (cadr x) (cadr y)) (* (caddr x) (caddr y)))
                                          (+ (* (cadr x) (caddr y)) (* (caddr x) (cadr y))))
                           )                            
                     ) 
)

;;
;;  Деление
;;

(defun cplxDiv (x y) (cond ((<= (cplxAbs y) 0.1E-15) (raiseerror "cplxDiv: Деление на нуль"))
                           (T
                              (prog (d Z)
                                (setq d (+ (* (cadr y) (cadr y)) (* (caddr y) (caddr y))))
                                (setq Z (cplxMult x (cplxConj y)))
                                (return (cons 'COMPLEX (list (/ (cadr Z) d) (/ (caddr z) d)))) 
                              )
                           )
                     )  
)

;;
;;  Печать
;;

(defun cplxPrint (x) (cond ((<> (car x) 'COMPLEX) Nil)
                        (T  
                           (cond ((<= (+ (abs (cadr x)) (abs (caddr x))) 0.1E-16) (printline 0))
                                 ((<= (abs (cadr x)) 0.1E-16) (prog nil (print (caddr x)) (printline '*I)))
                                 ((<= (abs (caddr x)) 0.1E-16) (printline (cadr x)))
                                 (T  
                                    (cond ((> (caddr x) 0) (prog nil (print (cadr x)) (prints "+") (print (caddr x)) (printline '*I) ))
                                          ((< (caddr x) 0) (prog nil (print (cadr x)) (print (caddr x)) (printline '*I)))
                                    )        
                                 )
                           )
                        )
                     )
)

;;
;;  Тестирующие вызовы
;;

(setq Z1 (cplxCreate 0 1))
(setq Z0 (cplxCreate 1 0))

(cplxPrint (cplxMult Z1 Z1))
(cplxPrint (cplxDiv Z0 Z1))

(setq Q1 (cplxCreate 1 1))
(setq Q2 (cplxCreate 1 -1))
(cplxPrint (cplxDiv Q1 Q2))



