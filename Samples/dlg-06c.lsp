
(defun b-1_Click Nil (dlgCntHideShow 't-1))

(defun b-2_Click Nil (dlgHide 'd-1))

(dlgCreate 'd-1 200 180 "Диалог-7")

(dlgAddControl 'd-1 't-1 _TEXT 8 8 175 20 '("FixedSys" 8 0 0 0) "" 0) 

(dlgAddControl 'd-1 'b-1 _BUTTON 8 30 175 60 '("Tahoma" 9 1 1 0) "Нажми!")

(dlgPutPicture 'b-1 11)

(dlgAddControl 'd-1 'b-2 _BUTTON 8 92 175 60 '("Tahoma" 9 1 1 0) "Закрыть")

(dlgPutPicture 'b-2 22)

(dlgPutText 't-1 "Бычий хвост")

(dlgSetEvent 'b-1 'b-1_Click)

(dlgSetEvent 'b-2 'b-2_Click)

(dlgShow 'd-1)

(dlgGetText 't-1)

(dlgDestroy 'd-1)

(gc)