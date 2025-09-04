

(defun showKeys (BRANCH PATH) (prog (id tmp h)

                                 (setq tmp (regOpenKey BRANCH PATH KEY_ALL_ACCESS))

                                 (cond ( (neq (car tmp) 0) (return nil) ))

                                 (setq h (cadr tmp))

                                 (setq id 0)

                            @    (setq tmp (regEnumValue h id))

                                 (cond ( (neq (car tmp) 0) (go @eor) ))

                                 (printline (cdr tmp))

                                 (setq id (add1 id))

                                 (go @)

                        @eor     (regCloseKey h)
                                 
                                 (return id)

                               )
)
   
(showKeys HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\Currentversion\run")

(showKeys HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\Currentversion\run-")
   
                              
     