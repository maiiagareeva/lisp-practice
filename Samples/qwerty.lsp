
//
//  Программа отображения диалога _Dlg_
//

(prog nil

      (dlgCreate '_Dlg_ 175 127 "Ура!!!")

      (dlgAddControl '_Dlg_ '_BUT_1 _BUTTON 8 7 152 84 '("Tahoma" 8,25 1 0 0) "Кнопка-1")
      (dlgPutPicture '_BUT_1 22)

      //
      // Обработчик события CLICK для кнопки _BUT_1
      //

      (defun _BUT_1_Click  Nil 

          (Prog nil
            (sysShell (strCat (sysHome) "\ppp.li")) // полный путь к файлу приложения
            (exit "Пока!") 
          )
      )

      //
      //   Назначение процедуры-события _BUT_1_Click  контролу _BUT_1
      //

      (dlgSetEvent '_BUT_1 '_BUT_1_Click )

      //
      //   Отображение диалога _Dlg_
      //

      (dlgShow '_Dlg_)
)
