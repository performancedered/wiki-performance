CREATE OR REPLACE PACKAGE G_UMTS_UL_INTERFERENCE AS

--Autor: Matias Orquera. Fecha: 23.12.2016

PROCEDURE P_UMTS_UL_INTFRNC_JOB_HOURLY;
PROCEDURE P_UMTS_UL_INTFRNC_HOUR_INS(P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);

PROCEDURE P_TABLERO_ULINTFRNC_JOB_DAILY;
PROCEDURE P_TABLERO_UMTS_ULINTFRNC_DAY(P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);

PROCEDURE P_TABLERO_ULINTFRNC_JOB_WEEKLY;
PROCEDURE P_TABLERO_UMTS_ULINTFRNC_WEEK(P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);

PROCEDURE P_UMTS_UL_INTFRNC_REWORK_HOUR (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);
PROCEDURE P_UMTS_UL_INTFRNC_REWORK_DAY (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);
PROCEDURE P_UMTS_UL_INTFRNC_REWORK_WEEK (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR);
  
END G_UMTS_UL_INTERFERENCE;



CREATE OR REPLACE PACKAGE BODY G_UMTS_UL_INTERFERENCE AS

--Autor: Matias Orquera. Fecha: 23.12.2016

    -- LOG --
L_ERRORS NUMBER;
L_ERRNO  NUMBER;
L_MSG    VARCHAR2(4000);
L_IDX    NUMBER;
  -- END LOG --

LIMIT_IN PLS_INTEGER := 100;

PROCEDURE P_UMTS_UL_INTFRNC_JOB_HOURLY
IS

-- Autor: Matias Orquera. Fecha: 12.12.2016.

P_FECHA_DESDE VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'HH24') - 5/24, 'DD.MM.YYYY HH24');
P_FECHA_HASTA VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'HH24') - 1/24, 'DD.MM.YYYY HH24');

 BEGIN

   IF TRUNC(SYSDATE, 'HH24') - 5/24 >= TRUNC(SYSDATE,'DAY')+1 THEN
     P_UMTS_UL_INTFRNC_HOUR_INS(P_FECHA_DESDE, P_FECHA_HASTA);
   END IF;

END;

PROCEDURE P_UMTS_UL_INTFRNC_HOUR_INS (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR) IS

-- Autor: Matias Orquera. Fecha: 06.12.2016
-- Actualizacion: Matias Orquera. Fecha: 23.01.2017. Motivo: Se modifica el EXIT WHEN del Loop.

DML_ERRORS EXCEPTION;
PRAGMA EXCEPTION_INIT(DML_ERRORS, -24381);

TYPE T_ARRAY_TAB IS TABLE OF UMTS_UL_INTFRNC_WCEL_HOUR%ROWTYPE;
T_ARRAY_COL T_ARRAY_TAB;

CURSOR CUR (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
  SELECT TRUNC(T1.PERIOD_START_TIME, 'HH24')                                                FECHA,
         T1.OSSRC,
         T1.WCELL_GID                                                                       WCELL_ID,
         T1.WBTS_GID                                                                        WBTS_ID,
         T1.RNC_GID                                                                         RNC_ID,
         -(108.5 * RTWP_CLASS_0  + 107.5 * RTWP_CLASS_1  +
         106.5   * RTWP_CLASS_2  + 105.5 * RTWP_CLASS_3  +
         104.5   * RTWP_CLASS_4  + 103.5 * RTWP_CLASS_5  +
         102.5   * RTWP_CLASS_6  + 101.5 * RTWP_CLASS_7  +
         100.5   * RTWP_CLASS_8  + 99.5  * RTWP_CLASS_9  +
         98.5    * RTWP_CLASS_10 + 97    * RTWP_CLASS_11 +
         95      * RTWP_CLASS_12 + 93    * RTWP_CLASS_13 +
         90.5    * RTWP_CLASS_14 + 87.5  * RTWP_CLASS_15 +
         84.5    * RTWP_CLASS_16 + 81.5  * RTWP_CLASS_17 +
         77.5    * RTWP_CLASS_18 + 72.5  * RTWP_CLASS_19 +
         67.5    * RTWP_CLASS_20 + 65    * RTWP_CLASS_21)                                   RTWP_NUM,
         (RTWP_CLASS_0 + RTWP_CLASS_1  + RTWP_CLASS_2  +
         RTWP_CLASS_3  + RTWP_CLASS_4  + RTWP_CLASS_5  +
         RTWP_CLASS_6  + RTWP_CLASS_7  + RTWP_CLASS_8  +
         RTWP_CLASS_9  + RTWP_CLASS_10 + RTWP_CLASS_11 +
         RTWP_CLASS_12 + RTWP_CLASS_13 + RTWP_CLASS_14 +
         RTWP_CLASS_15 + RTWP_CLASS_16 + RTWP_CLASS_17 +
         RTWP_CLASS_18 + RTWP_CLASS_19 + RTWP_CLASS_20 +
         RTWP_CLASS_21)                                                                     RTWP_DEN,
         ROUND(DECODE((DUR_FOR_AMR_12_2_UL_IN_SRNC  +
         DUR_FOR_AMR_5_9_UL_IN_SRNC   +  DUR_FOR_AMR_4_75_UL_IN_SRNC),0,0,
         (AVG_RAB_HLD_TM_CS_VOICE     / (100 * 3600))                *
         (DUR_FOR_AMR_12_2_UL_IN_SRNC / (DUR_FOR_AMR_12_2_UL_IN_SRNC +
         DUR_FOR_AMR_5_9_UL_IN_SRNC   +  DUR_FOR_AMR_4_75_UL_IN_SRNC))),4)                  AMR12_2,
         ROUND(DECODE((DUR_FOR_AMR_12_2_UL_IN_SRNC + DUR_FOR_AMR_5_9_UL_IN_SRNC +
         DUR_FOR_AMR_4_75_UL_IN_SRNC),0,0,
         (AVG_RAB_HLD_TM_CS_VOICE     / (100 * 3600))                *
         ((DUR_FOR_AMR_5_9_UL_IN_SRNC + DUR_FOR_AMR_4_75_UL_IN_SRNC) /
         (DUR_FOR_AMR_12_2_UL_IN_SRNC + DUR_FOR_AMR_5_9_UL_IN_SRNC   +
         DUR_FOR_AMR_4_75_UL_IN_SRNC))),4)                                                  AMR5_9_AMR4_75,
         ROUND(DECODE(DENOM_HSUPA_USERS_PER_CELL,0,0,
         SUM_HSUPA_USERS_IN_CELL / DENOM_HSUPA_USERS_PER_CELL),4)                           HS,
         ROUND((NVL(DUR_PS_INTERA_8_UL_IN_SRNC,0)  + NVL(DUR_PS_INTERA_16_UL_IN_SRNC,0)  +
         NVL(DUR_PS_INTERA_32_UL_IN_SRNC,0)  + NVL(DUR_PS_INTERA_64_UL_IN_SRNC,0)  +
         NVL(DUR_PS_INTERA_128_UL_IN_SRNC,0) + NVL(DUR_PS_INTERA_256_UL_IN_SRNC,0) +
         NVL(DUR_PS_INTERA_320_UL_IN_SRNC,0) + NVL(DUR_PS_INTERA_384_UL_IN_SRNC,0) +
         NVL(DUR_PS_BACKG_8_UL_IN_SRNC,0)    + NVL(DUR_PS_BACKG_16_UL_IN_SRNC,0)   +
         NVL(DUR_PS_BACKG_32_UL_IN_SRNC,0)   + NVL(DUR_PS_BACKG_64_UL_IN_SRNC,0)   +
         NVL(DUR_PS_BACKG_128_UL_IN_SRNC,0)  + NVL(DUR_PS_BACKG_256_UL_IN_SRNC,0)  +
         NVL(DUR_PS_BACKG_320_UL_IN_SRNC,0)  + NVL(DUR_PS_BACKG_384_UL_IN_SRNC,0)  +
         NVL(DUR_PS_STREAM_8_UL_IN_SRNC,0)   + NVL(DUR_PS_STREAM_16_UL_IN_SRNC,0)  +
         NVL(DUR_PS_STREAM_32_UL_IN_SRNC,0)  + NVL(DUR_PS_STREAM_64_UL_IN_SRNC,0)  +
         NVL(DUR_PS_STREAM_128_UL_IN_SRNC,0) + NVL(DUR_PS_STREAM_256_UL_IN_SRNC,0) +
         NVL(DUR_PS_STREAM_320_UL_IN_SRNC,0) +
         NVL(DUR_PS_STREAM_384_UL_IN_SRNC,0))/ (1.35 * 3600 * 100),4)                       RS99,
         ROUND(DCH_ALLO_DURA_LINK_13_6_SRNC / (100 * 3600),4)                               SRB,
         DECODE(DUR_FOR_AMR_12_2_UL_IN_SRNC,NULL,0,1)                                       TRAFFIC_SAMPLES,
         DECODE(RTWP_CLASS_0,NULL,0,1)                                                      RTWP_SAMPLES
    FROM UMTS_C_NSN_CELLRES_MNC1_RAW@SMART.WORLD T1,
         UMTS_C_NSN_TRAFFIC_MNC1_RAW@SMART.WORLD T2,
         UMTS_C_NSN_SERVLEV_MNC1_RAW@SMART.WORLD T3
         --UMTS_UL_INTFRNC_WCEL_HOUR T4
   WHERE T1.OSSRC = T2.OSSRC
     AND T1.WCELL_GID = T2.WCELL_GID
     AND T1.OSSRC = T3.OSSRC
     AND T1.WCELL_GID = T3.WCELL_GID     
     AND T1.PERIOD_START_TIME = T2.PERIOD_START_TIME
     AND T1.PERIOD_START_TIME = T3.PERIOD_START_TIME
     AND T1.PERIOD_START_TIME BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY HH24')
                                  AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY HH24')--+86399/86400
     AND NOT EXISTS (SELECT 1
                       FROM UMTS_UL_INTFRNC_WCEL_HOUR T4
                      WHERE T1.OSSRC = T4.OSSRC
                        AND T1.WCELL_GID = T4.WCELL_ID
                        AND TRUNC(T1.PERIOD_START_TIME, 'HH24') = T4.FECHA);

 BEGIN
 OPEN CUR (P_FECHA_DESDE, P_FECHA_HASTA);
  LOOP
    FETCH CUR BULK COLLECT INTO T_ARRAY_COL LIMIT LIMIT_IN;
    BEGIN
      FORALL I IN 1 .. T_ARRAY_COL.COUNT SAVE EXCEPTIONS
        INSERT INTO UMTS_UL_INTFRNC_WCEL_HOUR VALUES T_ARRAY_COL (I);
    EXCEPTION
      WHEN DML_ERRORS THEN
        L_ERRORS := SQL%BULK_EXCEPTIONS.COUNT;
                FOR I IN 1 .. L_ERRORS
                LOOP
                    L_ERRNO := SQL%BULK_EXCEPTIONS(I).ERROR_CODE;
                    L_MSG   := SQLERRM(-L_ERRNO);
                    L_IDX   := SQL%BULK_EXCEPTIONS(I).ERROR_INDEX;

                    PKG_ERROR_LOG_NEW.P_LOG_ERROR('P_UMTS_UL_INTFRNC_HOUR_INS',L_ERRNO,L_MSG,
                    'V_BULK_ERRORS EXCEPTION FECHA: '||
                    TO_CHAR(T_ARRAY_COL(L_IDX).FECHA)||
                    ' WCELL_ID '||TO_CHAR(T_ARRAY_COL(L_IDX).WCELL_ID));

                END LOOP;
    END;
    EXIT WHEN T_ARRAY_COL.COUNT = 0;--CUR%NOTFOUND;
  END LOOP;
  COMMIT;
  CLOSE CUR;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

--*********TABLERO*****--

PROCEDURE P_TABLERO_ULINTFRNC_JOB_DAILY
IS

-- Autor: Matias Orquera. Fecha: 26.01.2017.

P_FECHA_DESDE VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'DD') -3, 'DD.MM.YYYY');
P_FECHA_HASTA VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'DD') -1, 'DD.MM.YYYY');

 BEGIN

   P_TABLERO_UMTS_ULINTFRNC_DAY(P_FECHA_DESDE, P_FECHA_HASTA);
   
END;

PROCEDURE P_TABLERO_UMTS_ULINTFRNC_DAY (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR) IS

-- Autor: Matias Orquera. Fecha: 25.01.2017

DML_ERRORS EXCEPTION;
PRAGMA EXCEPTION_INIT(DML_ERRORS, -24381);

TYPE T_ARRAY_TAB IS TABLE OF TABLERO_UMTS_ULINTFN_WCEL_DAY%ROWTYPE;
T_ARRAY_COL T_ARRAY_TAB;

CURSOR CUR (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
  SELECT T1.FECHA,
         T1.OSSRC,
         T1.WCELL_ID,
         T2.WCELL_NAME,
         T1.WBTS_ID,
         T2.WBTS_NAME,
         T1.RNC_ID,
         T2.RNC_NAME,
         T2.MERCADO,
         T2.BANDA,
         T2.PORTADORA,
         T1.ERL_EQV_MAX,
         T1.SAMPLES_PER_CELL,
         T1.SLOPE,
         T1.INTERCEPT,
         CASE WHEN T1.SAMPLES_PER_CELL < 19 THEN 'INSUFFICIENT_SAMPLES'
           ELSE CASE WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT <= -102 THEN 'LOW_TRAFFIC_1'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT <= -102 THEN 'LOW_TRAFFIC_2'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT > -102 THEN 'LOW_TRAFFIC_3'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN 'LOW_TRAFFIC_4'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT <= -102 THEN '1'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT <= -102 THEN '2'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT > -102 THEN '3'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN '4'
               /*ELSE CASE WHEN T1.SLOPE < 0.5 AND T1.INTERCEPT < -102 THEN '1'
                         WHEN T1.SLOPE > 0.5 AND T1.INTERCEPT < -102 THEN '2'
                         WHEN T1.SLOPE < 0.5 AND T1.INTERCEPT > -102 THEN '3'
                         WHEN T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN '4'
                    END*/
                END
         END                                                                                         CATEGORY
    FROM (SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                 OSSRC,
                 ERL_EQV_MAX,
                 ROUND(DECODE((SAMPLES_PER_CELL*SL_C-SL_D),0,0,
                 (SAMPLES_PER_CELL*SUM_ELEQ_X_RTWP-SUM_ELEQ*SUM_RTWP)/
                 (SAMPLES_PER_CELL*SL_C-SL_D)),4)                                                    SLOPE,
                 ROUND((SUM_RTWP-(DECODE((SAMPLES_PER_CELL*SL_C-SL_D),0,0,
                 (SAMPLES_PER_CELL*SUM_ELEQ_X_RTWP-SUM_ELEQ*SUM_RTWP)/
                 (SAMPLES_PER_CELL*SL_C-SL_D)))*SUM_ELEQ)/SAMPLES_PER_CELL,4)                        INTERCEPT,
                 SAMPLES_PER_CELL
            FROM (
                  SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                         OSSRC,
                         ERL_EQV_MAX,
                         SUM_ELEQ_X_RTWP,
                         SUM_ELEQ,
                         SUM_RTWP,
                         SL_C,
                         SL_D,
                         CASE
                           WHEN TRAFFIC_SAMPLES < RTWP_SAMPLES THEN
                            TRAFFIC_SAMPLES
                           ELSE
                            RTWP_SAMPLES
                         END SAMPLES_PER_CELL
                  FROM (SELECT TRUNC(FECHA) FECHA, WCELL_ID,WBTS_ID,RNC_ID,
                               OSSRC,
                               SUM(TRAFFIC_SAMPLES)                                                  TRAFFIC_SAMPLES,
                               SUM(RTWP_SAMPLES)                                                     RTWP_SAMPLES,
                               MAX(ERL_EQ)                                                           ERL_EQV_MAX,
                               SUM(ERL_EQ * RTWP)                                                    SUM_ELEQ_X_RTWP,
                               SUM(ERL_EQ)                                                           SUM_ELEQ,
                               SUM(RTWP)                                                             SUM_RTWP,
                               SUM(POWER(ERL_EQ,2))                                                  SL_C,
                               POWER(SUM(ERL_EQ),2)                                                  SL_D
                          FROM (SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                                       OSSRC,
                                       (1 * AMR12_2 + 0.8 * (AMR5_9_AMR4_75) + 0.4 * (HS+R99+SRB))   ERL_EQ,
                                       DECODE(RTWP_DEN,0,0,RTWP_NUM/RTWP_DEN)                        RTWP,
                                       TRAFFIC_SAMPLES,
                                       RTWP_SAMPLES
                                  FROM UMTS_UL_INTFRNC_WCEL_HOUR
                                 WHERE FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                                                 AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
                                )
                      GROUP BY TRUNC(FECHA),WCELL_ID,WBTS_ID,RNC_ID,OSSRC
                         )
                 )
          ) T1,
         OBJECTS_SP_UMTS@SMART.WORLD T2
--         TABLERO_UMTS_ULINTFN_WCEL_DAY T3
   WHERE T1.OSSRC = T2.OSSRC
     AND T1.WCELL_ID = T2.WCELL_ID
     AND NOT EXISTS(SELECT 1
                      FROM TABLERO_UMTS_ULINTFN_WCEL_DAY T3
                     WHERE T1.OSSRC = T3.OSSRC
                       AND T1.WCELL_ID = T3.WCELL_ID
                       AND T1.FECHA = T3.FECHA);

 BEGIN
 OPEN CUR (P_FECHA_DESDE, P_FECHA_HASTA);
  LOOP
    FETCH CUR BULK COLLECT INTO T_ARRAY_COL LIMIT LIMIT_IN;
    BEGIN
      FORALL I IN 1 .. T_ARRAY_COL.COUNT SAVE EXCEPTIONS
        INSERT INTO TABLERO_UMTS_ULINTFN_WCEL_DAY VALUES T_ARRAY_COL (I);
    EXCEPTION
      WHEN DML_ERRORS THEN
            L_ERRORS := SQL%BULK_EXCEPTIONS.COUNT;
                FOR I IN 1 .. L_ERRORS
                LOOP
                    L_ERRNO := SQL%BULK_EXCEPTIONS(I).ERROR_CODE;
                    L_MSG   := SQLERRM(-L_ERRNO);
                    L_IDX   := SQL%BULK_EXCEPTIONS(I).ERROR_INDEX;

                    PKG_ERROR_LOG_NEW.P_LOG_ERROR('P_TABLERO_UMTS_ULINTFRNC_DAY',L_ERRNO,L_MSG,
                    'V_BULK_ERRORS EXCEPTION FECHA: '||
                    TO_CHAR(T_ARRAY_COL(L_IDX).FECHA)||
                    ' WCELL_ID '||TO_CHAR(T_ARRAY_COL(L_IDX).WCELL_ID));
                END LOOP;
    END;
    EXIT WHEN CUR%NOTFOUND;
  END LOOP;
  COMMIT;
  CLOSE CUR;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

PROCEDURE P_TABLERO_ULINTFRNC_JOB_WEEKLY
IS

-- Autor: Matias Orquera. Fecha: 12.12.2016.

P_FECHA_DESDE VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'DAY') + 1, 'DD.MM.YYYY');
P_FECHA_HASTA VARCHAR2(15) := TO_CHAR( TRUNC(SYSDATE, 'DAY') + 5, 'DD.MM.YYYY');

 BEGIN

   P_TABLERO_UMTS_ULINTFRNC_WEEK(P_FECHA_DESDE, P_FECHA_HASTA);

END;

PROCEDURE P_TABLERO_UMTS_ULINTFRNC_WEEK (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR) IS

--Autor: Matias Orquera. Fecha: 06.12.2016
--Actualizacion: Matias Orquera. Fecha: 25.01.2017. Motivo: Se modifica el outer join con tabla destino.

DML_ERRORS EXCEPTION;
PRAGMA EXCEPTION_INIT(DML_ERRORS, -24381);

TYPE T_ARRAY_TAB IS TABLE OF TABLERO_UMTS_ULINTFN_WCEL_WEEK%ROWTYPE;
T_ARRAY_COL T_ARRAY_TAB;

CURSOR CUR (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
  SELECT T1.FECHA,
         T1.OSSRC,
         T1.WCELL_ID,
         T2.WCELL_NAME,
         T1.WBTS_ID,
         T2.WBTS_NAME,
         T1.RNC_ID,
         T2.RNC_NAME,
         T2.MERCADO,
         T2.BANDA,
         T2.PORTADORA,
         T1.ERL_EQV_MAX,
         T1.SAMPLES_PER_CELL,
         T1.SLOPE,
         T1.INTERCEPT,
         CASE WHEN T1.SAMPLES_PER_CELL < 96 THEN 'INSUFFICIENT_SAMPLES'
           ELSE CASE WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT <= -102 THEN 'LOW_TRAFFIC_1'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT <= -102 THEN 'LOW_TRAFFIC_2'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT > -102 THEN 'LOW_TRAFFIC_3'
                     WHEN T1.ERL_EQV_MAX < 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN 'LOW_TRAFFIC_4'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT <= -102 THEN '1'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT <= -102 THEN '2'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE <= 0.5 AND T1.INTERCEPT > -102 THEN '3'
                     WHEN T1.ERL_EQV_MAX >= 5 AND T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN '4'
               /*ELSE CASE WHEN T1.SLOPE < 0.5 AND T1.INTERCEPT < -102 THEN '1'
                         WHEN T1.SLOPE > 0.5 AND T1.INTERCEPT < -102 THEN '2'
                         WHEN T1.SLOPE < 0.5 AND T1.INTERCEPT > -102 THEN '3'
                         WHEN T1.SLOPE > 0.5 AND T1.INTERCEPT > -102 THEN '4'
                    END*/
                END
         END                                                                                         CATEGORY
    FROM (SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                 OSSRC,
                 ERL_EQV_MAX,
                 ROUND(DECODE((SAMPLES_PER_CELL*SL_C-SL_D),0,0,
                 (SAMPLES_PER_CELL*SUM_ELEQ_X_RTWP-SUM_ELEQ*SUM_RTWP)/
                 (SAMPLES_PER_CELL*SL_C-SL_D)),4)                                                    SLOPE,
                 ROUND((SUM_RTWP-(DECODE((SAMPLES_PER_CELL*SL_C-SL_D),0,0,
                 (SAMPLES_PER_CELL*SUM_ELEQ_X_RTWP-SUM_ELEQ*SUM_RTWP)/
                 (SAMPLES_PER_CELL*SL_C-SL_D)))*SUM_ELEQ)/SAMPLES_PER_CELL,4)                        INTERCEPT,
                 SAMPLES_PER_CELL
            FROM (
                  SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                         OSSRC,
                         ERL_EQV_MAX,
                         SUM_ELEQ_X_RTWP,
                         SUM_ELEQ,
                         SUM_RTWP,
                         SL_C,
                         SL_D,
                         CASE
                           WHEN TRAFFIC_SAMPLES < RTWP_SAMPLES THEN
                            TRAFFIC_SAMPLES
                           ELSE
                            RTWP_SAMPLES
                         END SAMPLES_PER_CELL
                  FROM (SELECT TRUNC(FECHA,'DAY')+1 FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                               OSSRC,
                               SUM(TRAFFIC_SAMPLES)                                                  TRAFFIC_SAMPLES,
                               SUM(RTWP_SAMPLES)                                                     RTWP_SAMPLES,
                               MAX(ERL_EQ)                                                           ERL_EQV_MAX,
                               SUM(ERL_EQ * RTWP)                                                    SUM_ELEQ_X_RTWP,
                               SUM(ERL_EQ)                                                           SUM_ELEQ,
                               SUM(RTWP)                                                             SUM_RTWP,
                               SUM(POWER(ERL_EQ,2))                                                  SL_C,
                               POWER(SUM(ERL_EQ),2)                                                  SL_D
                          FROM (SELECT FECHA,WCELL_ID,WBTS_ID,RNC_ID,
                                       OSSRC,
                                       (1 * AMR12_2 + 0.8 * (AMR5_9_AMR4_75) + 0.4 * (HS+R99+SRB))   ERL_EQ,
                                       DECODE(RTWP_DEN,0,0,RTWP_NUM/RTWP_DEN)                        RTWP,
                                       TRAFFIC_SAMPLES,
                                       RTWP_SAMPLES
                                  FROM UMTS_UL_INTFRNC_WCEL_HOUR
                                 WHERE FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                                                 AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY')+ 83999 / 84000
                                )
                      GROUP BY TRUNC(FECHA,'DAY')+1,WCELL_ID,WBTS_ID,RNC_ID,OSSRC
                         )
                 )
          ) T1,
         OBJECTS_SP_UMTS@SMART.WORLD T2
         --TABLERO_UMTS_ULINTFN_WCEL_WEEK T3
   WHERE T1.OSSRC = T2.OSSRC
     AND T1.WCELL_ID = T2.WCELL_ID
     AND NOT EXISTS(SELECT 1
                      FROM TABLERO_UMTS_ULINTFN_WCEL_WEEK T3
                     WHERE T1.OSSRC = T3.OSSRC
                       AND T1.WCELL_ID = T3.WCELL_ID
                       AND T1.FECHA = T3.FECHA);

 BEGIN
 OPEN CUR (P_FECHA_DESDE, P_FECHA_HASTA);
  LOOP
    FETCH CUR BULK COLLECT INTO T_ARRAY_COL LIMIT LIMIT_IN;
    BEGIN
      FORALL I IN 1 .. T_ARRAY_COL.COUNT SAVE EXCEPTIONS
        INSERT INTO TABLERO_UMTS_ULINTFN_WCEL_WEEK VALUES T_ARRAY_COL (I);
    EXCEPTION
      WHEN DML_ERRORS THEN
            L_ERRORS := SQL%BULK_EXCEPTIONS.COUNT;
                FOR I IN 1 .. L_ERRORS
                LOOP
                    L_ERRNO := SQL%BULK_EXCEPTIONS(I).ERROR_CODE;
                    L_MSG   := SQLERRM(-L_ERRNO);
                    L_IDX   := SQL%BULK_EXCEPTIONS(I).ERROR_INDEX;

                    PKG_ERROR_LOG_NEW.P_LOG_ERROR('P_TABLERO_UMTS_ULINTFRNC_WEEK',L_ERRNO,L_MSG,
                    'V_BULK_ERRORS EXCEPTION FECHA: '||
                    TO_CHAR(T_ARRAY_COL(L_IDX).FECHA)||
                    ' WCELL_ID '||TO_CHAR(T_ARRAY_COL(L_IDX).WCELL_ID));
                END LOOP;
    END;
    EXIT WHEN CUR%NOTFOUND;
  END LOOP;
  COMMIT;
  CLOSE CUR;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

PROCEDURE P_UMTS_UL_INTFRNC_REWORK_HOUR (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR)
IS

-- Autor: Matias Orquera. Fecha: 11.01.2017.
-- Actualizacion: Matias Orquera. Fecha 25.01.2017. Motivo: Se reemplaza el DELETE por proceso de truncado.

BEGIN

  /*DELETE FROM UMTS_UL_INTFRNC_WCEL_HOUR WHERE FECHA BETWEEN TO_DATE(P_FECHA_DESDE, 'DD.MM.YYYY HH24')
                                                        AND TO_DATE(P_FECHA_HASTA, 'DD.MM.YYYY HH24');
  COMMIT;*/

  P_TRUNCATE_PART_HOUR('UMTS_UL_INTFRNC_WCEL_HOUR',P_FECHA_DESDE, P_FECHA_HASTA);
  P_UMTS_UL_INTFRNC_HOUR_INS(P_FECHA_DESDE, P_FECHA_HASTA);

END;

PROCEDURE P_UMTS_UL_INTFRNC_REWORK_DAY (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR)
IS

-- Autor: Matias Orquera. Fecha: 25.01.2017.

BEGIN

  P_TRUNCATE_PART_DAY('TABLERO_UMTS_ULINTFN_WCEL_DAY',P_FECHA_DESDE, P_FECHA_HASTA);
  P_TABLERO_UMTS_ULINTFRNC_DAY(P_FECHA_DESDE, P_FECHA_HASTA);

END;

PROCEDURE P_UMTS_UL_INTFRNC_REWORK_WEEK (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR)
IS

-- Autor: Matias Orquera. Fecha: 25.01.2017.

BEGIN

  P_TRUNCATE_PART_DAY('TABLERO_UMTS_ULINTFN_WCEL_WEEK',P_FECHA_DESDE, P_FECHA_HASTA);
  P_TABLERO_UMTS_ULINTFRNC_WEEK(P_FECHA_DESDE, P_FECHA_HASTA);

END;

END G_UMTS_UL_INTERFERENCE;
