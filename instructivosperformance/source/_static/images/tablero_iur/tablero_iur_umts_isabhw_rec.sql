-- Autor: Monica Pellegrini. Fecha: 10.02.2015. Motivo: Se genera el nuevo tablero a solicitud de la direccion de calidad. TABLERO INDICADOR UNICO DE RED.
-- Actualizacion: Monica Pellegrini. Fecha: 09.03.2015. Motivo: Se cambia nombre de columna disponibilidad cliente sea mayor a 99.6.
-- Actualizacion: Monica Pellegrini. Fecha: 06.04.2015. Motivo: Se agrega filtro donde el nombre de la celda sea not nula, tambien sitios eventuales y se modifica
-- maxhsdpa_fail que esta menor a 10 pasa ser menor a 5

BEGIN

DELETE FROM TABLERO_UMTS_IUR_ISABHW WHERE FECHA = TO_DATE('&1', 'DD.MM.YYYY');

INSERT INTO TABLERO_UMTS_IUR_ISABHW
SELECT  FECHA,
         WCELL_NAME,
         WCELL_ADDRESS,
         ALM,
         MERCADO,
         PAIS,
         NO_RETENIBILIDAD,
         ACCESIBILIDAD_VOZ,
         RUIDO_RTWP,
         ACCESIBILIDAD_DATOS_HSDPA,
         THROUGHPUT_HSDPA,
         USUARIOS_SIMULTANEOS_HSDPA,
         DISPONIBILIDAD_CLIENTE,
         CAPACIDAD,
         NO_RETENIB_MENOR_1,
         ACC_VOZ_MAYOR_98,
         RUIDO_RTWP_MENOR_MENOS_90,
         ACC_DATOS_HSDPA_MENOR_0_1,
         THROUGHPUT_HSDPA_MAYOR_400,
         USU_SIMUL_HSDPA_MENOR_40,
         DISP_CLIENTE_MAYOR_99_6,
         CAPACIDAD_MENOR_0_8,
         FLAG_VALIDACION
   FROM(
SELECT   FECHA,
         WCELL_NAME,
         WCELL_ADDRESS,
         ALM,
         MERCADO,
         PAIS,
         NO_RETENIBILIDAD,
         ACCESIBILIDAD_VOZ,
         RUIDO_RTWP,
         ACCESIBILIDAD_DATOS_HSDPA,
         THROUGHPUT_HSDPA,
         USUARIOS_SIMULTANEOS_HSDPA,
         DISPONIBILIDAD_CLIENTE,
         CAPACIDAD,
         NO_RETENIB_MENOR_1,
         ACC_VOZ_MAYOR_98,
         RUIDO_RTWP_MENOR_MENOS_90,
         ACC_DATOS_HSDPA_MENOR_0_1,
         THROUGHPUT_HSDPA_MAYOR_400,
         USU_SIMUL_HSDPA_MENOR_40,
         DISP_CLIENTE_MAYOR_99_6,
         CAPACIDAD_MENOR_0_8,
         CASE WHEN NO_RETENIB_MENOR_1 = 1
               AND ACC_VOZ_MAYOR_98 =1
               AND RUIDO_RTWP_MENOR_MENOS_90 = 1
               AND ACC_DATOS_HSDPA_MENOR_0_1 = 1
               AND THROUGHPUT_HSDPA_MAYOR_400 = 1
               AND USU_SIMUL_HSDPA_MENOR_40 = 1
               AND DISP_CLIENTE_MAYOR_99_6 = 1
               AND CAPACIDAD_MENOR_0_8 = 1  THEN '1'
               ELSE '0' END  FLAG_VALIDACION,
        ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, alm, mercado, pais ORDER BY WCELL_NAME DESC)  CANTIDA2
  FROM(
SELECT FECHA,
       WCELL_NAME,
       WCELL_ADDRESS,
       ALM,
       MERCADO,
       PAIS,
       DROP_CALL_RE_PORC                                                                       NO_RETENIBILIDAD ,
       ACCESSIBILITYVOICE                                                                      ACCESIBILIDAD_VOZ,
       RTWP                                                                                    RUIDO_RTWP,
       MAXHSDPA_FAIL                                                                           ACCESIBILIDAD_DATOS_HSDPA,
       THROUGHPUTHSDPAMACD                                                                     THROUGHPUT_HSDPA,
       USU_HSDPA_PROM_POR_CELDA                                                                USUARIOS_SIMULTANEOS_HSDPA,
       DISPONIBILIDAD_CLIENTE                                                                  DISPONIBILIDAD_CLIENTE,
       AMX_LOAD                                                                                CAPACIDAD,
       CASE WHEN DROP_CALL_RE_PORC  < 1 THEN 1 ELSE 0 END                                      NO_RETENIB_MENOR_1,
       CASE WHEN ACCESSIBILITYVOICE  > 98 THEN 1 ELSE 0 END                                    ACC_VOZ_MAYOR_98,
       CASE WHEN RTWP  < -90  THEN 1 ELSE 0 END                                                RUIDO_RTWP_MENOR_MENOS_90,
       CASE WHEN MAXHSDPA_FAIL  < 0.05 THEN 1 ELSE 0 END                                       ACC_DATOS_HSDPA_MENOR_0_1,
       CASE WHEN THROUGHPUTHSDPAMACD  > 400 THEN 1 ELSE 0 END                                  THROUGHPUT_HSDPA_MAYOR_400,
       CASE WHEN USU_HSDPA_PROM_POR_CELDA  < 40 THEN 1 ELSE 0 END                              USU_SIMUL_HSDPA_MENOR_40,
       CASE WHEN DISPONIBILIDAD_CLIENTE  > 99.6  THEN 1 ELSE 0 END                             DISP_CLIENTE_MAYOR_99_6,
       CASE WHEN AMX_LOAD  < 0.8 THEN 1 ELSE 0 END                                             CAPACIDAD_MENOR_0_8   ,
       ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, WCELL_ADDRESS, PAIS ORDER BY FECHA DESC)  CANTIDA2
  FROM (
SELECT A.FECHA,
       A.WCELL_NAME,
       A.WCELL_ADDRESS,
       A.ALM,
       A.MERCADO,
       A.PAIS,
       DECODE(DROP_CALL_RE_PORC,NULL, 0,DROP_CALL_RE_PORC)                            DROP_CALL_RE_PORC ,
      /* DECODE(RAB_VOZ, NULL, 0,RAB_VOZ)                                               RAB_VOZ ,*/
       DECODE(accessibilityVoice, NULL, 0, accessibilityVoice)                        accessibilityVoice,
       DECODE(RTWP, NULL, 0,RTWP)                                                     RTWP,
       /*DECODE(AC, NULL, 0,AC)                                                         AC,*/
       /*DECODE(RNC_FAIL, NULL, 0,RNC_FAIL)                                             RNC_FAIL,*/
       DECODE(MAXHSDPA_FAIL, NULL, 0,MAXHSDPA_FAIL)                                   MAXHSDPA_FAIL,
       /*DECODE(noAccesibilidadHsupa, NULL, 0,noAccesibilidadHsupa)                     noAccesibilidadHsupa,*/
       DECODE(throughputHsdpaMacd, NULL, 0,throughputHsdpaMacd)                       throughputHsdpaMacd,
       DECODE(USU_HSDPA_PROM_POR_CELDA, NULL, 0,USU_HSDPA_PROM_POR_CELDA)             USU_HSDPA_PROM_POR_CELDA,
       DECODE(DISPONIBILIDAD_CLIENTE, NULL, 0,DISPONIBILIDAD_CLIENTE)                 DISPONIBILIDAD_CLIENTE,
       DECODE(AMX_LOAD, NULL, 0,AMX_LOAD)                                             AMX_LOAD
  FROM(
SELECT FECHA,
       ROUND(100 *
       DECODE(RAB_DROP_VOZ_USR_DEN, 0, 0,
              RAB_DROP_VOZ_USR_NUM /RAB_DROP_VOZ_USR_DEN), 2)                  DROP_CALL_RE_PORC,

       1 - DECODE(RAB_CSS_VOZ_DEN, 0, 0,
                  RAB_CSS_VOZ_NUM /RAB_CSS_VOZ_DEN)                            RAB_VOZ,

     round(10 * RTWP, 2)                                                       RTWP,
     ROUND( DECODE(RAB_CSS_VOZ_DEN, 0, 0,
            RAB_STP_FAIL_CS_VOICE_AC /RAB_CSS_VOZ_DEN), 2)                       AC,
     CASE WHEN ROUND(DECODE((ROUND(HSDPA_BUFF_WITH_DATA_PER_TTI / 500, 4)), 0, 0,
                            THRP_HSDPA_MACD_NUM /
                            (ROUND(HSDPA_BUFF_WITH_DATA_PER_TTI / 500, 4))), 0) > 1000 THEN 100
          ELSE (DECODE((ROUND(HSDPA_BUFF_WITH_DATA_PER_TTI / 500, 4)), 0, 0,
                         THRP_HSDPA_MACD_NUM /
                         (ROUND(HSDPA_BUFF_WITH_DATA_PER_TTI / 500, 4)))
                          / 1000 * 10) + 90 END / 100                           TRGHPT_HSDPA_QI_MBPS_RATE,

     DECODE(RAB_STP_ATT_CS_VOICE, 0, 0,
            RNC_NUM /RAB_STP_ATT_CS_VOICE)                                      RNC_FAIL,

     DECODE(HSDPA_ACCESS_USR_DEN, 0, 0,
           (DCH_SEL_MAX_HSDPA_USERS_BGR + DCH_SEL_MAX_HSDPA_USERS_INT) /
           HSDPA_ACCESS_USR_DEN)                                                MAXHSDPA_FAIL,
    round(100 -
       100 *
       decode((HSUPA_ACCESS_USR_DEN),
              0,
              1,
              (HSUPA_ACCESS_USR_NUM / HSUPA_ACCESS_USR_DEN)),
       2)                                                                       noAccesibilidadHsupa,
     round(DECODE(HSDPA_BUFF_WITH_DATA_PER_TTI,
              0,
              0,
              RECEIVED_HS_MACD_BITS /
              (HSDPA_BUFF_WITH_DATA_PER_TTI / 500)),
       2)                                                                       throughputHsdpaMacd,

       WCELL_NAME,
       WCELL_ADDRESS,
       ALM,
        round((100 * CASE
         WHEN RRC_CSS_VOZ_DEN = 0 THEN
          1
         WHEN RAB_CSS_VOZ_DEN = 0 THEN
          (RRC_CSS_VOZ_NUM / RRC_CSS_VOZ_DEN)
         ELSE
          (RRC_CSS_VOZ_NUM / RRC_CSS_VOZ_DEN) *
          (RAB_CSS_VOZ_NUM / RAB_CSS_VOZ_DEN)
       END),
       2) accessibilityVoice,
       MERCADO, PAIS
   FROM (
SELECT SUM(T1.RAB_CSS_VOZ_DEN)                                                  RAB_CSS_VOZ_DEN,
       SUM(T2.RAB_STP_FAIL_CS_VOICE_AC)                                         RAB_STP_FAIL_CS_VOICE_AC,
       AVG(t1.RTWP)                                                             RTWP,
       SUM(T1.RAB_DROP_VOZ_USR_DEN)                                             RAB_DROP_VOZ_USR_DEN,
       SUM(T1.RAB_DROP_VOZ_USR_NUM)                                             RAB_DROP_VOZ_USR_NUM,
       SUM(T1.RAB_CSS_VOZ_NUM)                                                  RAB_CSS_VOZ_NUM,
       SUM(T4.HSDPA_BUFF_WITH_DATA_PER_TTI)                                     HSDPA_BUFF_WITH_DATA_PER_TTI,
       SUM(T4.RECEIVED_HS_MACD_BITS)                                            THRP_HSDPA_MACD_NUM,
       SUM(RAB_STP_FAIL_CS_VOICE_RNC)                                           RNC_NUM,
       SUM(RAB_STP_ATT_CS_VOICE)                                                RAB_STP_ATT_CS_VOICE,
       SUM(HSDPA_ACCESS_USR_DEN)                                                HSDPA_ACCESS_USR_DEN,
       SUM(DCH_SEL_MAX_HSDPA_USERS_BGR)                                         DCH_SEL_MAX_HSDPA_USERS_BGR,
       SUM(DCH_SEL_MAX_HSDPA_USERS_INT)                                         DCH_SEL_MAX_HSDPA_USERS_INT,
       SUM(HSUPA_ACCESS_USR_DEN)                                                HSUPA_ACCESS_USR_DEN,
       SUM(HSUPA_ACCESS_USR_NUM)                                                HSUPA_ACCESS_USR_NUM,
       SUM(RECEIVED_HS_MACD_BITS)                                               RECEIVED_HS_MACD_BITS,
       T1.FECHA,
       OB.WCELL_NAME,
       OB.WCELL_ADDRESS,
       ALM,
       SUM(T1.RRC_CSS_VOZ_DEN)                                                     RRC_CSS_VOZ_DEN,
       SUM(T1.RRC_CSS_VOZ_NUM)                                                     RRC_CSS_VOZ_NUM,
       MERCADO,
       PAIS
  FROM UMTS_NSN_SERVICE_WCEL_ISABHWC   T1,
       UMTSC_NSN_SERVICE_WCEL_ISABHWC  T2,
       UMTS_NSN_SERVICE_WCEL_ISABHWP   T3,
       UMTSC_NSN_HSDPA_WCEL_ISABHW     T4,
       UMTS_NSN_HSDPA_WCEL_ISABHW      T5,
       (
select wcell_name, WCELL_ADDRESS ,alm, mercado, pais,WCELL_ID
from (
SELECT wcell_name, WCELL_ADDRESS ,alm, mercado, pais,WCELL_ID,
     ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, WCELL_ADDRESS, alm, mercado, pais ORDER BY wcell_valid_start_date DESC)  CANTIDA2
FROM OBJECTS_SP_UMTS
where TO_DATE('&1', 'DD.MM.YYYY') BETWEEN wcell_valid_start_date and wcell_valid_finish_date
and wcell_address is not null
)
where CANTIDA2 = 1)                  OB,
       NOC_UMTS_AVAIL_WCEL_DAYWO       N1,
       UMTSC_NSN_MACD_WCEL_ISABHW      T7
 WHERE T1.INT_ID = T3.INT_ID (+)
   AND T1.INT_ID = T2.INT_ID (+)
   AND T1.INT_ID = T4.INT_ID (+)
   AND T1.INT_ID = OB.WCELL_ID  (+)
   AND T1.INT_ID = N1.INT_ID (+)
   AND T1.INT_ID = T5.INT_ID (+)
   AND T1.FECHA  = T5.FECHA (+)
   AND T1.FECHA  = T3.FECHA(+)
   AND T1.FECHA  = T2.FECHA(+)
   AND T1.FECHA  = T4.FECHA (+)
   AND T1.FECHA  = N1.FECHA (+)
   AND T1.INT_ID = T7.WCELL_ID (+)
   AND T1.FECHA  = T7.PERIOD_START_TIME(+)
   AND N1.ESTADO_MR NOT IN ('NO COMERCIAL PROC ALTA' , 'NO COMERCIAL ACEPT CALIDAD', 'SITIOS EVENTUALES')
  -- AND OB.WCELL_VALID_FINISH_DATE > SYSDATE
   AND T1.FECHA = TO_DATE('&1', 'DD.MM.YYYY')
   AND SEMANA = 'D-S'
   AND OB.WCELL_NAME IS NOT NULL
GROUP BY T1.FECHA,
         OB.WCELL_NAME,
         OB.WCELL_ADDRESS,
         ALM,
         MERCADO,
         PAIS)
      )A,
      (
SELECT FECHA,
       WCELL_NAME,
       WCELL_ADDRESS,
       ALM,
       MERCADO,
       PAIS,
       ROUND(DECODE(SUM(HSDPA_ACT_USR_DEN),
                             0,
                             0,
                             (SUM(HSDPA_ACT_USR_NUM)) / (SUM(HSDPA_ACT_USR_DEN))),
                             2)                                                                   USU_HSDPA_PROM_POR_CELDA
  FROM (
select wcell_name,wcell_address,alm, mercado, pais,WCELL_ID
from(
SELECT wcell_name,wcell_address,alm, mercado, pais,WCELL_ID,
     ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, WCELL_ADDRESS, alm, mercado, pais ORDER BY wcell_valid_start_date DESC)  CANTIDA2
FROM OBJECTS_SP_UMTS
where TO_DATE('&1', 'DD.MM.YYYY') BETWEEN wcell_valid_start_date and wcell_valid_finish_date
and wcell_address is not null
)
where CANTIDA2 = 1)  O,
       UMTS_NSN_HSDPA_WCEL_ISABHW T1
 WHERE T1.INT_ID = O.WCELL_ID
   AND O.Wcell_NAME IS NOT NULL
   AND T1.FECHA =  TO_DATE('&1', 'DD.MM.YYYY')
 --  AND SYSDATE BETWEEN WBTS_VALID_START_DATE  AND WBTS_VALID_FINISH_DATE
GROUP BY FECHA,
         WCELL_NAME,
          WCELL_ADDRESS,
          ALM,
          MERCADO,
          PAIS
          )B,
          (
SELECT /*+ ORDERED */
       T1.FECHA,
       WCELL_NAME,
       WCELL_ADDRESS,
       ALM,
       MERCADO,
       PAIS,
       ROUND(100 *
       DECODE(SUM(CELL_WO_STATE_USR_DEN_FULL), 0, 0,
              SUM(CELL_WO_STATE_USR_NUM_FULL) /
              SUM(CELL_WO_STATE_USR_DEN_FULL)), 2)                                                DISPONIBILIDAD_CLIENTE
  FROM NOC_UMTS_AVAIL_WCEL_DAYWO T1,
       (
select wcell_name,wcell_address,alm, mercado, pais,WCELL_ID
from(
SELECT wcell_name,wcell_address,alm, mercado, pais,WCELL_ID,
     ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, WCELL_ADDRESS, alm, mercado, pais ORDER BY wcell_valid_start_date DESC)  CANTIDA2
FROM OBJECTS_SP_UMTS
where TO_DATE('&1', 'DD.MM.YYYY') BETWEEN wcell_valid_start_date and wcell_valid_finish_date
and wcell_address is not null
)
where CANTIDA2 = 1)           O1
 WHERE T1.INT_ID = O1.WCELL_ID
   AND T1.ESTADO_MR NOT IN ('NO COMERCIAL PROC ALTA' , 'NO COMERCIAL ACEPT CALIDAD', 'SITIOS EVENTUALES')
   AND T1.FECHA = TO_DATE('&1', 'DD.MM.YYYY')
   AND O1.WCELL_NAME IS NOT NULL
GROUP BY T1.FECHA,WCELL_NAME,
       WCELL_ADDRESS,
       ALM,
       MERCADO,
       PAIS
       )C,
 (
 SELECT DISTINCT  T1.WCELL_NAME,
       FECHA,
       ROUND(SPARE_03_NBR, 2) AMX_LOAD,
       O1.WCELL_ADDRESS,
       O1.ALM,
       MERCADO,
       PAIS
  FROM UMTS_CLDD_RADAR_WCEL_DAYW T1,
       (
SELECT wcell_name,wcell_address,alm, mercado, pais,WCELL_ID
from(
SELECT wcell_name,wcell_address,alm, mercado, pais,WCELL_ID,
     ROW_NUMBER () OVER(PARTITION BY WCELL_NAME, WCELL_ADDRESS, alm, mercado, pais ORDER BY wcell_valid_start_date DESC)  CANTIDA2
FROM OBJECTS_SP_UMTS
where TO_DATE('&1', 'DD.MM.YYYY') BETWEEN wcell_valid_start_date and wcell_valid_finish_date
and wcell_address is not null
)
where CANTIDA2 = 1)   O1
 WHERE INDICADOR_ID = 2040
   AND T1.WCELL_NAME = O1.WCELL_NAME
  -- AND  WCELL_VALID_FINISH_DATE > SYSDATE
   AND O1.WCELL_NAME IS NOT NULL
   AND FECHA = TO_DATE('&1', 'DD.MM.YYYY')
        )D
  WHERE A.FECHA = B.FECHA(+)
    AND A.WCELL_NAME  = B.WCELL_NAME (+)
    AND A.FECHA = C.FECHA(+)
    AND A.WCELL_NAME  = C.WCELL_NAME (+)
    AND A.FECHA = D.FECHA(+)
    AND A.WCELL_NAME = D.WCELL_NAME (+)
    AND A.MERCADO IS NOT NULL
    AND A.PAIS IS NOT NULL
    ))
  WHERE CANTIDA2 = 1
   )
  WHERE CANTIDA2 = 1 ;
COMMIT;

END;
/

EXIT;

