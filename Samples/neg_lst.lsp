
//
//  ѕосторить список, содержащий только отрицательные члены исходного списка
//

(defun neg_lst (x) (cond ((Null x) nil)
                         ((minusp (car x)) (cons (car x) (neg_lst (cdr x))))
                         (T                (neg_lst (cdr x  )))
                    ) 
)
