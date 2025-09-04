
//
//  дать n-й элемент верхнего уровня
//

(defun getn (x n) (cond ((eq n 1) (car x))
                        ((Null x) nil)
                        (T        (getn (cdr x) (- n 1)))))

