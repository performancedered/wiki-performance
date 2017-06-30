-- Modificado: Cristian Farias.
-- Fecha: 16/09/2016
-- Motivo: Se modifican las queries para mostrar HOUR Celda y NE en una misma consulta.

---------------------------------------------------------------------------------------------------------------------------
-- Detail Tables Hourly
---------------------------------------------------------------------------------------------------------------------------

--Tab=DetailServiceHour&Ne
 
WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
              ),
      UMWH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      OSSRC
                 FROM UMTS_D_NSN_SERVICE_WCEL_HOUR
                WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
                GROUP BY PERIOD_START_TIME, OSSRC
              ),
 IUMWH_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM UMWH
              ),
 IUMWH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM IUMWH_ONE
                GROUP BY FECHA
              ),
      UMNH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      ELEMENT_CLASS
                 FROM UMTS_D_NSN_SERVICE_NE_HOUR
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
       OSSRC5_CANTIDAD OSSRC5,
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
 
--Tab=DetailCellResHour&Ne
 
WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
              ),
      UMWH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      OSSRC
                 FROM UMTS_D_NSN_CELLRES_WCEL_HOUR
                WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
                GROUP BY PERIOD_START_TIME, OSSRC
              ),
 IUMWH_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM UMWH
              ),
 IUMWH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM IUMWH_ONE
                GROUP BY FECHA
              ),
      UMNH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      ELEMENT_CLASS
                 FROM UMTS_D_NSN_CELLRES_NE_HOUR
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
       OSSRC5_CANTIDAD OSSRC5,
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

---------------------------------------------------------------------------------------------------------------------------
-- Master Tables Hourly
---------------------------------------------------------------------------------------------------------------------------

--Tab=MasterServiceHour&NE
 
WITH  RFC AS  (SELECT /*+ MATERIALIZE */ FECHA
                 FROM CALIDAD_STATUS_REFERENCES
                WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
              ),
      UMWH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      OSSRC
                 FROM UMTS_NSN_SERVICE_WCEL_HOU2
                WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
                GROUP BY PERIOD_START_TIME, OSSRC
              ),
 IUMWH_ONE AS (SELECT /*+ MATERIALIZE */ FECHA,
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM UMWH
              ),
 IUMWH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
                      MAX(OSSRC3_CANTIDAD) OSSRC3_CANTIDAD,
                      MAX(OSSRC2_CANTIDAD) OSSRC2_CANTIDAD,
                      MAX(OSSRC1_CANTIDAD) OSSRC1_CANTIDAD
                 FROM IUMWH_ONE
                GROUP BY FECHA
              ),
      UMNH AS (SELECT /*+ MATERIALIZE */ PERIOD_START_TIME FECHA,
                      COUNT(1) CANTIDAD,
                      ELEMENT_CLASS
                 FROM UMTS_NSN_SERVICE_NE_HOUR
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
       OSSRC5_CANTIDAD OSSRC5,
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

--Tab=MasterHOHour&Ne

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
                      DECODE(OSSRC, 'OSSRC5', CANTIDAD) OSSRC5_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC3', CANTIDAD) OSSRC3_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC2', CANTIDAD) OSSRC2_CANTIDAD,
                      DECODE(OSSRC, 'OSSRC1', CANTIDAD) OSSRC1_CANTIDAD 
                 FROM UMWH
              ),
 IUMWH_TWO AS (SELECT /*+ MATERIALIZE */ FECHA,
                      MAX(OSSRC5_CANTIDAD) OSSRC5_CANTIDAD,
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
       OSSRC5_CANTIDAD OSSRC5,
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
