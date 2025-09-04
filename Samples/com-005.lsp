
(prog (i hd) 

           (comCreateObject 'xls "Excel.Application")

           (comPropGetO 'xls "WorkBooks" 'workbooks)

           (comPropLet 'xls "Visible" -1)

           (comMethodO 'workbooks "ADD" 'wb)

           (compropGetO 'wb "Sheets" 'Sht 1)

           (for i 1 100 (

                          (compropGetO 'Sht "cells" 'cell i 1)

                          (comPropLet 'cell "Value" i)

                          (comDestroyObject 'cell)

                        )
           )


           (compropGetO 'Sht "cells" 'cell 101 1)

           (comPropLet 'cell "Formula" "=SUM(A1:A100)")

           (comDestroyObject 'cell)


           (Setq hd (sysHome))

           (comMethod 'wb "saveas" (strCat (sysHome) "\123.xls")) 

           (comMethod 'xls "quit")

           (comDestroyObject 'workbooks)

           (comDestroyObject 'wb)

           (comDestroyObject 'Sht)

           (comDestroyObject 'xls)

           (say 'OK!)

)

