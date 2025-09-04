(prog (wsn nn n1 i net_drv)

      (comCreateObject 'wsn "WScript.Network")

      (comPropGet 'wsn "UserDomain")

      (comPropGet 'wsn "UserName")

      (comPropGet 'wsn "ComputerName")

      (comMethodO 'wsn "EnumNetworkDrives" 'net_drv)

      (setq nn (comMethod 'net_drv "count"))

      (cond ((neq nn 0)  

                 (prog (i n1)
      
                       (setq n1 (sub1 nn)) 
      
                       (setq i 0)

                 @loop (print (comMethod 'net_drv "item" i))
                       (prints " ")
                       (print (comMethod 'net_drv "item" (+ i 1)))
                       (terpri)

                       (setq i (+ i 2))

                       (cond ((<= i n1) (go @loop)))

                 )
               )

               ( T (printsline "Сетевых соединений нет..."))

      )

      (comDestroyObject 'net_drv)

      (comDestroyObject 'wsn)

      (return (\ nn 2))

) 