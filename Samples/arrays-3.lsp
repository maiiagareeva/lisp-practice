
//
//  Создать отрезок массива (служебная функция) ###############
//

(defun arrMake (n)
       (Cond ((= n 0) Nil)
             (T (cons 0.0 (arrMake (- n 1))))))
 
//
//  Создать вектор или матрицу
//

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

//
// Занести элемент в вектор или матрицу ###############
//

(defun arrPut (n v i) (cond ((= (car (geval n)) 'VECTOR)   // Занести в вектор
                            (cond ((<> (length i) 1) Nil)
                                  ((> (car i) (cadr n)) Nil)
                                  ((< (car i) 1) Nil)                 
                                  (T  
                                      (prog (k j z)
                                            (setq k (- (car i) 1))
                                            (setq z (geval n))
                                            (setq z (cddr z))
                                            (for j 1 k ((setq z (cdr z)))) 
                                            (rplaca z v)
                                            (return v)
                                      )
                                   )  
                             )
                            )
                            ((= (car (geval n)) 'MATRIX)   // Занести в матрицу
                            (cond ((<> (length i) 2) Nil)
                                  ((OR (> (car i) (cadr (geval n))) 
                                       (> (cadr i) (caddr (geval n))) 
                                       (< (car i) 1) (< (cadr i) 1)
                                   ) Nil)
                                   (T
                                     (prog (k j z) 
                                        (setq k (+ (* (- (car i) 1) (caddr (geval n))) (cadr i) -1))
                                        (setq z (geval n))
                                        (setq z (cdddr z)) 
                                        (for j 1 k ((setq z (cdr z)))) 
                                        (rplaca z v)
                                        (return v)
                                     )
                                   )
                             )
                            )
                            (T Nil)
                      )  

)

//
// Получить элемент из вектора или матрицы ###############
//

(defun arrGet (n i) (cond ((= (car (geval n)) 'VECTOR)
                              (cond ((<> (length i) 1) Nil)
                                    ((> (car i) (cadr (geval n))) Nil)
                                    ((< (car i) 1) Nil)
                                    (T  
                                      (prog (k j z)
                                            (setq k (- (car i) 1))
                                            (setq z (geval n))
                                            (setq z (cddr z)) 
                                            (for j 1 k ((setq z (cdr z)))) 
                                            (return (car z))
                                      )
                                   )  
                             )
                            )
                            ((= (car (geval n)) 'MATRIX) 
                             (cond ((<> (length i) 2) Nil)
                                   ((OR (> (car i) (cadr (geval n))) (> (cadr i) (caddr (geval n))) 
                                        (< (car i) 1) (< (cadr i) 1)
                                    ) Nil)
                                   (T
                                     (prog (k j z) 
                                        (setq k (+ (* (- (car i) 1) (caddr (geval n))) (cadr i) -1))
                                        (setq z (geval n))
                                        (setq z (cdddr z)) 
                                        (for j 1 k ((setq z (cdr z)))) 
                                        (return (car z))
                                     )
                                   )
                             )
                            )
                            (T Nil)
                      )  

)

//
// Печать вектора или матрицы ###############
//

(defun arrPrint (N) (cond ((null (eval N)) Nil)         // Это не массив 

                          ((= (car (eval N)) 'VECTOR)   // Печать вектора
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

                          ((= (car (eval N)) 'MATRIX)   // Печать матрицы
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

//
// "Умножение" массивов (для векторов - скалярное произведение; для матриц - матричное произведение)  ###############
//

(defun arrMult (A B C) (Cond ((AND (= (car (eval A)) 'VECTOR) (= (car (eval B)) 'VECTOR)) 
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

//
//  Заполнить массив ###############
//

(defun arrFill (A FL) (cond ((= (car (eval A)) 'VECTOR)
                             (prog (i n Tmp z)
                               (setq Tmp Fl)  
                               (setq z (geval A))
                               (setq z (cddr z))  
                               (setq n (min (cadr (geval A)) (length FL)))
                               (for i 1 n ((rplaca z (car tmp)) (setq tmp (cdr tmp)) (setq z (cdr z)) ))    
                               (return n)     
                             )  
                            )
                            ((= (car (eval A)) 'MATRIX)
                             (prog (i n Tmp z)
                               (setq Tmp Fl)
                               (setq z (geval A))
                               (setq z (cdddr z))
                               (setq n (min (length Fl) (* (cadr (geval A)) (caddr (geval A)))))
                               (for i 1 n ( (rplaca z (car tmp)) (setq tmp (cdr tmp)) (setq z (cdr z))  ))  
                               (return n)     
                             ) 
                            )
                            (T Nil)
                      )   
)

//
// Ресайзировать массив ###############
//

(defun arrResize (A in)

       (cond ( (AND (= (car (eval A)) 'VECTOR) (= (length in) 1)) // ресайзирование вектора

               (prog (n j z r p)
                 (setq n (min (car in) (cadr (geval A))))
                 (setq z (arrMake (car in)))
                 (setq r z)
                 (setq p (geval A)) 
                 (setq p (cddr p))
                 (for j 1 n (
                              (rplaca r (car p))
                              (setq r (cdr r))
                              (setq p (cdr p))
                            )
                 )
                 (gset A (cons 'VECTOR (cons n z)))
                 (return T) 
               )

             )  

             ( (AND (= (car (eval A)) 'MATRIX) (= (length in) 2)) // ресайзирование матрицы

               (prog (n1 n2 i j k l z r v)
                  
                   (setq z (arrMake (* (car in) (cadr in))))

                   (setq r z)

                   (setq n1 (min (cadr (geval A)) (car in) ))

                   (setq n2 (min (caddr (geval A)) (cadr in) ))

                   (for i 1 n1 
                        (
                          (for j 1 n2 
                               (
                                 (setq v (geval (arrGet A (list i j))))

                                 (setq k (+ (* (- i 1) (cadr in)) j -1))

                                 (setq r z)

                                 (for l 1 k (
                                              (setq r (cdr r))
                                            )
                                 )
                                 (rplaca r v)
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

(defun arrCut (A in B)                        // Вырезка из массива

        (cond ((= (car (eval A)) 'VECTOR)     // из вектора
               (prog (i q n1 n2 r z u k j)
                    (setq n1 (cadr (geval A)))
                    (setq n2 (length in))
                    (setq z in)
                    (setq u 0) 
                    (for i 0 (- n2 1) 
                         ( (setq k (car z))
                           (setq q (cddr (geval A)))
                           (for j 1 (- k 1)
                                (
                                  (setq q (cdr q))
                                )   
                           )
                           (setq r (append r (list (car q))))
                           (setq u (+ u 1)) 
                           (setq z (cdr z))
                         ) 
                    )
               (set B (cons 'VECTOR (cons u r)))
               (return T)      
               )
              )

              ((= (car (eval A)) 'MATRIX)     // из матрицы
               (prog (rlist clist i j n1 n2 k z i1 j1 u1 u2)
                     (setq rlist (car in))
                     (setq clist (cadr in))
                     (setq n1 (length rlist))
                     (setq n2 (length clist))
                     (arrCreate B (list n1 n2))
                     (for i 1 n1 (
                          (setq z rlist)
                          (setq u1 (- i 1))

                          (for k 1 u1  
                              ( (setq z (cdr z)) )
                          ) 
                          (setq i1 (car z))
                          (for j 1 n2 (
                                      (setq z clist)
                                      (setq u2 (- j 1)) 
                                      (for k 1 u2
                                          ( (setq z (cdr z)))
                                      )
                                      
                                      (setq j1 (car z))
                                      
                                      (arrPut B (arrGet A (list i1 j1)) (list i j))
 
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

//
//  Тестирующие вызовы
//

//(arrCreate 'AA '(10))
//(arrFill 'AA '(11 22 33 44 55 66 -99 -88 -77))
//(arrCut 'AA '(2 4 6 3 5 7 10) 'BB)
//(arrPrint 'BB)

(arrCreate 'Z '(4 3))
(arrFill 'Z '(1 2 3 4 5 6 7 8 9 10 11 12 13))
//(arrCut 'Z '((2 4) (1 3)) 'ZZ)
(arrCut 'Z '((2 2) (3 3)) 'ZZ)
(arrPrint 'ZZ)

//(arrCreate 'Z '(4 3))
//(arrPut 'Z 555 '(2 2))
//(arrGet 'Z '(1 1))
//(arrGet 'Z '(2 2))
//(arrFill 'Z '(1 2 3 4 5 6 7 8 9 10 11 12 13))
//(arrPrint 'Z)
//(arrResize 'Z '(5 5))
//(arrPrint 'Z)

//(printline '----------------------------------------------------)

//(arrCreate 'Z1 '(3))
//(arrCreate 'Z2 '(3))
//(arrFill 'Z1 '(1 0 1))
//(arrFill 'Z2 '(1 0 -1))
//(arrMult 'Z1 'Z2 'ZZ)

//(printline '----------------------------------------------------)

//(arrCreate 'Q1 '(2 3))
//(arrFill 'Q1 '(1 1 1 2 2 2))
//(arrPrint 'Q1)
//(arrCreate 'Q2 '(3 4))
//(arrFill 'Q2 '(1 1 1 1 2 2 2 2 3 3 3 3))
//(arrPrint 'Q2)
//(arrMult 'Q1 'Q2 'Q3)
//(arrPrint 'Q3)

(gc)





