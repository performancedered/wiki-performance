/*TABLERO PARTICIPACION 4G MERCADO*/
WITH DATOS_3G AS  (SELECT /*+ MATERIALIZED */
                           T1.FECHA,
                           O1.MERCADO,
                           ROUND((SUM(HS_DSCH_DATA_VOL) / (1024 * 1024 * 1024)), 2) HSDPAMACDGB,
                           ROUND((SUM(NRT_DCH_DL_DATA_VOL) / (1024 * 1024 * 1024)), 2) DLR99MACDGB,      
                           ROUND(DECODE(SUM(HSDPA_ACT_USR_DEN),0,0,
                                       (SUM(HSDPA_ACT_USR_NUM)) / (SUM(HSDPA_ACT_USR_DEN))),2) HSDPAACTUSERAVG,
                           ROUND(100 * DECODE((SUM(HSDPA_ACCESS_USR_DEN)), 0, 1,
                                              (SUM(HSDPA_ACCESS_USR_NUM) / SUM(HSDPA_ACCESS_USR_DEN))), 2) ACCESIBILITYHSDPA
                      FROM OBJECTS_SP_UMTS             O1,
                           UMTS_NSN_HSDPA_WCEL_DAYW    T1,
                           UMTSC_NSN_MACD_WCEL_DAYW    T2
                     WHERE T2.PERIOD_START_TIME(+) = T1.FECHA
                       AND T2.WCELL_ID(+) = T1.INT_ID
                       --AND T1.FECHA > ADD_MONTHS(SYSDATE, -12) + F_CALCULO_BISIESTO_WO_FECHA
                       AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                       AND O1.WCELL_ID = T1.INT_ID
                     GROUP BY T1.FECHA, O1.MERCADO
                     ORDER BY T1.FECHA, O1.MERCADO
                     ),
      DATOS_2G AS  (SELECT /*+ MATERIALIZED */
                           T1.FECHA,
                           O1.MERCADO,
                           NVL(ROUND((/*SUM(GPRS_UL_TRAFFIC) +*/ SUM(T1.GPRS_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLGPRS,
                           NVL(ROUND((/*SUM(EDGE_UL_TRAFFIC) +*/ SUM(T1.EDGE_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLEDGE
                      FROM OBJECTS_SP_GSM O1, MULTIVENDOR_GPRS_DAYW T1
                     WHERE T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                       AND O1.BTS_ID = T1.INT_ID
                     GROUP BY T1.FECHA, O1.MERCADO
                     ORDER BY T1.FECHA, O1.MERCADO
                    ),
          DATOS_4G AS  (SELECT /*+ MATERIALIZED */
                       T1.FECHA,
                       O1.MERCADO,
                       ROUND((T1.TRAFICO_DL / 1000), 2) TRAFFICDL4G,
                       ROUND(DECODE(T1.RRC_CONN_STP_SUCCESS_DEN, 0, 0,
                                   (T1.RRC_CONN_STP_SUCCESS_NUM / T1.RRC_CONN_STP_SUCCESS_DEN) *
                            (DECODE(T1.RAB_SETUP_SUCCESS_DEN, 0, 0,
                                   (T1.RAB_SETUP_SUCCESS_NUM / T1.RAB_SETUP_SUCCESS_DEN)))) * 100, 2) ACCESIBILITYLTE
                  FROM OBJECTS_SP_LTE_NE       O1,
                       LTE_NSN_SERVICE_NE_DAYW T1
                 WHERE T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                   AND T1.ELEMENT_ID = O1.ELEMENT_ID
                   AND T1.ELEMENT_CLASS = O1.ELEMENT_CLASS
                   AND O1.ELEMENT_CLASS = 'MERCADO'
                 ORDER BY T1.FECHA, O1.MERCADO      
              ),
      NODOS_3G_4G AS (SELECT MERCADO,
                       COUNT(sitio3G_U) sitio3G_U,
                       COUNT(sitio3G_D) sitio3G_D,
                       COUNT(sitio3G_S) sitio3G_S,
                       COUNT(sitio3G_T) sitio3G_T,
                       --NULL,
                       COUNT(sitio4G) sitio4G
                   FROM(
                        SELECT total.sitio,
                               MAX(dosG.nombre) sitio2g,
                               MAX(tresG_U.nombre) sitio3G_U,
                               MAX(tresG_D.nombre) sitio3g_D,
                               MAX(tresG_S.nombre) sitio3g_S,
                               MAX(tresG_T.nombre) sitio3g_T,
                               MAX(cuatroG.nombre) sitio4G,
                               total.mercado,
                               /*total.provincia,
                               total.localidad,*/
                               total.pais
                          FROM (SELECT DISTINCT BCF_NAME SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                                  FROM OBJECTS_SP_GSM
                                 WHERE BCF_VALID_FINISH_DATE > SYSDATE
                                UNION
                                SELECT LNBTS_WOFL_NAME SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                                  FROM OBJECTS_SP_LTE_NE
                                 WHERE ELEMENT_CLASS = 'LNBTS'
                                   AND LNBTS_VALID_FINISH_DATE > SYSDATE
                                UNION
                                SELECT WBTS_WOFL_NAME SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                                  FROM OBJECTS_SP_UMTS_NE
                                 WHERE ELEMENT_CLASS = 'WBTS'
                                   AND WBTS_VALID_FINISH_DATE > SYSDATE) Total
                          LEFT JOIN (SELECT DISTINCT BCF_NAME SITIO, BCF_NAME NOMBRE
                                       FROM OBJECTS_SP_GSM
                                      WHERE BCF_VALID_FINISH_DATE > SYSDATE) dosG
                            ON total.sitio = dosg.sitio
                          LEFT JOIN (SELECT LNBTS_WOFL_NAME SITIO, ELEMENT_NAME NOMBRE
                                       FROM OBJECTS_SP_LTE_NE
                                      WHERE ELEMENT_CLASS = 'LNBTS'
                                        AND LNBTS_VALID_FINISH_DATE > SYSDATE) cuatroG
                            ON total.sitio = cuatrog.sitio
                          LEFT JOIN (SELECT WBTS_WOFL_NAME SITIO, ELEMENT_NAME NOMBRE --U
                                       FROM OBJECTS_SP_UMTS_NE
                                      WHERE ELEMENT_CLASS = 'WBTS'
                                        and element_name like 'U%'
                                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_U
                            ON total.sitio = tresg_u.sitio
                          LEFT JOIN (SELECT WBTS_WOFL_NAME SITIO, ELEMENT_NAME NOMBRE --D
                                       FROM OBJECTS_SP_UMTS_NE
                                      WHERE ELEMENT_CLASS = 'WBTS'
                                        and element_name like 'D%'
                                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_D
                            ON total.sitio = tresg_d.sitio
                          LEFT JOIN (SELECT WBTS_WOFL_NAME SITIO, ELEMENT_NAME NOMBRE --S
                                       FROM OBJECTS_SP_UMTS_NE
                                      WHERE ELEMENT_CLASS = 'WBTS'
                                        and element_name like 'S%'
                                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_S
                            ON total.sitio = tresg_s.sitio
                          LEFT JOIN (SELECT WBTS_WOFL_NAME SITIO, ELEMENT_NAME NOMBRE --T
                                       FROM OBJECTS_SP_UMTS_NE
                                      WHERE ELEMENT_CLASS = 'WBTS'
                                        and element_name like 'T%'
                                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_T
                            ON total.sitio = tresg_t.sitio
                         GROUP BY total.sitio, total.pais, total.mercado
                         )
                GROUP BY MERCADO
                ORDER BY MERCADO
                 ),
         THP_3G_MERCADO AS (SELECT DISTINCT /*+ ORDERED */ O1.MERCADO,
                                          T1.FECHA,
                                          ROUND(DECODE((HSDPA_BUFF_WITH_DATA_PER_TTI),0,0,
                                                       (RECEIVED_HS_MACD_BITS) / ((HSDPA_BUFF_WITH_DATA_PER_TTI) / 500)), 2) THP_USER_3G,
                                          ROUND(DECODE((HSDPA_BUFF_WITH_DATA_PER_TTI),0,0,
                                                       (RECEIVED_HS_MACD_BITS - DISCARDED_HS_MACD_BITS) /
                                                       ((HS_SCCH_PWR_DIST_CLASS_0 +
                                                       HS_SCCH_PWR_DIST_CLASS_1 +
                                                       HS_SCCH_PWR_DIST_CLASS_2 +
                                                       HS_SCCH_PWR_DIST_CLASS_3 +
                                                       HS_SCCH_PWR_DIST_CLASS_4 +
                                                       HS_SCCH_PWR_DIST_CLASS_5) / 500)), 2) THP_CELL_3G
                          
                            FROM ALM_MERCADO                 O1,
                                 UMTS_NSN_SERVICE_MKT_DAYW   T1,
                                 UMTS_NSN_HSDPA_MKT_DAYW     T2,
                                 UMTSC_NSN_HSDPA_MKT_DAYW    T3
                           WHERE T2.FECHA(+) = T1.FECHA
                             AND T2.MERCADO(+) = T1.MERCADO
                          AND T3.FECHA(+) = T1.FECHA
                             AND T3.MERCADO(+) = T1.MERCADO
                                --AND T1.MERCADO = 'AMBA'
                             AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000  
                             AND O1.MERCADO = T1.MERCADO
                           ORDER BY O1.MERCADO, T1.FECHA
                          ),
          THP_CELDA_4G_MERCADO AS (SELECT ELEMENT_ID,
                                         FECHA,
                                         ROUND((AVG_PDCP_CELL_THP_DL_NUM * 8 / AVG_PDCP_CELL_THP_DL_DEN),2)     THP_CELL_LTE,
                                         --(AVG_PDCP_CELL_THP_UL_NUM * 8 / AVG_PDCP_CELL_THP_UL_DEN)     "Cell Throughput UL"
                                         ROUND((AVG_USER_DL_TPUT_NUM	/ AVG_USER_DL_TPUT_DEN),2)	                 THP_USER_LTE,
                                         --AVG_USER_UL_TPUT_NUM	/ AVG_USER_UL_TPUT_DEN	
                                         ROUND(DECODE((EUTR_AVG_ACT_CON_UE_NUM / EUTR_AVG_ACT_CON_UE_DEN),0,0,
                                         (EUTR_AVG_ACT_CON_UE_NUM / EUTR_AVG_ACT_CON_UE_DEN)),2) LTEACTUSERAVG
                                    FROM LTE_NSN_SERVICE_NE_DAYW
                                   WHERE ELEMENT_CLASS IN ( 'MERCADO')
                                     AND FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000
                                     AND ELEMENT_ID NOT IN ('No Especificado')
                                     --AND ELEMENT_ID NOT IN ('Paraguay')
                                  ORDER BY ELEMENT_CLASS DESC, ELEMENT_ID, FECHA
                      )
  SELECT  DISTINCT DATOS_3G.MERCADO,
          DATOS_3G.FECHA, 
          DATOS_3G.HSDPAMACDGB TRAFICOHSDPA,
          DATOS_3G.DLR99MACDGB,
          DATOS_3G.HSDPAACTUSERAVG,
          DATOS_3G.ACCESIBILITYHSDPA,
          DATOS_2G.TRAFFICDLGPRS,
          DATOS_2G.TRAFFICDLEDGE,
          DATOS_4G.TRAFFICDL4G TRAFICOLTE,
          DATOS_4G.ACCESIBILITYLTE,
          THP_CELDA_4G_MERCADO.LTEACTUSERAVG,--USUARIOS_4G.CELL_LOAD_ACT_UE_AVG  LTEACTUSERAVG,
          (ROUND(DATOS_4G.TRAFFICDL4G+DATOS_2G.TRAFFICDLEDGE+DATOS_2G.TRAFFICDLGPRS+DATOS_3G.DLR99MACDGB+DATOS_3G.HSDPAMACDGB,2)) TRAFICOTOTAL,
          (ROUND(DATOS_4G.TRAFFICDL4G/(DATOS_4G.TRAFFICDL4G+DATOS_2G.TRAFFICDLEDGE+DATOS_2G.TRAFFICDLGPRS+DATOS_3G.DLR99MACDGB+DATOS_3G.HSDPAMACDGB)*100,2)) PARTICIPACION4G,
          NODOS_3G_4G.sitio3G_U,
          NODOS_3G_4G.sitio3G_D,
          NODOS_3G_4G.sitio3G_S,
          NODOS_3G_4G.sitio3G_T,
          GREATEST(NODOS_3G_4G.sitio3G_U,NODOS_3G_4G.sitio3G_D,NODOS_3G_4G.sitio3G_S,NODOS_3G_4G.sitio3G_T) sitio3G,
          NODOS_3G_4G.sitio4G,
          THP_3G_MERCADO.THP_USER_3G,
          THP_3G_MERCADO.THP_CELL_3G,
          THP_CELDA_4G_MERCADO.THP_CELL_LTE,
          THP_CELDA_4G_MERCADO.THP_USER_LTE
    FROM  DATOS_3G,
          DATOS_2G,
          DATOS_4G,
          NODOS_3G_4G,
          THP_3G_MERCADO,
          THP_CELDA_4G_MERCADO
   WHERE DATOS_3G.FECHA = DATOS_2G.FECHA (+)
  AND DATOS_3G.FECHA = DATOS_4G.FECHA (+)
  AND DATOS_3G.FECHA = THP_3G_MERCADO.FECHA (+)
  AND DATOS_3G.FECHA = THP_CELDA_4G_MERCADO.FECHA (+)
  AND DATOS_3G.MERCADO = DATOS_2G.MERCADO
  AND DATOS_3G.MERCADO = DATOS_4G.MERCADO
  AND DATOS_3G.MERCADO = NODOS_3G_4G.MERCADO
  AND DATOS_3G.MERCADO = THP_3G_MERCADO.MERCADO
  AND DATOS_3G.MERCADO = THP_CELDA_4G_MERCADO.ELEMENT_ID
  ORDER BY DATOS_3G.FECHA, DATOS_3G.MERCADO
