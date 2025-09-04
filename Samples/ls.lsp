
// "Длина" списка

(defun ls (x) (cond ((null x) 0)
                    (T (+ (cond ((atom (car x)) 1)
                                (t (ls (car x))) ) (ls (cdr x))))
              )
)

// "Сумма" списка

(defun sums (x) (cond ((null x) 0)
                      (T (+ (cond ((atom (car x)) (car x))
                                  (t (sums (car x))) ) (sums (cdr x))))
              )
)

