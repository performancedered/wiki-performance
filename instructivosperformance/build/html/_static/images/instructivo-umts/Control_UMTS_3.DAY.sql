
-- Autor: Mario Heredia. Fecha: 20.05.2014.
-- Actualizacion: Mario Heredia. Fecha: 13.07.2016.

--Tab=UmtsCntDayHo
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
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HO_PAIS_DAY
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

--Tab=UmtsKpiDayHo
SELECT RFC.FECHA,
       'INDICATORS DAY' NIVEL,
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
          FROM UMTS_NSN_HO_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HO_PAIS_DAY
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

 
 --Tab=UmtsCntDayHsdpa
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'DAY'        SUMRY,
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
          FROM UMTSC_NSN_HSDPA_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_HSDPA_PAIS_DAY
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

--Tab=UmtsKpiDayHsdpa
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'DAY'        SUMRY,
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
          FROM UMTS_NSN_HSDPA_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_HSDPA_PAIS_DAY
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


--Tab=UmtsCntDayService
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'DAY'        SUMRY,
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
          FROM UMTSC_NSN_SERVICE_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_PAIS_DAY
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

--Tab=UmtsKpiDayService
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'DAY'        SUMRY,
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
          FROM UMTS_NSN_SERVICE_WCEL_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_RNC_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_ALM_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_MKT_DAY
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_PAIS_DAY
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


--Tab=UmtsCntDayMacD
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
          FROM UMTSC_NSN_MACD_WCEL_DAY
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) WCE,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_RNC_DAY
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) RNC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_ALM_DAY
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) ALM,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_MKT_DAY
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
         GROUP BY PERIOD_START_TIME 
       ) MKT,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_MACD_PAIS_DAY
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
