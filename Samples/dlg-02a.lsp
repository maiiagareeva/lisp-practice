(dlgCreate 'd-1 400 300 "Оглавление")
(dlgAddControl 'd-1 'c-0 _LIST 8 8 380 200 '("FixedSys" 8 0 0 0) 1) 
(dlgPutList 'c-0 (sysDir "c:\" &HFF))
(dlgAddControl 'd-1 'b-2 _BUTTON 8 210 380 60 '("Tahoma" 18 1 0 0) "Закрыть")
(dlgShow 'd-1)

(dlgGetList 'c-0 0)

(dlgDestroy 'd-1)