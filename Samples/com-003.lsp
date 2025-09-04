
(comCreateObject 'wdApp "Word.Application")

(comPropGetO 'wdApp "Documents" 'docs)

(comPropLet 'wdApp "Visible" -1)

(comMethodO 'docs "ADD" 'doc)

(comMethod 'doc "select")

(comPropGetO 'wdApp "selection" 'selection)

(for i 1 25 ( 
              (comMethod 'selection "typetext" (strCat "Проба пера" (strChr 10)))  
             )
)                  

(comMethod 'doc "saveAs" "d:\111.doc")

(comMethod 'wdApp "quit")

(comDestroyObject 'doc)

(comDestroyObject 'docs)

(comDestroyObject 'selection)

(comDestroyObject 'wdApp)

(say 'OK!)


