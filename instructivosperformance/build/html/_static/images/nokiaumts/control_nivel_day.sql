SELECT T.FECHA, COUNT(A.FECHA) CELLS 
FROM CALIDAD_STATUS_REFERENCES T, TABLERO_UMTS_ULINTFN_WCEL_DAY A 
WHERE T.FECHA = A.FECHA (+) 
  AND T.FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                  AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400 
  AND HORA = 00 
GROUP BY T.FECHA 
ORDER BY 1