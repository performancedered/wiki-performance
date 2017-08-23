
-- Control nivel Day

SELECT R.FECHA, count(A.fecha) USUARIOS
FROM MCARRASCO.CALIDAD_STATUS_REFERENCES R join acs_vowifi_sonus_day A
ON R.fecha=A.fecha
WHERE hora='00'
AND R.FECHA BETWEEN TO_DATE('&1','DD.MM.YYYY')
AND TO_DATE('&2','DD.MM.YYYY')
group by r.fecha
ORDER BY 1;