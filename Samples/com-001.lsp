
(comCreateObject 'xls "Excel.Application")

(comPropGetO 'xls "WorkBooks" 'workbooks)

(comPropLet 'xls "Visible" -1)

(comMethodO 'workbooks "ADD" 'wb)

(compropGetO 'wb "Sheets" 'Sht 1)


(compropGetO 'Sht "range" 'rg1 "A1")

(comPropLet 'rg1 "Value" 123)


(compropGetO 'Sht "range" 'rg2 "A2")

(comPropLet 'rg2 "Value" "Проба пера")


(compropGetO 'Sht "range" 'rg3 "A3")

(comPropLet 'rg3 "Value" -78.89)


(comMethod 'wb "saveAs" "d:\111.xls")

(comMethod 'xls "quit")

(comDestroyObject 'wb)

(comDestroyObject 'Sht)

(comDestroyObject 'rg1)

(comDestroyObject 'rg2)

(comDestroyObject 'rg3)

(comDestroyObject 'xls)

(say 'OK!)


