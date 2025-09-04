;; Счетчик шагов (замыкание)

(let ((c 0))
  (defun next-step nil (prog1 c (setq c (+ c 1))))
  (defun reset-step nil (setq c 0)))

;; Номер временного колышка
  
(defun free(x y)
 (let ((lst (list x y)))
  (cond ((not (member 0 lst)) 0)
        ((not (member 1 lst)) 1)
        (t 2))))
        
;; Собственно алгоритм
        
(defun hanoi (from to n w conf)
  (let ((free (free from to))
        (c-1 nil)
        (c-2 nil))        
    (cond ((= n 2) (setq c-1 (move-disk from free w conf)) 
                   (setq c-2 (move-disk from to w c-1)) 
                   (move-disk free to w c-2))
          (t       (setq c-1 (hanoi from free (- n 1) w conf)) 
                   (setq c-2 (move-disk from to w c-1)) 
                   (hanoi free to (- n 1) w c-2)))))
        
;; Перенос диска        
        
(defun move-disk (from to w conf)
   (let* ((a (nth from conf))   
          (la (last a)) 
          (s (caar la))
          (c (cdar la))            
          (ma (length a))
          (xf (- (* from 100) 100))
          (yf (+ 20 (* (- ma 1) 21)))
          (b (nth to conf))
          (mb (length b))
          (xt (- (* to 100) 100))
          (yt (+ 20 (* (- mb 0) 21)))
          (res-conf nil)
          (step 0))
       (grwFrect w (- xf (* 0.5 s)) yf (+ xf (* 0.5 s)) (- yf 20) _WHITE)
       (grwFrect w (- xt (* 0.5 s)) yt (+ xt (* 0.5 s)) (- yt 20) c)
       (setq step (next-step))
       ;;(grwSavePic w 1 (strCat (format step "000") ".gif"))
       (sleep* 200)
       (grwFrect w -200 150 -160 110 _WHITE)
       (grwPrint w -190 149 (format (+ step 1) "00") _RED)
       (iter (for u in conf) (for k from 0 to 2)
          (cond ((= k from) (collecting (butlast u) into res-conf))
                ((= k to) (collecting (append u (list (cons s c))) into res-conf))
                (t (collecting u into res-conf))))
       res-conf))         

;; Главная функция
       
(defun main nil 
  (let* ((w (gensym 'w)) 
         (c-1 nil)
         (c-2 nil)         
         (n (str2fix (ask "Введите число дисков")))
         (config (list (iter (for i from 1 to n) (collecting (cons (- 80 (* (- i 1) 5)) (qbColor i)))) nil nil)))
    
    (grwCreate w 400 300 "Ханойская башня" _WHITE)
    (grwScale w -200 200 -20 150)
    (grwFont w "Tahoma" 12 t nil)
    (grwPrint w 0 149 "HomeLisp: Hanoi tower" _RED)
    (grwShow w)

    (let ((y 20))
          (iter (for a in (car config)) 
          (grwFrect w  (- -100 (* 0.5 (car a))) y (+ -100 (* 0.5 (car a))) (- y 20) (cdr a))
          (setf y (+ y 21))))
    (hanoi 0 2 n w config)
    (grwCls w)
    (grwFont w "Tahoma" 24 t nil)
    (grwPrint w -30 80 "Уpa!" _RED)
    ;;(grwSavePic w 1 (strCat (format (next-step) "000") ".gif"))
    (loop (when (/= (grwInkey w 200) 0) (grwDestroy w) (return 'ok)))))
    
(main)

    