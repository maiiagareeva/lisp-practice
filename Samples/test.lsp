
//
//  Программа отображения диалога _Dlg_
//

(prog nil

      (dlgCreate '_Dlg_ 274 165 "Тестовый диалог")

      (dlgAddControl '_Dlg_ '_TXT_1 _TEXT 11 8 157 24 '("Tahoma" 8 1 0 0) "" 0 &H80000008 &H80000005)

      (dlgAddControl '_Dlg_ '_BUT_1 _BUTTON 176 3 81 35 '("Tahoma" 8,25 1 0 0) "Вычислить")

      (dlgAddControl '_Dlg_ '_TXT_2 _TEXT 11 46 246 36 '("Tahoma" 8 1 0 0) "" 0 &H80000008 &H80000005)

      (dlgAddControl '_Dlg_ '_BUT_2 _BUTTON 51 86 189 42 '("Tahoma" 8,25 1 0 0) "Закрыть")
      (dlgPutPicture '_BUT_2 36)

      //
      // Обработчик события CLICK для кнопки _BUT_2
      //

      (defun _BUT_2_Click  Nil 

          (dlgHide '_DLG_)

      )


      //
      //   Назначение процедуры-события _BUT_2_Click  контролу _BUT_2
      //

      (dlgSetEvent '_BUT_2 '_BUT_2_Click )
      //
      // Обработчик события CLICK для кнопки _BUT_1
      //

      (defun _BUT_1_Click  Nil 

                  (PROG (x y)

                     (setq x (dlgGetText '_Txt_1))

                     (TRY

                           (setq y (fact (str2fix x)))

                      EXCEPT

                          (setq y "Ошибка при вычислении")

                      )

                     (dlgPutText '_Txt_2 y)

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
