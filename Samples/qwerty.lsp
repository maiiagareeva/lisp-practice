
//
//  ��������� ����������� ������� _Dlg_
//

(prog nil

      (dlgCreate '_Dlg_ 175 127 "���!!!")

      (dlgAddControl '_Dlg_ '_BUT_1 _BUTTON 8 7 152 84 '("Tahoma" 8,25 1 0 0) "������-1")
      (dlgPutPicture '_BUT_1 22)

      //
      // ���������� ������� CLICK ��� ������ _BUT_1
      //

      (defun _BUT_1_Click  Nil 

          (Prog nil
            (sysShell (strCat (sysHome) "\ppp.li")) // ������ ���� � ����� ����������
            (exit "����!") 
          )
      )

      //
      //   ���������� ���������-������� _BUT_1_Click  �������� _BUT_1
      //

      (dlgSetEvent '_BUT_1 '_BUT_1_Click )

      //
      //   ����������� ������� _Dlg_
      //

      (dlgShow '_Dlg_)
)
