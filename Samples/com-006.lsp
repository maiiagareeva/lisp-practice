
(defun SpecFolders (nam) (prog (wsh sf res) 

                            (comCreateObject 'wsh "WScript.Shell")

                            (comPropGetO 'wsh "SpecialFolders" 'sf)

                            (setq res (comMethod 'sf "Item" nam))

                            (comDestroyObject 'sf)

                            (comDestroyObject 'wsh)

                            (return res)

                          )
)

