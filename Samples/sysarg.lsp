;;
;;  ����� ���������� ��������� ������
;;
;;  ������� �.�.
;;
(prog (n i)
  (setq n (sysArgc))
  (for i 0 n ((printline  (strCat (fix2str i) " -> "  (sysArgv i)))))
)
