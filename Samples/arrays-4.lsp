;;
;;  Действия с векторами и матрицами
;;
;;  Файфель Б.Л.
;;
;;


;;
;;  Создать отрезок массива (служебная функция) 
;;

(defun arrMake (n)
       (Cond ((= n 0) Nil)
             (T (cons 0.0 (arrMake (- n 1))))))
 
;;
;;  Создать вектор или матрицу
;;

(defun arrCreate (aNam iv)
       (cond ((= (length iv) 1) 
              (prog nil
                    (set aNam (cons 'Vector (cons (car iv) (arrMake (car iv)))))
                    (return T)  
              )
             )
             ((= (length iv) 2) 
              (prog nil
                   (set aNam (cons 'Matrix (cons (car iv) (cons (cadr iv) (arrMake (* (car iv) (cadr iv)))))))
                   (return T)  
              )                                             
             )
             (T Nil)
       ) 
)

;;
;; Занести элемент в вектор или матрицу 
;;

(defun arrPut (n v i) 
       (cond ((= (car (geval n)) 'VECTOR)   ;; Занести в вектор
              (cond ((<> (length i) 1) Nil)
                    ((> (car i) (cadr (geval n))) Nil)
                    ((< (car i) 1) Nil)                 
                    (T  
                       (putel (geval n) (+ (car i) 2) v) 
                    )  
              )
             )
             ((= (car (geval n)) 'MATRIX)   ;; Занести в матрицу
              (cond ((<> (length i) 2) Nil)
                    ((OR (> (car i) (cadr (geval n))) 
                         (> (cadr i) (caddr (geval n))) 
                         (< (car i) 1) (< (cadr i) 1)
                      ) Nil
                    )
                    (T
                       (prog (k)
                             (setq k (+ 3 (* (- (car i) 1) (caddr (geval n))) (cadr i) ))
                             (putEl (geval n) k v)
                             (return v) 
                       )
                    )
              )
             )
             (T Nil)
       )  
)

;;
;; Получить элемент из вектора или матрицы 
;;

(defun arrGet (n i) 
       (cond ((= (car (geval n)) 'VECTOR)
              (cond ((<> (length i) 1) Nil)
                    ((> (car i) (cadr (geval n))) Nil)
                    ((< (car i) 1) Nil)
                    (T 
                      (getel (geval n) (+ (car i) 2)) 
                    )  
              )
             )
             ((= (car (geval n)) 'MATRIX) 
              (cond ((<> (length i) 2) Nil)
                    ((OR (> (car i) (cadr (geval n))) (> (cadr i) (caddr (geval n))) 
                         (< (car i) 1) (< (cadr i) 1)) Nil 
                    )
                    (T
                        (prog (k)
                          (setq k (+ 3 (* (- (car i) 1) (caddr (geval n))) (cadr i) ))
                          (return (getEl (geval n) k))
                        )
                    )
              )
             )
             (T Nil)
       )  
)

;;
;; Печать вектора или матрицы 
;;

(defun arrPrint (N) 
       (cond ((null (eval N)) Nil)         ;; Это не массив 
             ((null (listp (eval N))) Nil) ;; Это не массив 
             ((= (car (eval N)) 'VECTOR)   ;; Печать вектора
              (prog (i)
                 (for i 1 (cadr (eval N))
                    (
                     (print N)
                     (prints "(")
                     (print i)
                     (prints ")=")
                     (printline (arrGet N (list i)))
                    )
                 )
                 (return N)
              )
             )
             ((= (car (eval N)) 'MATRIX)   ;; Печать матрицы
              (prog (i j) 
                 (for i 1 (cadr (geval N))
                    (
                     (for j 1 (caddr (geval N))  
                        (
                         (print N)
                         (prints "(") 
                         (print i)
                         (prints ",")
                         (print j)
                         (prints ")=")
                         (printline (arrGet N (list i j))  )
                        )
                     ) 
                     (terpri) 
                    )
                 )
                 (return N)
              )
             )
             (T Nil)
       )
)   

;;
;; "Умножение" массивов (для векторов - скалярное произведение;
;;  для матриц - матричное произведение)  
;;

(defun arrMult (A B C) 
    (Cond ((AND (= (car (eval A)) 'VECTOR) (= (car (eval B)) 'VECTOR)) 
           (Cond ((= (cadr (eval A)) (cadr (eval B)))
                  (prog (s i)
                        (setq s 0.0)
                        (for i 1 (cadr (geval A)) 
                           ((setq s (+ s (* (arrGet A (list i)) (arrGet B (list i))))))
                        )
                        (cond ((NULL C) (return s))
                              (T (gset c s)) 
                        )
                        (return s)
                  )
                 )
           ) 
          )                     
          ((AND (= (car (eval A)) 'MATRIX) (= (car (eval B)) 'MATRIX))
           (Cond ((= (caddr (eval A)) (cadr (eval B)))
                  (prog (s i j k)
                        (arrCreate C (list (cadr (geval A)) (caddr (geval B)))) 
                        (for i 1 (cadr (geval A))
                           (
                            (for j 1 (caddr (geval B))
                              (                  
                                (setq s 0.0)
                                (for k 1 (caddr (geval A))
                                   (
                                     (setq s (+ s (* (arrGet A (list i k)) (arrGet B (list k j)))))
                                   )
                                )
                                (arrPut C s (list i j))
                              )
                            )
                           )
                        )
                        (return T)
                  )
                 )
           )
          )
          (T Nil)
    )
)   

;;
;;  Заполнить массив 
;;

(defun arrFill (A FL) 
      (cond ((= (car (eval A)) 'VECTOR)
             (prog (i n)
                   (setq n (min (cadr (geval A)) (length Fl)))
                   (for i 1 n 
                        (
                          (arrPut A (getEl Fl i) (list i))
                        )
                   )                   
             ) 
            )
            ((= (car (eval A)) 'MATRIX)
             (prog (i n)
                   (setq n (min (length Fl) (* (cadr (geval A)) (caddr (geval A)))))
                   (for i 1 n 
                        (
                          (putEl (geval A) (+ i 3) (getEl Fl i))               
                        )
                   ) 
             ) 
            )
            (T Nil)
      )   
)

;;
;; Ресайзировать массив 
;;

(defun arrResize (A in)

       (cond ( (AND (= (car (eval A)) 'VECTOR) (= (length in) 1)) ;; ресайзирование вектора

               (prog (n i z)
                 (setq n (min (car in) (cadr (geval A))))
                 (setq z (arrMake (car in)))
                 (for i 1 n (
                              (putEl z i (getEl (geval A) (+ i 2)))
                            )
                 )
                 (gset A (cons 'VECTOR (cons (car in) z)))
                 (return T) 
               )
             )  
             ( (AND (= (car (eval A)) 'MATRIX) (= (length in) 2)) ;; ресайзирование матрицы

               (prog (n1 n2 i j k z v)
                   (setq z (arrMake (* (car in) (cadr in))))
                   (setq n1 (min (cadr (geval A)) (car in) ))
                   (setq n2 (min (caddr (geval A)) (cadr in) ))
                   (for i 1 n1 
                        (
                          (for j 1 n2 
                               (
                                 (setq v (arrGet A (list i j)))
                                 (setq k (+ (* (- i 1) (cadr in)) j ))
                                 (putEl z k v )
                               )

                          )
                        )
                   )  
                   (gset A (cons 'MATRIX (cons (car in) (cons (cadr in) z))))
                   (return T)
               )  
             ) 
             (T Nil)
       )
)

;;
;;  Вырезка из массива
;;

(defun arrCut (A in B)                        
        (cond ((= (car (eval A)) 'VECTOR)     ;; из вектора
               (prog (i j r u v)
                    (setq u (length in)) 
                    (for i 1 u
                       (
                         (setq j (getEl in i))
                         (setq v (getEl (geval A) (+ j 2)))
                         (cond ((null v) (raiseerror "Выход индекса за пределы массива")))
                         (setq r (append r (list v)))                            
                       )
                    )
                    (set B (cons 'VECTOR (cons u r)))
                    (return T)      
               )
              )
              ((= (car (eval A)) 'MATRIX)     ;; из матрицы
               (prog (rlist clist i i1 j j1 n1 n2 v)
                     (setq rlist (car in))
                     (setq clist (cadr in))
                     (setq n1 (length rlist))
                     (setq n2 (length clist))
                     (arrCreate B (list n1 n2))
                     (for i 1 n1
                          (
                            (setq i1 (getEl rlist i))
                            (for j 1 n2
                                 (
                                   (setq j1 (getEl clist j))
                                   (setq v (arrGet A (list i1 j1)))
                                   (cond ((null v) (raiseerror "Выход индекса за пределы массива")))
                                   (arrPut B v (list i j))
                                 ) 
                            )  
                          ) 
                     )
                     (return T) 
               ) 
              )
              (T Nil)
        )
)

(defun arrDestroy (A) (set A nil)) 

//
//  Тестирующие вызовы
//

//(arrCreate 'AA '(10))
//(arrFill 'AA '(11 22 33 44 55 66 -99 -88 -77))
//(arrCut 'AA '(2 4 6 3 5 7 10) 'BB)
//(arrPrint 'BB)

(arrCreate 'Z '(4 3))
(arrFill 'Z '(1 2 3 4 5 6 7 8 9 10 11 12 13))
(arrCut 'Z '((2 4) (1 3)) 'ZZ)
(arrPrint 'ZZ)
(arrCut 'Z '((1 3 4) (1 3)) 'ZZ)
(arrPrint 'ZZ)
//(arrCut 'Z '((1 3 4) (1 9)) 'ZZ)
//(arrPrint 'ZZ)

//(arrCreate 'Z '(4 3))
//(arrPut 'Z 555 '(2 2))
//(arrGet 'Z '(1 1))
//(arrGet 'Z '(2 2))
//(arrFill 'Z '(1 2 3 4 5 6 7 8 9 10 11 12 13))
//(arrPrint 'Z)
//(arrResize 'Z '(5 5))
//(arrPrint 'Z)

//(arrCreate 'Z1 '(3))
//(arrCreate 'Z2 '(3))
//(arrFill 'Z1 '(1 0 1))
//(arrFill 'Z2 '(1 0 -1))
//(arrMult 'Z1 'Z2 'ZZ)

//(arrCreate 'Q1 '(2 3))
//(arrFill 'Q1 '(1 1 1 2 2 2))
//(arrPrint 'Q1)
//(arrCreate 'Q2 '(3 4))
//(arrFill 'Q2 '(1 1 1 1 2 2 2 2 3 3 3 3))
//(arrPrint 'Q2)
//(arrMult 'Q1 'Q2 'Q3)
//(arrPrint 'Q3)

//(arrCreate 'V '(100))
//(arrFill 'V '(-9 -8 -7 -6 -5 -4 -3 -2 -1 1 2 3 4 5 6 7 8 9))
//(arrPrint 'V)

//(arrCreate 'V '(10 10))
//(arrFill 'V '(-9 -8 -7 -6 -5 -4 -3 -2 -1 1 2 3 4 5 6 7 8 9))
//(arrPrint 'V)

//(arrCreate 'B '(3 5))
//(arrFill 'B '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
//(arrPrint 'B)
//(printline '***)
//(arrResize 'B '(2 10))
//(arrPrint 'B)

(gc)
