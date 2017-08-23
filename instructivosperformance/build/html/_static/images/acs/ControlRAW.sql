
-- Control nivel RAW

SELECT R.FECHA, count(A.fecha) USUARIOS
FROM MCARRASCO.CALIDAD_STATUS_REFERENCES R join acs_vowifi_sonus_raw A
ON R.fecha = A.fecha
WHERE R.FECHA BETWEEN TO_DATE('&1','DD.MM.YYYY')
AND TO_DATE('&2','DD.MM.YYYY')
group by R.fecha
ORDER BY 1;

