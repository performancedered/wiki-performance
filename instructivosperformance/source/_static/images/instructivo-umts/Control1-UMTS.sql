-- Modificado: Cristian Farias.
-- Fecha: 08/09/2016
-- Motivo: Se divide la querie en 3 para mostrar los datos por cada OSSRC.

--Tab=OSSRC1
SELECT RFC.FECHA,
       'OSSRC1' OSSRC,
       SRL.CANTIDAD SRL_CNT,
       TRF.CANTIDAD TRF_CNT,
       CRS.CANTIDAD CRS_CNT,
       HSW.CANTIDAD HSW_CNT,
       CTP.CANTIDAD CTP_CNT,
       RRC.CANTIDAD RRC_CNT,
       YHO.CANTIDAD YHO_CNT,
       SHO.CANTIDAD SHO_CNT,
       IHO.CANTIDAD IHO_CNT,
       CTW.CANTIDAD CTW_CNT,
       CPI.CANTIDAD CPI_CNT,
       L3I.CANTIDAD L3I_CNT,
       PKT.CANTIDAD PKT_CNT
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
       ) RFC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SERVLEV_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
          AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) SRL,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_TRAFFIC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) TRF,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLRES_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) CRS,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_HSDPAW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) HSW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLTP_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) CTP,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_RRC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) RRC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTSYSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) YHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SOFTHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) SHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTERSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) IHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELTPW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) CTW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CPICHQ_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) CPI,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_L3IUB_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) L3I,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_PKTCALL_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC1'
         GROUP BY PERIOD_START_TIME
       ) PKT
 WHERE RFC.FECHA = SRL.FECHA (+)
   AND RFC.FECHA = TRF.FECHA (+)
   AND RFC.FECHA = CRS.FECHA (+)
   AND RFC.FECHA = HSW.FECHA (+)
   AND RFC.FECHA = CTP.FECHA (+)
   AND RFC.FECHA = RRC.FECHA (+)
   AND RFC.FECHA = YHO.FECHA (+)
   AND RFC.FECHA = SHO.FECHA (+)
   AND RFC.FECHA = IHO.FECHA (+)
   AND RFC.FECHA = CTW.FECHA (+)
   AND RFC.FECHA = CPI.FECHA (+)
   AND RFC.FECHA = L3I.FECHA (+)
   AND RFC.FECHA = PKT.FECHA (+)
 ORDER BY RFC.FECHA;
 
 --Tab=OSSRC2
SELECT RFC.FECHA,
       'OSSRC2' OSSRC,
       SRL.CANTIDAD SRL_CNT,
       TRF.CANTIDAD TRF_CNT,
       CRS.CANTIDAD CRS_CNT,
       HSW.CANTIDAD HSW_CNT,
       CTP.CANTIDAD CTP_CNT,
       RRC.CANTIDAD RRC_CNT,
       YHO.CANTIDAD YHO_CNT,
       SHO.CANTIDAD SHO_CNT,
       IHO.CANTIDAD IHO_CNT,
       CTW.CANTIDAD CTW_CNT,
       CPI.CANTIDAD CPI_CNT,
       L3I.CANTIDAD L3I_CNT,
       PKT.CANTIDAD PKT_CNT
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
       ) RFC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SERVLEV_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
          AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) SRL,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_TRAFFIC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) TRF,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLRES_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) CRS,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_HSDPAW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) HSW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLTP_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) CTP,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_RRC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) RRC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTSYSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) YHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SOFTHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) SHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTERSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) IHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELTPW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) CTW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CPICHQ_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) CPI,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_L3IUB_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) L3I,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_PKTCALL_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC2'
         GROUP BY PERIOD_START_TIME
       ) PKT
 WHERE RFC.FECHA = SRL.FECHA (+)
   AND RFC.FECHA = TRF.FECHA (+)
   AND RFC.FECHA = CRS.FECHA (+)
   AND RFC.FECHA = HSW.FECHA (+)
   AND RFC.FECHA = CTP.FECHA (+)
   AND RFC.FECHA = RRC.FECHA (+)
   AND RFC.FECHA = YHO.FECHA (+)
   AND RFC.FECHA = SHO.FECHA (+)
   AND RFC.FECHA = IHO.FECHA (+)
   AND RFC.FECHA = CTW.FECHA (+)
   AND RFC.FECHA = CPI.FECHA (+)
   AND RFC.FECHA = L3I.FECHA (+)
   AND RFC.FECHA = PKT.FECHA (+)
 ORDER BY RFC.FECHA;
 
 --Tab=OSSRC3
SELECT RFC.FECHA,
       'OSSRC3' OSSRC,
       SRL.CANTIDAD SRL_CNT,
       TRF.CANTIDAD TRF_CNT,
       CRS.CANTIDAD CRS_CNT,
       HSW.CANTIDAD HSW_CNT,
       CTP.CANTIDAD CTP_CNT,
       RRC.CANTIDAD RRC_CNT,
       YHO.CANTIDAD YHO_CNT,
       SHO.CANTIDAD SHO_CNT,
       IHO.CANTIDAD IHO_CNT,
       CTW.CANTIDAD CTW_CNT,
       CPI.CANTIDAD CPI_CNT,
       L3I.CANTIDAD L3I_CNT,
       PKT.CANTIDAD PKT_CNT
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
       ) RFC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SERVLEV_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
          AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) SRL,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_TRAFFIC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) TRF,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLRES_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) CRS,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_HSDPAW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) HSW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLTP_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) CTP,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_RRC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) RRC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTSYSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) YHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SOFTHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) SHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTERSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) IHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELTPW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) CTW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CPICHQ_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) CPI,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_L3IUB_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) L3I,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_PKTCALL_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC3'
         GROUP BY PERIOD_START_TIME
       ) PKT
 WHERE RFC.FECHA = SRL.FECHA (+)
   AND RFC.FECHA = TRF.FECHA (+)
   AND RFC.FECHA = CRS.FECHA (+)
   AND RFC.FECHA = HSW.FECHA (+)
   AND RFC.FECHA = CTP.FECHA (+)
   AND RFC.FECHA = RRC.FECHA (+)
   AND RFC.FECHA = YHO.FECHA (+)
   AND RFC.FECHA = SHO.FECHA (+)
   AND RFC.FECHA = IHO.FECHA (+)
   AND RFC.FECHA = CTW.FECHA (+)
   AND RFC.FECHA = CPI.FECHA (+)
   AND RFC.FECHA = L3I.FECHA (+)
   AND RFC.FECHA = PKT.FECHA (+)
 ORDER BY RFC.FECHA;
 
 --Tab=OSSRC5
SELECT RFC.FECHA,
       'OSSRC5' OSSRC,
       SRL.CANTIDAD SRL_CNT,
       TRF.CANTIDAD TRF_CNT,
       CRS.CANTIDAD CRS_CNT,
       HSW.CANTIDAD HSW_CNT,
       CTP.CANTIDAD CTP_CNT,
       RRC.CANTIDAD RRC_CNT,
       YHO.CANTIDAD YHO_CNT,
       SHO.CANTIDAD SHO_CNT,
       IHO.CANTIDAD IHO_CNT,
       CTW.CANTIDAD CTW_CNT,
       CPI.CANTIDAD CPI_CNT,
       L3I.CANTIDAD L3I_CNT,
       PKT.CANTIDAD PKT_CNT
  FROM (
        SELECT FECHA
          FROM CALIDAD_STATUS_REFERENCES
         WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                         AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
       ) RFC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SERVLEV_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399 / 86400
          AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) SRL,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_TRAFFIC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) TRF,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLRES_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) CRS,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_HSDPAW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) HSW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELLTP_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) CTP,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_RRC_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) RRC,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTSYSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) YHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_SOFTHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) SHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_INTERSHO_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) IHO,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CELTPW_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) CTW,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_CPICHQ_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) CPI,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_L3IUB_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) L3I,
       (
        SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD
          FROM UMTS_C_NSN_PKTCALL_MNC1_RAW
         WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                     AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
           AND OSSRC = 'OSSRC5'
         GROUP BY PERIOD_START_TIME
       ) PKT
 WHERE RFC.FECHA = SRL.FECHA (+)
   AND RFC.FECHA = TRF.FECHA (+)
   AND RFC.FECHA = CRS.FECHA (+)
   AND RFC.FECHA = HSW.FECHA (+)
   AND RFC.FECHA = CTP.FECHA (+)
   AND RFC.FECHA = RRC.FECHA (+)
   AND RFC.FECHA = YHO.FECHA (+)
   AND RFC.FECHA = SHO.FECHA (+)
   AND RFC.FECHA = IHO.FECHA (+)
   AND RFC.FECHA = CTW.FECHA (+)
   AND RFC.FECHA = CPI.FECHA (+)
   AND RFC.FECHA = L3I.FECHA (+)
   AND RFC.FECHA = PKT.FECHA (+)
 ORDER BY RFC.FECHA;

