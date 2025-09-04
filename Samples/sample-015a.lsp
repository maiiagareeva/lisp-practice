
// Исходный лабиринт

(setq labirint (list (cons 'O 'D)
                     (cons 'P 'Q)
                     (cons 'N 'M)
                     (cons 'G 'D)
                     (cons 'H 'D)
                     (cons 'H 'E)
                     (cons 'H 'Q)
                     (cons 'D 'C)
                     (cons 'C 'M)
                     (cons 'C 'K)
                     (cons 'A 'F)
                     (cons 'B 'E)
                     (cons 'Q 'R)
                     (cons 'M 'L)
                     (cons 'E 'I)
                     (cons 'I 'R)
                     (cons 'I 'T)
                     (cons 'R 'S)
                     (cons 'F 'K)
                     (cons 'F 'J)
                     (cons 'L 'K)
                     (cons 'L 'U)
               )
)


// Функция проверки входит ли атом X в список Y


(sexpr memb (lambda (x y) (prog nil
      a (cond ((null y) (return nil))
              ((eq x (car y)) (return t)))
        (setq y (cdr y)) (go a) )))    


// Функция поиска пути


(sexpr path (lambda (l a b)
(prog (i j s m x y z)
      (setq i (cons b nil))
      (cond ((eq a b) (return i)))
    a (dump* ".\222.dmp")
      (cond ((null l) (go d)))
      (setq z (car l)) (setq l (cdr l))
      (setq x (car z)) (setq y (cdr z))
      (cond ((memb y i) (go c))
            ((memb x i) (go b)))
      (setq m (cons z m)) (undump*) (go a)
    b (undump*)
      (setq z (cons y x))
      (setq y x) (setq x (car z))
    c (undump*)
      (cond ((memb x j) (go a)))
      (setq s (cons z s))
      (cond ((eq x a) (go e)))
      (setq j (cons x j)) (go a)
    d (undump*)
      (cond ((null j) (return nil)))
      (setq l m) (setq i j)
      (setq m nil) (setq j nil) (go a)
    e 
      (setq z nil)
    f 
      (cond ((null s) (return (cons x z))))
      (setq y (car s)) (setq s (cdr s))
      (cond ((eq x (car y)) (go g))) (go f)
    g 
      (setq z (cons x z))
      (setq x (cdr y)) (go f) )))
    

// Вызов функции

    (path labirint 'T 'A)




                
