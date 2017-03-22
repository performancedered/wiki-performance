
----Datos 2G
WITH O1_2g AS (
       
          SELECT   DISTINCT BTS_ID,
                            BTS_NAME,
                            PROVINCIA, 
                            LOCALIDAD,
                            MERCADO,
                            MAINTENANCE_REGION_NAME
       
            FROM OBJECTS_SP_GSM O1
            WHERE  BTS_VALID_FINISH_DATE >= ${FECHA_INICIO}
            and Mercado is not null      
               AND MAINTENANCE_REGION_NAME NOT IN ('NO COMERCIAL PROC ALTA','SITIOS EVENTUALES','NO COMERCIAL ACEPT CALIDAD')
         
         ), 
      

Datos2G as (SELECT /*+ ORDERED */
       T1.FECHA,
       O1.MERCADO,
       NVL(ROUND((/*SUM(GPRS_UL_TRAFFIC) +*/ SUM(T1.GPRS_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLGPRS,
       NVL(ROUND((/*SUM(EDGE_UL_TRAFFIC) +*/ SUM(T1.EDGE_DL_TRAFFIC)) / 1024 / 1024, 2), 0) TRAFFICDLEDGE
  FROM  O1_2g O1,
       MULTIVENDOR_GPRS_DAYW T1
  WHERE                      
   T1.FECHA BETWEEN ${FECHA_INICIO} AND TRUNC(SYSDATE,'DAY')-1 + 83999/84000 
   AND O1.BTS_ID = T1.INT_ID
 GROUP BY T1.FECHA, MERCADO
 ORDER BY FECHA,MERCADO),

       
----Datos 3G
O1_3g AS (
       
          SELECT   DISTINCT WCELL_ID,
                            WCELL_NAME,
                            PROVINCIA, 
                            LOCALIDAD,
                            MERCADO,
                            MAINTENANCE_REGION_NAME
       
            FROM OBJECTS_SP_UMTS
            WHERE WCELL_VALID_FINISH_DATE >= ${FECHA_INICIO}
                AND MERCADO is not null   
                AND MAINTENANCE_REGION_NAME NOT IN ('NO COMERCIAL PROC ALTA','SITIOS EVENTUALES','NO COMERCIAL ACEPT CALIDAD')
      
         ),
      

Datos3G as (SELECT /*+ ORDERED */
       T1.FECHA,
       O1.MERCADO,
       
       
       ROUND((SUM(HS_DSCH_DATA_VOL) / (1024 * 1024 * 1024)), 2) TRAFICOHSDPA,
       ROUND((SUM(NRT_DCH_DL_DATA_VOL) / (1024 * 1024 * 1024)), 2) DLR99MACDGB,      
       ROUND(DECODE(SUM(HSDPA_ACT_USR_DEN),0,0,
                   (SUM(HSDPA_ACT_USR_NUM)) / (SUM(HSDPA_ACT_USR_DEN))),2) HSDPAACTUSERAVG,
       ROUND(100 * DECODE((SUM(HSDPA_ACCESS_USR_DEN)), 0, 1,
                          (SUM(HSDPA_ACCESS_USR_NUM) / SUM(HSDPA_ACCESS_USR_DEN))), 2) ACCESIBILITYHSDPA
  FROM 
       O1_3g O1,
       UMTS_NSN_HSDPA_WCEL_DAYW    T1,
       UMTSC_NSN_MACD_WCEL_DAYW    T2
  WHERE  T1.FECHA BETWEEN ${FECHA_INICIO} AND TRUNC(SYSDATE,'DAY')-1 + 83999/84000 
    AND  T2.PERIOD_START_TIME(+) = T1.FECHA
    AND  T2.WCELL_ID(+) = T1.INT_ID
    AND  O1.WCELL_ID = T1.INT_ID
    GROUP BY T1.FECHA,MERCADO
 ORDER BY T1.FECHA, O1.MERCADO
),


----Datos 4G
 O1_4g AS (
       
          SELECT   DISTINCT lte.lncel_id,
                            lte.lnbts_name ,
                            lte.provincia , 
                            lte.localidad,
                            LTE.MERCADO,
                            ne.element_id,
                            lte.OSSRC
                           
       
            FROM OBJECTS_SP_LTE_NE ne, OBJECTS_SP_LTE lte
            WHERE  lte.lnbts_valid_finish_date  >= ${FECHA_INICIO}
              and  lte.mercado is not null      
              and lte.lnbts_id=ne.element_id 
              AND ELEMENT_CLASS = 'LNBTS'            
         ),
      

Datos4G as (SELECT /*+ ORDERED */
       T1.FECHA,
       O1.mercado,
       
       ROUND(SUM(T1.TRAFICO_DL / 1000), 2) TRAFICOLTE,
       ROUND(100 *
             ((DECODE(SUM(SING_CONN_DEN),
                      0,
                      0,
                      (SUM(SING_CONN_NUM) / SUM(SING_CONN_DEN)))) *
             (DECODE(SUM(S1_SING_CONN_DEN),
                      0,
                      0,
                      (SUM(S1_SING_CONN_NUM) / SUM(S1_SING_CONN_DEN)))) *
             (DECODE(SUM(ERAB_INI_SETUP_DEN),
                      0,
                      0,
                      (SUM(ERAB_INI_SETUP_NUM) / SUM(ERAB_INI_SETUP_DEN))))),
             2) ACCESIBILITYLTE,
       ROUND(DECODE(SUM(EUTR_AVG_ACT_CON_UE_DEN),0,0,
                    SUM(EUTR_AVG_ACT_CON_UE_NUM) / SUM(EUTR_AVG_ACT_CON_UE_DEN)),2) LTEACTUSERAVG
  FROM O1_4g O1,
       LTE_NSN_SERVICE_lcel_DAYW T1
      
 WHERE 
   T1.FECHA BETWEEN ${FECHA_INICIO} AND TRUNC(SYSDATE,'DAY')-1 + 83999/84000 
   AND T1.lncel_ID = O1.lncel_ID
   --AND T1.OSSRC = O1.OSSRC
   
 GROUP BY T1.FECHA,
          O1.MERCADO
 ORDER BY T1.FECHA, O1.MERCADO), 
 

THP3G as (
-----THP 3G MERCADO

SELECT DISTINCT /*+ ORDERED */ 
                T1.FECHA,
                O1.MERCADO,
                
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
     
   AND T1.FECHA BETWEEN ${FECHA_INICIO} AND TRUNC(SYSDATE,'DAY')-1 + 83999/84000  
   AND O1.MERCADO = T1.MERCADO
 ORDER BY T1.FECHA,O1.MERCADO 

), 

 
-----THP 4G MERCADO
thp4G as (
SELECT ELEMENT_ID MERCADO,
       FECHA,
       (AVG_PDCP_CELL_THP_DL_NUM * 8 / AVG_PDCP_CELL_THP_DL_DEN)     THP_CELL_LTE,
       --(AVG_PDCP_CELL_THP_UL_NUM * 8 / AVG_PDCP_CELL_THP_UL_DEN)     "Cell Throughput UL"
       AVG_USER_DL_TPUT_NUM	/ AVG_USER_DL_TPUT_DEN	                 THP_USER_LTE
       --AVG_USER_UL_TPUT_NUM	/ AVG_USER_UL_TPUT_DEN	
       
  FROM LTE_NSN_SERVICE_NE_DAYW
 WHERE ELEMENT_CLASS IN ( 'MERCADO')
   AND FECHA BETWEEN ${FECHA_INICIO} AND TRUNC(SYSDATE,'DAY')-1 + 83999/84000
   AND ELEMENT_ID NOT IN ('No Especificado')
   --AND ELEMENT_ID NOT IN ('Paraguay')
ORDER BY ELEMENT_CLASS DESC, ELEMENT_ID, FECHA
), 


-- cuenta de sitios 
cant_sitios as (
SELECT MERCADO,
       COUNT(sitio3G_U) sitio3G_U,
       COUNT(sitio3G_D) sitio3G_D,
       COUNT(sitio3G_S) sitio3G_S,
       COUNT(sitio3G_T) sitio3G_T,
      GREATEST(COUNT(sitio3G_U),COUNT(sitio3G_D),COUNT(sitio3G_S),COUNT(sitio3G_T)) SITIO3G,
       COUNT(sitio4g1) sitio4g1,
       COUNT(sitio4g2) sitio4g2,
       GREATEST(COUNT(sitio4g1),COUNT(sitio4g2)) SITIO4G
   FROM(
        SELECT total.sitio,
               MAX(dosG.nombre) sitio2g,
               MAX(tresG_U.nombre) sitio3G_U,
               MAX(tresG_D.nombre) sitio3g_D,
               MAX(tresG_S.nombre) sitio3g_S,
               MAX(tresG_T.nombre) sitio3g_T,
               MAX(cuatroG_1.nombre) sitio4g1,
               MAX(cuatroG_2.nombre) sitio4g2,
               total.mercado
              
          FROM (SELECT DISTINCT substr(BCF_NAME,1,5) SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                  FROM OBJECTS_SP_GSM
                 WHERE BCF_VALID_FINISH_DATE > SYSDATE
                 AND MAINTENANCE_REGION_NAME NOT IN ('NO COMERCIAL PROC ALTA','SITIOS EVENTUALES','NO COMERCIAL ACEPT CALIDAD')
                UNION
                SELECT SUBSTR(lnbts_name,2,5) SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                  FROM OBJECTS_SP_LTE
                 WHERE LNBTS_VALID_FINISH_DATE > SYSDATE
                 --AND MAINTENANCE_REGION_NAME NOT IN ('NO COMERCIAL PROC ALTA','SITIOS EVENTUALES','NO COMERCIAL ACEPT CALIDAD')
                UNION
                SELECT substr(wcell_name,1,5) SITIO, PAIS, MERCADO, PROVINCIA, LOCALIDAD
                  FROM OBJECTS_SP_UMTS
                 WHERE WBTS_VALID_FINISH_DATE > SYSDATE
                    AND MAINTENANCE_REGION_NAME NOT IN ('NO COMERCIAL PROC ALTA','SITIOS EVENTUALES','NO COMERCIAL ACEPT CALIDAD')
                    ) Total
                    
          LEFT JOIN (SELECT DISTINCT substr(BCF_NAME,1,5) SITIO, BCF_NAME NOMBRE
                       FROM OBJECTS_SP_GSM
                      WHERE BCF_VALID_FINISH_DATE > SYSDATE) dosG
            ON total.sitio = dosg.sitio
          LEFT JOIN (SELECT SUBSTR(LNCEL_NAME,1,5) SITIO, LNCEL_NAME NOMBRE
                       FROM OBJECTS_SP_LTE
                      WHERE LNCEL_NAME LIKE '%1'
                        AND LNBTS_VALID_FINISH_DATE > SYSDATE) cuatroG_1
            ON total.sitio = cuatrog_1.sitio
            LEFT JOIN (SELECT SUBSTR(LNCEL_NAME,1,5) SITIO, LNCEL_NAME NOMBRE
                       FROM OBJECTS_SP_LTE
                      WHERE LNCEL_NAME LIKE '%2'
                        AND LNBTS_VALID_FINISH_DATE > SYSDATE) cuatroG_2
          ON total.sitio = cuatrog_2.sitio
          LEFT JOIN (SELECT substr(wcell_name,1,5) SITIO, WCELL_NAME NOMBRE --U
                       FROM OBJECTS_SP_UMTS
                      WHERE PORTADORA='1'
                         AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_U
            ON total.sitio = tresg_u.sitio
          LEFT JOIN (SELECT substr(wcell_name,1,5) SITIO, WCELL_NAME NOMBRE --D
                       FROM OBJECTS_SP_UMTS
                      WHERE PORTADORA='2'
                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_D
            ON total.sitio = tresg_d.sitio
          LEFT JOIN (SELECT substr(wcell_name,1,5) SITIO, WCELL_NAME NOMBRE --S
                       FROM OBJECTS_SP_UMTS
                      WHERE PORTADORA='3'
                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_S
            ON total.sitio = tresg_s.sitio
          LEFT JOIN (SELECT substr(wcell_name,1,5) SITIO, WCELL_NAME NOMBRE --T
                      FROM OBJECTS_SP_UMTS
                      WHERE PORTADORA='4'
                        AND WBTS_VALID_FINISH_DATE > SYSDATE) tresG_T
            ON total.sitio = tresg_t.sitio
         GROUP BY total.sitio, total.pais, total.mercado
         )
GROUP BY MERCADO)



SELECT Datos2G.FECHA, 
       Datos2G.MERCADO,
      
       TRAFICOHSDPA,
       DLR99MACDGB,
       HSDPAACTUSERAVG,
       ACCESIBILITYHSDPA,
       TRAFFICDLGPRS,
       TRAFFICDLEDGE,
       TRAFICOLTE,
       ACCESIBILITYLTE,
       LTEACTUSERAVG,
       
       (TRAFFICDLGPRS+TRAFFICDLEDGE+TRAFICOHSDPA+DLR99MACDGB+TRAFICOLTE) TRAFICOTOTAL,
       ROUND (100*TRAFICOLTE / (TRAFFICDLGPRS+TRAFFICDLEDGE+TRAFICOHSDPA+DLR99MACDGB+TRAFICOLTE),2) participacion4G,
      
       cant_sitios.sitio3G_U,
       cant_sitios.sitio3G_D,
       cant_sitios.sitio3G_S,
       cant_sitios.sitio3G_T,
       cant_sitios.SITIO3G,
       cant_sitios.sitio4g1,
       cant_sitios.sitio4g2,
       cant_sitios.SITIO4G,
       THP_USER_3G,
       THP_CELL_3G,
       ROUND (thp4G.THP_CELL_LTE,2) THP_CELL_LTE, 
       ROUND (thp4G.THP_USER_LTE,2) THP_USER_LTE
       
       
       -- CRUZAR TAMBIEN LAS FECHAS 
    FROM  DATOS2G,DATOS3G,DATOS4G,THP3G,THP4G,CANT_SITIOS 
    WHERE DATOS2G.MERCADO=DATOS3G.MERCADO
   
    AND DATOS2G.MERCADO=DATOS4G.MERCADO

    AND DATOS2G.MERCADO=THP3G.MERCADO
   
    AND DATOS2G.MERCADO=THP4G.MERCADO
   
    AND DATOS2G.MERCADO=CANT_SITIOS.MERCADO
    AND 1=0
    
