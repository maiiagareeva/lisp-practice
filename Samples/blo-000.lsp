
(bloCreate 'b 17)

(for i 1 17 (

               (fix2blo 'b    // BLOB
                           i    // ��������� �����
                           i    // ��������� �������
                           1    // ����� (1,2 ��� 4 �����)
               ) 
 
            )
)

(bloDump* 'b)

(bloDestroy 'b)
