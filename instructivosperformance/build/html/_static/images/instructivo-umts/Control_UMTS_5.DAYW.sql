--Tab=C_DAYWService
SELECT RFC.FECHA,
       'COUNTERS'   NIVEL,
       'DAYW'     SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT UNIQUE(DOMINGO) FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE DOMINGO BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_WCEL_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_RNC_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_ALM_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_MKT_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTSC_NSN_SERVICE_PAIS_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
   --AND WCE.CANTIDAD >= '0'
 ORDER BY RFC.FECHA;

--Tab=Kpi_DAYWService
SELECT RFC.FECHA,
       'INDICATORS' NIVEL,
       'DAYW'     SUMRY,
       WCE.CANTIDAD WCE,
       RNC.CANTIDAD RNC,
       ALM.CANTIDAD ALM,
       MKT.CANTIDAD MKT,
       CTY.CANTIDAD CTY
  FROM (
        SELECT UNIQUE(DOMINGO) FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE DOMINGO BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
           AND HORA = '00'
       ) RFC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_WCEL_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) WCE,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_RNC_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) RNC,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_ALM_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) ALM,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_MKT_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) MKT,
       (
        SELECT FECHA, COUNT(*) CANTIDAD
          FROM UMTS_NSN_SERVICE_PAIS_DAYW
         WHERE FECHA BETWEEN TO_DATE('&DateFrom', 'DD.MM.YYYY')
                         AND TO_DATE('&DateTo', 'DD.MM.YYYY') + 86399/86400
         GROUP BY FECHA
       ) CTY
 WHERE RFC.FECHA = WCE.FECHA (+)
   AND RFC.FECHA = RNC.FECHA (+)
   AND RFC.FECHA = ALM.FECHA (+)
   AND RFC.FECHA = MKT.FECHA (+)
   AND RFC.FECHA = CTY.FECHA (+)
 ORDER BY RFC.FECHA;
