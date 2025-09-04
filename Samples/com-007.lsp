
(prog (wsh sf myLnk)

     (comCreateObject 'wsh "WScript.Shell")

     (comPropGetO 'wsh "SpecialFolders" 'sf)

     (setq DesktopPath (comMethod 'sf "Item" "Desktop"))

     (comMethodO 'wsh "CreateShortCut" 'myLnk (strCat DesktopPath "\На Блокнот.lnk"))

     (comPropLet 'myLnk "TargetPath" (comMethod 'wsh "ExpandEnvironmentStrings" "%windir%\notepad.exe"))

     (comPropLet 'myLnk "WorkingDirectory" (comMethod 'wsh "ExpandEnvironmentStrings" "%windir%"))

     (comPropLet 'myLnk "WindowStyle" 4)

     (comPropLet 'myLnk "IconLocation" (comMethod 'wsh "ExpandEnvironmentStrings" "%windir%\notepad.exe, 0"))

     (comMethod 'myLnk "Save")

     (say "Ярлык создан успешно!")

     (comDestroyObject 'myLnk)
 
     (comDestroyObject 'sf)

     (comDestroyObject 'wsh)

     (gcd)
)
 
