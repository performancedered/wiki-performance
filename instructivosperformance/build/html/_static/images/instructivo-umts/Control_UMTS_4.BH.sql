
-- Autor: Mario Heredia. Fecha: 20.05.2014.
-- Actualizacion: Mario Heredia. Fecha: 13.07.2016.

--Tab=UmtsCntBHHo
SELECT RFC.FECHA,
       'COUNTERS BH' NIVEL,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_WCEL_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_RNC_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_ALM_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_MKT_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_PAIS_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsKpiBHHo
SELECT RFC.FECHA,
       'INDICATORS BH' NIVEL,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_WCEL_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_RNC_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_ALM_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_MKT_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_PAIS_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;
 

--Tab=UmtsCntBhHsdpa
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'BH'         SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_WCEL_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_RNC_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_ALM_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_MKT_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_PAIS_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsKpiBhHsdpa
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'BH'         SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_WCEL_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_RNC_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_ALM_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_MKT_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_PAIS_BH
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsCntBHCService
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'BHC'        SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_WCEL_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_RNC_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_ALM_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_MKT_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_PAIS_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsKpiBHCService
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'BHC'        SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_WCEL_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_RNC_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_ALM_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_MKT_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_PAIS_BHC
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsCntBHPService
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'BHP'        SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_WCEL_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_RNC_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_ALM_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_MKT_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_PAIS_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;

--Tab=UmtsKpiBHPService
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'BHP'        SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_WCEL_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_RNC_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_ALM_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_MKT_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_PAIS_BHP
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;


--Tab=UmtsCntBhMacD
SELECT RFC.FECHA,
       'COUNTERS DAY' NIVEL,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_WCEL_BH
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) WCE,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_RNC_BH
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) RNC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_ALM_BH
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) ALM,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_MKT_BH
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) MKT,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_PAIS_BH
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;
