
(prog (i j) 

           (comCreateObject 'xls "Excel.Application")

           (comPropGetO 'xls "WorkBooks" 'workbooks)

           (comPropLet 'xls "Visible" -1)

           (comPropLet 'xls "displayalerts" 0)

           (comMethodO 'workbooks "ADD" 'wb)

           (compropGetO 'wb "Sheets" 'Sht 1)


           (compropGetO 'Sht "cells" 'cell 1 1)

           (comPropLet 'cell "Value" 5)

           (comDestroyObject 'cell)


           (compropGetO 'Sht "cells" 'cell 1 2)

           (comPropLet 'cell "Value" 10)

           (comDestroyObject 'cell)


           (compropGetO 'Sht "cells" 'cell 1 3)

           (comPropLet 'cell "Value" 15)

           (comDestroyObject 'cell)


           (comPropGetO 'Sht "range" 'range "A1:C1")

           (comMethod 'range "select")


           (comPropGetO 'xls "charts" 'charts)

           (comMethodO 'charts "ADD" 'chart)

           (comPropLet 'chart "Type" -4100)

           (setq j 5)

           (for i 1 36 (
                         (comPropLet 'chart "Rotation" j)
                         (setq j (+ j 5)) 
                         (sleep* 200)
                       )
           )

           (for i 1 36 (
                         (comPropLet 'chart "Rotation" j)
                         (setq j (- j 5)) 
                         (sleep* 200)
                       )
           )

          (comMethod 'xls "quit")

          (comDestroyObject 'wb)

          (comDestroyObject 'Sht)

          (comDestroyObject 'xls)

          (comDestroyObject 'charts)

          (comDestroyObject 'chart)

          (comDestroyObject 'range)

          (comDestroyObject 'workbooks)

          (say 'OK!)

)

