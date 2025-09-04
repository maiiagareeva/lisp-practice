
(setq st '(b c))

 ==>  (b c)


(defun push1 (a p) (setq p (cons a (eval p))))


 ==>  push1


(push1 'a 'st)


 ==>  (a b c)


(setq p '(1 2 3))


 ==>  (1 2 3)

(push1 'q 'p)


 ==>  (q . p)


(smacro push2 (lambda (a p) (list 'setq p (list 'cons a p))))


 ==>  push2

(push2 'q p)


 ==>  (q 1 2 3)


(defun push3 (%a %p) (setq %p (cons %a (eval %p))))


 ==>  push3
