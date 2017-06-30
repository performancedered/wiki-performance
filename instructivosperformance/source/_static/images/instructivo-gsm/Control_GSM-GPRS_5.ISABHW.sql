--Tab= Gsm Day
WITH FEC AS (SELECT/*+ materialize */ FECHA 
             FROM CALIDAD_STATUS_REFERENCES 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA','DD.MM.YYYY') + 86399/86400
             AND HORA= '00' GROUP BY FECHA
             ),
   BTS_DAY AS  (SELECT/*+ materialize */ FECHA, COUNT(*) CANTIDAD
             FROM MULTIVENDOR_BTS_DAY 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA','DD.MM.YYYY') + 86399/86400 GROUP BY FECHA
             ),
   BSC AS  (SELECT/*+ materialize */ FECHA, COUNT(*) CANTIDAD
             FROM MULTIVENDOR_BSC_DAY 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA','DD.MM.YYYY') + 86399/86400 GROUP BY FECHA
             ),
   ALM AS (SELECT/*+ materialize */ FECHA, COUNT(*) CANTIDAD 
             FROM MULTIVENDOR_ALM_DAY 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE ','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA','DD.MM.YYYY')+ 86399/86400 GROUP BY FECHA
             ),
   MARKET AS(SELECT/*+ materialize */ FECHA, COUNT(*) CANTIDAD
             FROM MULTIVENDOR_MARKET_DAY 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE ','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA ','DD.MM.YYYY')+ 86399/86400 GROUP BY FECHA
             ),
   PAIS AS (SELECT/*+ materialize */ FECHA, COUNT(*) CANTIDAD
             FROM MULTIVENDOR_PAIS_DAY 
             WHERE FECHA BETWEEN TO_DATE('&FECHA_DESDE','DD.MM.YYYY') 
             AND TO_DATE('&FECHA_HASTA','DD.MM.YYYY')+ 86399/86400 GROUP BY FECHA
             )
SELECT FEC.FECHA FECHA,
       BTS_DAY.CANTIDAD BTS,
       BSC.CANTIDAD BSC,
       ALM.CANTIDAD ALM,
       MARKET.CANTIDAD MKT,
       PAIS.CANTIDAD PAIS
FROM
    FEC,
    BSC,
    ALM,
    MARKET,
    PAIS,
    BTS_DAY
WHERE
    FEC.FECHA=BSC.FECHA (+) 
    AND FEC.FECHA=ALM.FECHA (+) 
    AND FEC.FECHA=MARKET.FECHA (+) 
    AND FEC.FECHA=PAIS.FECHA(+)
    AND FEC.FECHA=BTS_DAY.FECHA(+)
ORDER BY FEC.FECHA;
