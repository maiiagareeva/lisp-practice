
(bloCreate 'b 17)

(for i 1 17 (

               (fix2blo 'b    // BLOB
                           i    // Заносимое число
                           i    // Начальная позиция
                           1    // Длина (1,2 или 4 байта)
               ) 
 
            )
)

(bloDump* 'b)

(bloDestroy 'b)
