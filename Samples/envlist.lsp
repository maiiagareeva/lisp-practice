;;
;;  �������� ������ ���������� ���������
;;
;;  ������� �.�.
;;

(defun env (l i) (cond ((null (sysEnv i)) l) (t (list l (sysEnv i) (env l (add1 i) )))))

(defun envList nil (flatten (env nil 1)))

(envlist)
