/*TABLERO PARTICIPACION 4G CIUDAD*/
WITH  DATOS_3G AS  (SELECT /*+ MATERIALIZED */
                             T1.FECHA,
                             O1.PROVINCIA,
                             O1.LOCALIDAD, 
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
                         AND (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                      ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                      ('CHACO','RESISTENCIA'),
                      ('CHUBUT','RAWSON'),
                      ('CORDOBA','CORDOBA'),
                      ('CORRIENTES','CORRIENTES'),
                      ('ENTRE RIOS','PARANA'),
                      ('FORMOSA','FORMOSA'),
                      ('JUJUY','SAN SALVADOR DE JUJUY'),
                      ('LA PAMPA','SANTA ROSA'),
                      ('LA RIOJA','LA RIOJA'),
                      ('MENDOZA','MENDOZA'),
                      ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                      ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                      ('NEUQUEN','NEUQUEN'),
                      ('RIO NEGRO','VIEDMA'),
                      ('SALTA','SALTA'),
                      ('SAN JUAN','SAN JUAN'),
                      ('SAN LUIS','SAN LUIS'),
                      ('SANTA CRUZ','RIO GALLEGOS'),
                      ('SANTA FE','SANTA FE'),
                      ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                      ('TIERRA DEL FUEGO','USHUAIA'),
                      ('TUCUMAN','SAN MIGUEL DE TUCUMAN')) --(SELECT F_PROV_LOC() FROM DUAL)--RESULTADO DE LA FUNCION
                         --AND T1.FECHA > ADD_MONTHS(SYSDATE, -12) + F_CALCULO_BISIESTO_WO_FECHA
                         AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                         AND O1.WCELL_ID = T1.INT_ID
                       GROUP BY T1.FECHA, O1.PROVINCIA, O1.LOCALIDAD
                       ORDER BY T1.FECHA, O1.PROVINCIA
                ),
        DATOS_2G AS  (SELECT /*+ MATERIALIZED */
                               T1.FECHA,
                               O1.PROVINCIA,
                               O1.LOCALIDAD,
                               NVL(ROUND((/*SUM(GPRS_UL_TRAFFIC) +*/ SUM(T1.GPRS_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLGPRS,
                               NVL(ROUND((/*SUM(EDGE_UL_TRAFFIC) +*/ SUM(T1.EDGE_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLEDGE
                          FROM OBJECTS_SP_GSM O1, MULTIVENDOR_GPRS_DAYW T1
                          WHERE (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                      ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                      ('CHACO','RESISTENCIA'),
                      ('CHUBUT','RAWSON'),
                      ('CORDOBA','CORDOBA'),
                      ('CORRIENTES','CORRIENTES'),
                      ('ENTRE RIOS','PARANA'),
                      ('FORMOSA','FORMOSA'),
                      ('JUJUY','SAN SALVADOR DE JUJUY'),
                      ('LA PAMPA','SANTA ROSA'),
                      ('LA RIOJA','LA RIOJA'),
                      ('MENDOZA','MENDOZA'),
                      ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                      ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                      ('NEUQUEN','NEUQUEN'),
                      ('RIO NEGRO','VIEDMA'),
                      ('SALTA','SALTA'),
                      ('SAN JUAN','SAN JUAN'),
                      ('SAN LUIS','SAN LUIS'),
                      ('SANTA CRUZ','RIO GALLEGOS'),
                      ('SANTA FE','SANTA FE'),
                      ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                      ('TIERRA DEL FUEGO','USHUAIA'),
                      ('TUCUMAN','SAN MIGUEL DE TUCUMAN'))
                       AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000  
                       AND O1.BTS_ID = T1.INT_ID
                     GROUP BY T1.FECHA, O1.PROVINCIA, O1.LOCALIDAD
                     ORDER BY T1.FECHA, O1.PROVINCIA
                ),
        DATOS_4G AS  (SELECT /*+ MATERIALIZED */
                               T1.FECHA,
                               O1.PROVINCIA,
                               O1.LOCALIDAD,
                               ROUND(SUM(T1.TRAFICO_DL / 1000), 2) TRAFFICDL4G,
                               ROUND(DECODE(SUM(T1.RRC_CONN_STP_SUCCESS_DEN), 0, 0,
                                           (SUM(T1.RRC_CONN_STP_SUCCESS_NUM) / SUM(T1.RRC_CONN_STP_SUCCESS_DEN)) *
                                    (DECODE(SUM(T1.RAB_SETUP_SUCCESS_DEN), 0, 0,
                                           (SUM(T1.RAB_SETUP_SUCCESS_NUM) / SUM(T1.RAB_SETUP_SUCCESS_DEN))))) * 100, 2) ACCESIBILITYLTE
                          FROM OBJECTS_SP_LTE_NE       O1,
                               LTE_NSN_SERVICE_NE_DAYW T1
                         WHERE (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                          ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                          ('CHACO','RESISTENCIA'),
                          ('CHUBUT','RAWSON'),
                          ('CORDOBA','CORDOBA'),
                          ('CORRIENTES','CORRIENTES'),
                          ('ENTRE RIOS','PARANA'),
                          ('FORMOSA','FORMOSA'),
                          ('JUJUY','SAN SALVADOR DE JUJUY'),
                          ('LA PAMPA','SANTA ROSA'),
                          ('LA RIOJA','LA RIOJA'),
                          ('MENDOZA','MENDOZA'),
                          ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                          ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                          ('NEUQUEN','NEUQUEN'),
                          ('RIO NEGRO','VIEDMA'),
                          ('SALTA','SALTA'),
                          ('SAN JUAN','SAN JUAN'),
                          ('SAN LUIS','SAN LUIS'),
                          ('SANTA CRUZ','RIO GALLEGOS'),
                          ('SANTA FE','SANTA FE'),
                          ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                          ('TIERRA DEL FUEGO','USHUAIA'),
                          ('TUCUMAN','SAN MIGUEL DE TUCUMAN')
                                              )
                           AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                           AND T1.ELEMENT_ID = O1.ELEMENT_ID
                           AND T1.ELEMENT_CLASS = O1.ELEMENT_CLASS
                           AND O1.ELEMENT_CLASS = 'LNBTS'
                         GROUP BY T1.FECHA,
                                  O1.PROVINCIA,
                                  O1.LOCALIDAD
                         ORDER BY T1.FECHA, O1.PROVINCIA
                ),
        NODOS_3G_4G AS (SELECT PROVINCIA,
                       LOCALIDAD,
                       COUNT(sitio3G_U) sitio3G_U,
                       COUNT(sitio3G_D) sitio3G_D,
                       COUNT(sitio3G_S) sitio3G_S,
                       COUNT(sitio3G_T) sitio3G_T,
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
                               total.provincia,
                               total.localidad,
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
                         GROUP BY total.sitio, total.pais, total.mercado, total.localidad, total.provincia
                         )
                WHERE (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                                                  ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                                                  ('CHACO','RESISTENCIA'),
                                                  ('CHUBUT','RAWSON'),
                                                  ('CORDOBA','CORDOBA'),
                                                  ('CORRIENTES','CORRIENTES'),
                                                  ('ENTRE RIOS','PARANA'),
                                                  ('FORMOSA','FORMOSA'),
                                                  ('JUJUY','SAN SALVADOR DE JUJUY'),
                                                  ('LA PAMPA','SANTA ROSA'),
                                                  ('LA RIOJA','LA RIOJA'),
                                                  ('MENDOZA','MENDOZA'),
                                                  ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                                                  ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                                                  ('NEUQUEN','NEUQUEN'),
                                                  ('RIO NEGRO','VIEDMA'),
                                                  ('SALTA','SALTA'),
                                                  ('SAN JUAN','SAN JUAN'),
                                                  ('SAN LUIS','SAN LUIS'),
                                                  ('SANTA CRUZ','RIO GALLEGOS'),
                                                  ('SANTA FE','SANTA FE'),
                                                  ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                                                  ('TIERRA DEL FUEGO','USHUAIA'),
                                                  ('TUCUMAN','SAN MIGUEL DE TUCUMAN')
                                      )
                GROUP BY PROVINCIA, LOCALIDAD
                ORDER BY PROVINCIA
                ),
      THP_3G_CIUDAD AS (SELECT DISTINCT /*+ MATERIALIZED */ 
                                      T1.FECHA,
                                      O1.PROVINCIA,
                                      O1.LOCALIDAD,
                                      ROUND(DECODE(SUM(HSDPA_BUFF_WITH_DATA_PER_TTI),0,0,
                                                   (SUM(RECEIVED_HS_MACD_BITS) / (SUM(HSDPA_BUFF_WITH_DATA_PER_TTI) / 500))), 2) THP_USER_3G,
                                      ROUND(DECODE(SUM(HSDPA_BUFF_WITH_DATA_PER_TTI),0,0,
                                                   (SUM(RECEIVED_HS_MACD_BITS) - SUM(DISCARDED_HS_MACD_BITS)) /
                                                   (SUM(HS_SCCH_PWR_DIST_CLASS_0) +
                                                   SUM(HS_SCCH_PWR_DIST_CLASS_1) +
                                                   SUM(HS_SCCH_PWR_DIST_CLASS_2) +
                                                   SUM(HS_SCCH_PWR_DIST_CLASS_3) +
                                                   SUM(HS_SCCH_PWR_DIST_CLASS_4) +
                                                   SUM(HS_SCCH_PWR_DIST_CLASS_5) / 500)), 2) THP_CELL_3G
                      
                        FROM OBJECTS_SP_UMTS              O1,
                             UMTS_NSN_SERVICE_WCEL_DAYW   T1,
                             UMTS_NSN_HSDPA_WCEL_DAYW     T2,
                             UMTSC_NSN_HSDPA_WCEL_DAYW    T3
                       WHERE T2.FECHA(+) = T1.FECHA
                         AND T2.INT_ID = T1.INT_ID
                         AND T3.FECHA(+) = T1.FECHA
                         AND T3.INT_ID = T1.INT_ID
                         AND O1.WCELL_ID = T1.INT_ID 
                         AND T1.FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                         AND (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                                                                        ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                                                                        ('CHACO','RESISTENCIA'),
                                                                        ('CHUBUT','RAWSON'),
                                                                        ('CORDOBA','CORDOBA'),
                                                                        ('CORRIENTES','CORRIENTES'),
                                                                        ('ENTRE RIOS','PARANA'),
                                                                        ('FORMOSA','FORMOSA'),
                                                                        ('JUJUY','SAN SALVADOR DE JUJUY'),
                                                                        ('LA PAMPA','SANTA ROSA'),
                                                                        ('LA RIOJA','LA RIOJA'),
                                                                        ('MENDOZA','MENDOZA'),
                                                                        ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                                                                        ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                                                                        ('NEUQUEN','NEUQUEN'),
                                                                        ('RIO NEGRO','VIEDMA'),
                                                                        ('SALTA','SALTA'),
                                                                        ('SAN JUAN','SAN JUAN'),
                                                                        ('SAN LUIS','SAN LUIS'),
                                                                        ('SANTA CRUZ','RIO GALLEGOS'),
                                                                        ('SANTA FE','SANTA FE'),
                                                                        ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                                                                        ('TIERRA DEL FUEGO','USHUAIA'),
                                                                        ('TUCUMAN','SAN MIGUEL DE TUCUMAN')
                                            ) 
                      GROUP BY T1.FECHA,
                               O1.PROVINCIA,
                               O1.LOCALIDAD
                      ORDER BY PROVINCIA, FECHA
                      ),
        THP_CELDA_4G_CIUDAD AS (SELECT   ROUND(DECODE(SUM(T1.EUTR_AVG_ACT_CON_UE_NUM) / SUM(T1.EUTR_AVG_ACT_CON_UE_DEN),0,0,
                                        (SUM(T1.EUTR_AVG_ACT_CON_UE_NUM) / SUM(T1.EUTR_AVG_ACT_CON_UE_DEN))),2) LTEACTUSERAVG,
                                         T1.FECHA,
                                         O1.PROVINCIA,
                                         O1.LOCALIDAD,
                                         ROUND(SUM(AVG_PDCP_CELL_THP_DL_NUM) * 8 / SUM(AVG_PDCP_CELL_THP_DL_DEN),2) THP_CELL_LTE,
                                         ROUND(SUM(AVG_USER_DL_TPUT_NUM)	/ SUM(AVG_USER_DL_TPUT_DEN),2) THP_USER_LTE      
                                    FROM OBJECTS_SP_LTE_NE       O1,
                                         LTE_NSN_SERVICE_NE_DAYW T1
                                   WHERE (PROVINCIA,LOCALIDAD) IN (('BUENOS AIRES','LA PLATA'),
                                                                        ('CATAMARCA','SAN FERNANDO DEL VALLE DE CATAMARCA'),
                                                                        ('CHACO','RESISTENCIA'),
                                                                        ('CHUBUT','RAWSON'),
                                                                        ('CORDOBA','CORDOBA'),
                                                                        ('CORRIENTES','CORRIENTES'),
                                                                        ('ENTRE RIOS','PARANA'),
                                                                        ('FORMOSA','FORMOSA'),
                                                                        ('JUJUY','SAN SALVADOR DE JUJUY'),
                                                                        ('LA PAMPA','SANTA ROSA'),
                                                                        ('LA RIOJA','LA RIOJA'),
                                                                        ('MENDOZA','MENDOZA'),
                                                                        ('MISIONES','POSADAS (MUNICIPIO DE GARUPA)'),
                                                                        ('MISIONES','POSADAS (MUNICIPIO DE POSADAS)'),
                                                                        ('NEUQUEN','NEUQUEN'),
                                                                        ('RIO NEGRO','VIEDMA'),
                                                                        ('SALTA','SALTA'),
                                                                        ('SAN JUAN','SAN JUAN'),
                                                                        ('SAN LUIS','SAN LUIS'),
                                                                        ('SANTA CRUZ','RIO GALLEGOS'),
                                                                        ('SANTA FE','SANTA FE'),
                                                                        ('SANTIAGO DEL ESTERO','SANTIAGO DEL ESTERO'),
                                                                        ('TIERRA DEL FUEGO','USHUAIA'),
                                                                        ('TUCUMAN','SAN MIGUEL DE TUCUMAN')
                                                        )
                                     AND FECHA BETWEEN TRUNC(SYSDATE)-8 AND TRUNC(SYSDATE)-2 + 83999/84000 
                                     AND T1.ELEMENT_ID = O1.ELEMENT_ID
                                     AND T1.ELEMENT_CLASS = O1.ELEMENT_CLASS
                                     AND O1.ELEMENT_CLASS = 'LNBTS'
                                  GROUP BY T1.FECHA,
                                         O1.PROVINCIA,
                                         O1.LOCALIDAD
                                         --T1.EUTR_AVG_ACT_CON_UE_DEN / T1.AVG_USER_DL_TPUT_NUM
                                  ORDER BY PROVINCIA, FECHA
                              )
  SELECT DISTINCT DATOS_3G.FECHA, 
         DATOS_3G.PROVINCIA,
         DATOS_3G.LOCALIDAD,
         DATOS_3G.HSDPAMACDGB TRAFICOHSDPA,
         DATOS_3G.DLR99MACDGB,
         DATOS_3G.HSDPAACTUSERAVG,
         DATOS_3G.ACCESIBILITYHSDPA,
         DATOS_2G.TRAFFICDLGPRS,
         DATOS_2G.TRAFFICDLEDGE,
         DATOS_4G.TRAFFICDL4G TRAFICOLTE,
         TO_CHAR(DATOS_4G.ACCESIBILITYLTE,'90.99') ACCESIBILITYLTE,
         THP_CELDA_4G_CIUDAD.LTEACTUSERAVG,--USUARIOS_4G.CELL_LOAD_ACT_UE_AVG  LTEACTUSERAVG,
         (ROUND(DATOS_4G.TRAFFICDL4G+DATOS_2G.TRAFFICDLEDGE+DATOS_2G.TRAFFICDLGPRS+DATOS_3G.DLR99MACDGB+DATOS_3G.HSDPAMACDGB,2)) TRAFICOTOTAL,
         (ROUND(DATOS_4G.TRAFFICDL4G/(DATOS_4G.TRAFFICDL4G+DATOS_2G.TRAFFICDLEDGE+DATOS_2G.TRAFFICDLGPRS+DATOS_3G.DLR99MACDGB+DATOS_3G.HSDPAMACDGB)*100,2)) PARTICIPACION4G,
         NODOS_3G_4G.sitio3G_U,
         NODOS_3G_4G.sitio3G_D,
         NODOS_3G_4G.sitio3G_S,
         NODOS_3G_4G.sitio3G_T,
         GREATEST(NODOS_3G_4G.sitio3G_U,NODOS_3G_4G.sitio3G_D,NODOS_3G_4G.sitio3G_S,NODOS_3G_4G.sitio3G_T) sitio3G,
         NODOS_3G_4G.sitio4G,
         THP_3G_CIUDAD.THP_USER_3G,
         THP_3G_CIUDAD.THP_CELL_3G,
         THP_CELDA_4G_CIUDAD.THP_CELL_LTE,
         THP_CELDA_4G_CIUDAD.THP_USER_LTE
    FROM DATOS_3G,
         DATOS_2G,
         DATOS_4G,
         NODOS_3G_4G,
         THP_3G_CIUDAD,
         THP_CELDA_4G_CIUDAD
   WHERE DATOS_3G.FECHA = DATOS_2G.FECHA (+)
     AND DATOS_3G.FECHA = DATOS_4G.FECHA (+)
     AND DATOS_3G.FECHA = THP_3G_CIUDAD.FECHA (+)
     AND DATOS_3G.FECHA = THP_CELDA_4G_CIUDAD.FECHA (+)
     AND DATOS_3G.PROVINCIA = DATOS_2G.PROVINCIA
     AND DATOS_3G.PROVINCIA = DATOS_4G.PROVINCIA
     AND DATOS_3G.PROVINCIA = NODOS_3G_4G.PROVINCIA
     AND DATOS_3G.PROVINCIA = THP_3G_CIUDAD.PROVINCIA
     AND DATOS_3G.LOCALIDAD = THP_3G_CIUDAD.LOCALIDAD
     AND DATOS_3G.LOCALIDAD = DATOS_2G.LOCALIDAD
     AND DATOS_3G.LOCALIDAD = DATOS_4G.LOCALIDAD
     AND DATOS_3G.LOCALIDAD = NODOS_3G_4G.LOCALIDAD
     AND DATOS_3G.PROVINCIA = THP_CELDA_4G_CIUDAD.PROVINCIA
     AND DATOS_3G.LOCALIDAD = THP_CELDA_4G_CIUDAD.LOCALIDAD
   ORDER BY DATOS_3G.FECHA, DATOS_3G.PROVINCIA
