//
//  Заменить в списке все отрицательные числа нулем (на всех уровнях)
//

(defun rep_zero (x) 
                     (cond ((null x) nil)
                           ((listp (car x))  (cons (rep_zero (car x)) (rep_zero (cdr x)))) 
                           ((minusp (car x)) (cons 0 (rep_zero (cdr x))))
                           (T                (cons (car x) (rep_zero (cdr x))))
                     ) 
)

