
(comCreateObject 'xls "Excel.Application")

(comPropGetO 'xls "WorkBooks" 'workbooks)

(comPropLet 'xls "Visible" -1)

(comMethodO 'workbooks "ADD" 'wb)

(compropGetO 'wb "Sheets" 'Sht 1)

(for i 1 40 ((compropGetO 'Sht "cells" 'cell i 1) 
              (comPropLet 'cell "Value" i)
              (comPropGetO 'cell "interior" 'interior)
              (comPropLet 'interior "colorindex" i)
              (comDestroyObject 'interior)
              (comDestroyObject 'cell)
             )
)                  

(comMethod 'wb "saveAs" "d:\111.xls")

(comMethod 'xls "quit")

(comDestroyObject 'wb)

(comDestroyObject 'Sht)

(comDestroyObject 'xls)

(say 'OK!)


