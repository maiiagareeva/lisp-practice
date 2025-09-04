
(prog (i argl) 
         (setq argl "")
         (for i 1 (sysArgc)
               (
                  (setq argl (strCat argl (sysArgv i)))
                  (setq argl (strCat argl (strChr 10)))
               )
          )
         (say argl)
)       

