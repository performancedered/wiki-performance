-- Modificado: Martin Champarini. 
-- Fecha: 27.06.2016.

--Tab=GsmHourZona

WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
              ),
      ALM AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_ALM_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      MKT AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_MKT_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY') 
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      BSC AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_BSC_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      PAIS AS (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_PAIS_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
			MGBH AS (SELECT /*+ MATERIALIZE */ FECHA, 
                      COUNT(*)CANTIDAD,
                      OSSRC
                 FROM MVENDOR_GSM_BTS_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY') 
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA, OSSRC
              ),
 INNER_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM MGBH
              ),
 INNER_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM INNER_ONE
                GROUP BY FECHA
              )
SELECT RFC.FECHA, 
       'GSM'           TECNOLOGIA,
       OSSRC1_CANTIDAD OSSRC1,
	     OSSRC2_CANTIDAD OSSRC2,
       OSSRC3_CANTIDAD OSSRC3,
       OSSRC5_CANTIDAD OSSRC5,
       BSC.CANTIDAD    BSC,
       ALM.CANTIDAD    ALM, 
       MKT.CANTIDAD    MKT, 
       PAIS.CANTIDAD   PAIS
  FROM RFC,
       ALM,
       MKT,
       BSC,
       PAIS,
       INNER_TWO
 WHERE RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = BSC.FECHA (+)
   AND RFC.FECHA = PAIS.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = INNER_TWO.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=GprsHourZona

WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
              ),
      ALM AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_GPRS_ALM_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      MKT AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_GPRS_MKT_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY') 
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      BSC AS  (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_GPRS_BSC_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      PAIS AS (SELECT /*+ MATERIALIZE */ FECHA,
                      COUNT(*)  CANTIDAD
                 FROM MULTIVENDOR_GPRS_PAIS_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY')
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA 
              ),
      MGBH AS (SELECT /*+ MATERIALIZE */ FECHA, 
                      COUNT(*)CANTIDAD,
                      OSSRC
                 FROM MVENDOR_GPRS_BTS_HOUR
                WHERE FECHA BETWEEN TO_DATE('&fecha_desde', 'DD.MM.YYYY') 
                                AND TO_DATE('&fecha_hasta', 'DD.MM.YYYY') + 86399/86400
                GROUP BY FECHA, OSSRC
              ),
 INNER_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM MGBH
              ),
 INNER_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM INNER_ONE
                GROUP BY FECHA
              )
SELECT RFC.FECHA, 
       'GPRS'          TECNOLOGIA,
       OSSRC1_CANTIDAD OSSRC1,
       OSSRC2_CANTIDAD OSSRC2,
       OSSRC3_CANTIDAD OSSRC3,
       OSSRC5_CANTIDAD OSSRC5,
       BSC.CANTIDAD    BSC,
       ALM.CANTIDAD    ALM, 
       MKT.CANTIDAD    MKT, 
       PAIS.CANTIDAD   PAIS
  FROM RFC,
       ALM,
       MKT,
       BSC,
       PAIS,
       INNER_TWO
 WHERE RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = BSC.FECHA (+)
   AND RFC.FECHA = PAIS.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = INNER_TWO.FECHA (+)
 ORDER BY RFC.FECHA;
