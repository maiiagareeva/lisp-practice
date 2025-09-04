(dlgCreate 'd-1 200 200 "Диалог-3")
(dlgAddControl 'd-1 'o-1 _OPTION 8 8 175 20 '("FixedSys" 8 0 0 0) "Это...") 
(dlgAddControl 'd-1 'o-2 _OPTION 8 28 175 20 '("FixedSys" 8 0 0 0) "Или то...") 
(dlgAddControl 'd-1 'o-3 _OPTION 8 48 175 20 '("FixedSys" 8 0 0 0) "Или вот это...") 
(dlgAddControl 'd-1 'b-2 _BUTTON 8 130 175 40 '("Tahoma" 9 1 1 0) "Закрыть")
(defun d-1_Click Nil (dlgHide 'd-1))
(dlgSetEvent 'b-2 'd-1_Click)
(dlgShow 'd-1)
(dlgGetChkOpt 'o-1)
(dlgGetChkOpt 'o-2)
(dlgGetChkOpt 'o-3)


