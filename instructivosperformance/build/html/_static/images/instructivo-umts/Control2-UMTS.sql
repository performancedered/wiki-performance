-- Modificado: Cristian Farias.
-- Fecha: 08/09/2016
-- Motivo: Se añade la querie de control de Master HO Celda y NE.

---------------------------------------------------------------------------------------------------------------------------
-- Detail Tables Hourly
---------------------------------------------------------------------------------------------------------------------------

--Tab=DetailServiceWcelHour
SELECT B.FECHA, OSSRC3_CANTIDAD, OSSRC2_CANTIDAD, OSSRC1_CANTIDAD
  FROM (SELECT FECHA,
               MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
               MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
               MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               OSSRC,
                               COUNT(*) CANTIDAD
                          FROM UMTS_D_NSN_SERVICE_WCEL_HOUR
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, OSSRC))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;

--Tab=DetailServiceNeHour
SELECT B.FECHA,
       WBS_CANTIDAD,
       RNC_CANTIDAD,
       ALM_CANTIDAD,
       MRC_CANTIDAD,
       CDD_CANTIDAD,
       CTY_CANTIDAD
  FROM (SELECT FECHA,
               MAX(WBS_CANTIDAD) WBS_CANTIDAD,
               MAX(RNC_CANTIDAD) RNC_CANTIDAD,
               MAX(ALM_CANTIDAD) ALM_CANTIDAD,
               MAX(MRC_CANTIDAD) MRC_CANTIDAD,
               MAX(CDD_CANTIDAD) CDD_CANTIDAD,
               MAX(CTY_CANTIDAD) CTY_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(ELEMENT_CLASS, 'WBTS', CANTIDAD) WBS_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'RNC', CANTIDAD) RNC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'ALM', CANTIDAD) ALM_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'CIUDAD', CANTIDAD) CDD_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'PAIS', CANTIDAD) CTY_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               ELEMENT_CLASS,
                               COUNT(*) CANTIDAD
                          FROM UMTS_D_NSN_SERVICE_NE_HOUR
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, ELEMENT_CLASS))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;

--Tab=DetailCellResWcelHour
SELECT B.FECHA, OSSRC3_CANTIDAD, OSSRC2_CANTIDAD, OSSRC1_CANTIDAD
  FROM (SELECT FECHA,
               MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
               MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
               MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               OSSRC,
                               COUNT(*) CANTIDAD
                          FROM UMTS_D_NSN_CELLRES_WCEL_HOUR
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, OSSRC))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;

--Tab=DetailCellResNeHour
SELECT B.FECHA,
       WBS_CANTIDAD,
       RNC_CANTIDAD,
       ALM_CANTIDAD,
       MRC_CANTIDAD,
       CDD_CANTIDAD,
       CTY_CANTIDAD
  FROM (SELECT FECHA,
               MAX(WBS_CANTIDAD) WBS_CANTIDAD,
               MAX(RNC_CANTIDAD) RNC_CANTIDAD,
               MAX(ALM_CANTIDAD) ALM_CANTIDAD,
               MAX(MRC_CANTIDAD) MRC_CANTIDAD,
               MAX(CDD_CANTIDAD) CDD_CANTIDAD,
               MAX(CTY_CANTIDAD) CTY_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(ELEMENT_CLASS, 'WBTS', CANTIDAD) WBS_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'RNC', CANTIDAD) RNC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'ALM', CANTIDAD) ALM_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'CIUDAD', CANTIDAD) CDD_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'PAIS', CANTIDAD) CTY_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               ELEMENT_CLASS,
                               COUNT(*) CANTIDAD
                          FROM UMTS_D_NSN_CELLRES_NE_HOUR
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, ELEMENT_CLASS))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;

---------------------------------------------------------------------------------------------------------------------------
-- Master Tables Hourly
---------------------------------------------------------------------------------------------------------------------------

--Tab=MasterServiceWcelHour
SELECT B.FECHA, OSSRC3_CANTIDAD, OSSRC2_CANTIDAD, OSSRC1_CANTIDAD
  FROM (SELECT FECHA,
               MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
               MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
               MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                       DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               OSSRC,
                               COUNT(*) CANTIDAD
                          FROM UMTS_NSN_SERVICE_WCEL_HOU2
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, OSSRC))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;

--Tab=MasterServiceNeHour
SELECT B.FECHA,
       WBS_CANTIDAD,
       RNC_CANTIDAD,
       ALM_CANTIDAD,
       MRC_CANTIDAD,
       CDD_CANTIDAD,
       CTY_CANTIDAD
  FROM (SELECT FECHA,
               MAX(WBS_CANTIDAD) WBS_CANTIDAD,
               MAX(RNC_CANTIDAD) RNC_CANTIDAD,
               MAX(ALM_CANTIDAD) ALM_CANTIDAD,
               MAX(MRC_CANTIDAD) MRC_CANTIDAD,
               MAX(CDD_CANTIDAD) CDD_CANTIDAD,
               MAX(CTY_CANTIDAD) CTY_CANTIDAD
          FROM (SELECT FECHA,
                       DECODE(ELEMENT_CLASS, 'WBTS', CANTIDAD) WBS_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'RNC', CANTIDAD) RNC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'ALM', CANTIDAD) ALM_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'CIUDAD', CANTIDAD) CDD_CANTIDAD,
                       DECODE(ELEMENT_CLASS, 'PAIS', CANTIDAD) CTY_CANTIDAD
                  FROM (SELECT PERIOD_START_TIME FECHA,
                               ELEMENT_CLASS,
                               COUNT(*) CANTIDAD
                          FROM UMTS_NSN_SERVICE_NE_HOUR
                         WHERE PERIOD_START_TIME BETWEEN
                               TO_DATE('&1', 'DD.MM.YYYY') AND
                               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
                         GROUP BY PERIOD_START_TIME, ELEMENT_CLASS))
         GROUP BY FECHA) A,
       (SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') AND
               TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400) B
 WHERE A.FECHA(+) = B.FECHA
 ORDER BY B.FECHA;
 
--Tab=MasterHOHour
WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
              ),
      UMWH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      OSSRC
                 FROM UMTS_NSN_HO_WCEL_HOU2
                WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
                GROUP BY PERIOD_START_TIME, OSSRC
              ),
 IUMWH_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM UMWH
              ),
 IUMWH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM IUMWH_ONE
                GROUP BY FECHA
              ),
      UMNH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      ELEMENT_CLASS
                 FROM UMTS_NSN_HO_NE_HOUR
                WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
                GROUP BY PERIOD_START_TIME, ELEMENT_CLASS
              ),
 IUMNH_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(ELEMENT_CLASS, 'WBTS'   , CANTIDAD) WBS_CANTIDAD,
                      DECODE(ELEMENT_CLASS, 'RNC'    , CANTIDAD) RNC_CANTIDAD,
                      DECODE(ELEMENT_CLASS, 'ALM'    , CANTIDAD) ALM_CANTIDAD,
                      DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                      DECODE(ELEMENT_CLASS, 'CIUDAD' , CANTIDAD) CDD_CANTIDAD,
                      DECODE(ELEMENT_CLASS, 'PAIS'   , CANTIDAD) CTY_CANTIDAD
                 FROM UMNH
              ),
 IUMNH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(WBS_CANTIDAD) WBS_CANTIDAD,
                      MAX(RNC_CANTIDAD) RNC_CANTIDAD,
                      MAX(ALM_CANTIDAD) ALM_CANTIDAD,
                      MAX(MRC_CANTIDAD) MRC_CANTIDAD,
                      MAX(CDD_CANTIDAD) CDD_CANTIDAD,
                      MAX(CTY_CANTIDAD) CTY_CANTIDAD
                 FROM IUMNH_ONE
                GROUP BY FECHA
              )
SELECT RFC.FECHA,
       OSSRC3_CANTIDAD OSSRC3,
       OSSRC2_CANTIDAD OSSRC2,
       OSSRC1_CANTIDAD OSSRC1,
       WBS_CANTIDAD    WBS,
       RNC_CANTIDAD    RNC,
       ALM_CANTIDAD    ALM,
       MRC_CANTIDAD    MKT,
       CDD_CANTIDAD    CDD,
       CTY_CANTIDAD    CTY
  FROM RFC,
       IUMWH_TWO,
       IUMNH_TWO
 WHERE RFC.FECHA = IUMWH_TWO.FECHA (+)
   AND RFC.FECHA = IUMNH_TWO.FECHA (+)
 ORDER BY RFC.FECHA;
