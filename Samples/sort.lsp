;;
;;   Сортировки массивов
;;
;;   Ординарный первод с Паскаля
;;
;;   Файфель Б.Л.
;;

;;
;;  Заполнение массива случайными числами
;;

(defun rndlist (n m)
   (cond ((= n 1) (list (rnd m)))
         (T (cons (rnd m) (rndlist (- n 1) m)))
   )
)

;;
;;  Пузырьковая сортировка
;;

(defun bsort (x) 
   (prog (n i j xi xj ai) 
         (setq n (length x))
         (for i 1 (- n 1)
           (
             (setq ai (+ i 1))
             (for j ai n
               (
                 (setq xi (getEl x i))
                 (setq xj (getel x j))
                 (cond ((> xi xj) (swapEl x i j)))
               ) 
             )
           )
         )
         (return x)
   )
)

;;
;;  Быстрая сортировка участка массива
;;

(defun qsort_a (x frs lst) 
   (prog (aft bef cnt) 
     (cond ((>= frs lst) (return x)))
       (setq cnt (getEl x lst))
       (setq aft frs)
       (setq bef lst)
   @1  
       (cond ((>= (getEl x aft) cnt) (go @2)))
       (setq aft (+ aft 1))
       (go @1)
   @2
       (cond ((OR (< (getEl x bef) cnt) (<= bef aft)) (go @3)))
       (setq bef (- bef 1))
       (go @2)
   @3   
       (cond ((< aft bef) (swapEl x bef aft)))
       (cond ((<> aft bef) (go @1))) 
       (putEl x lst (getEl x aft))
       (putEl x aft cnt)
       (qsort_a x frs (sub1 aft))
       (qsort_a x (add1 aft) lst)
       (return x)   
   ) 
)

;;
;;  Быстрая сортировка всего массива
;;

(defun qsort (x) (qsort_a x 1 (length x)))

