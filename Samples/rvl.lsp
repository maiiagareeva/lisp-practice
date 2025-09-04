
(defun rvl (x) (cond ((atom x) x) (T (append (rvl (cdr x)) (list (rvl (car x)))))))