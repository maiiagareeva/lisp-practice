
(dlgCreate 'd-1 120 200 "�����")

(dlgAddControl 'd-1 'c-1 _LIST 10 10 95 80 '("Tahoma" 9 1 0 0) nil _LEFT)
(dlgAddControl 'd-1 'b-2 _BUTTON 8 87 97 40 '("Tahoma" 9 1 0 0) "��������")
(dlgAddControl 'd-1 'b-3 _BUTTON 8 130 97 40 '("Tahoma" 9 1 0 0) "�������")


(dlgAddItem 'c-1 "�����")
(dlgAddItem 'c-1 "�����")
(dlgAddItem 'c-1 "�����")
(dlgAddItem 'c-1 "������")
(dlgAddItem 'c-1 "�����")
(dlgAddItem 'c-1 "�����")

(defun b-2_Click Nil (say (output (dlggetlist 'c-1 -1))))

(defun b-3_Click Nil (dlgHide 'd-1))

(dlgSetEvent 'b-2 'b-2_click)
(dlgSetEvent 'b-3 'b-3_click)

(dlgShow 'd-1)

