;;
;; Поэлементное сложение двух числовых списков
;;
;; Файфель Б.Л.
;;

(defun add-list (x y) (cond ((null x) y)
                            ((null y) x)
                            (T (cons (+ (car x) (car y)) (add-list (cdr x) (cdr y)))))) 

