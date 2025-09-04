
(dlgCreate 'd-1 120 200 "Проба")

(dlgAddControl 'd-1 'c-1 _LIST 10 10 95 80 '("Tahoma" 9 1 0 0) nil _LEFT)
(dlgAddControl 'd-1 'b-2 _BUTTON 8 87 97 40 '("Tahoma" 9 1 0 0) "Опросить")
(dlgAddControl 'd-1 'b-3 _BUTTON 8 130 97 40 '("Tahoma" 9 1 0 0) "Закрыть")


(dlgAddItem 'c-1 "Мышка")
(dlgAddItem 'c-1 "Кошка")
(dlgAddItem 'c-1 "Жучка")
(dlgAddItem 'c-1 "Внучка")
(dlgAddItem 'c-1 "Бабка")
(dlgAddItem 'c-1 "Дедка")

(defun b-2_Click Nil (say (output (dlggetlist 'c-1 -1))))

(defun b-3_Click Nil (dlgHide 'd-1))

(dlgSetEvent 'b-2 'b-2_click)
(dlgSetEvent 'b-3 'b-3_click)

(dlgShow 'd-1)

