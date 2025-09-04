
(defun dskList nil 

       (prog (Dsk i Ldsk mask)

             (setq Ldsk "")

             (setq Dsk (sysLogicalDrives))

             (for i 0 25 
        
                  (

                    (setq mask (fix2bit (^ 2 i)))
                         
                    (setq Ldsk

                          (strCat Ldsk 
             
                             (cond ((neq (logand mask Dsk) &H0) (strCat (strChr (+ 65  i)) ": " )) 
                                   (t "")
                             )

                          )
                    )
                  )
 
             )

            (return Ldsk)

       )
)

(dsklist)
