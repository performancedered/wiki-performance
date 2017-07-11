CREATE OR REPLACE PROCEDURE P_TABLERO_NQI_HOUR_INS (P_OSSRC IN CHAR, P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR) IS

-- Autor: Mario Heredia. Fecha: 02.06.2017.

CURSOR C_TABLERO (RC VARCHAR2, FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT FECHA                                ,
       'UMTS WCELL '||OSSRC                 PHASE,
       WCELL_GID                            ,
       WBTS_GID                             ,
       RNC_GID                              ,
       DIRECT_RETRY_NUM                     ,
       DIRECT_RETRY_DEN                     ,
       DIRECT_RETRY_RATE                    ,
       RETENTION_CS_NUM                     ,
       RETENTION_CS_DEN                     ,
       RETENTION_CS_RATE                    ,
       RETENTION_PS_NUM                     ,
       RETENTION_PS_DEN                     ,
       RETENTION_PS_RATE                    ,
       VOICE_ERLANGS                        ,
       RAB_STP_FAIL_CS_VOICE_AC             ,
       RAB_STP_FAIL_CS_VOICE_BTS            ,
       RAB_STP_FAIL_CS_VOICE_TRANS          ,
       RAB_STP_FAIL_CS_VOICE_RNC            ,
       RAB_STP_FAIL_CS_VOICE_FROZBS         ,
       RAB_STP_FAIL_CS_V_IUB_AAL2           ,
       RAB_ACC_FAIL_CS_VOICE_MS             ,
       RAB_ACC_FAIL_CS_VOICE_RNC            ,
       RRC_CONN_STP_FAIL_AC                 ,
       RRC_CONN_STP_FAIL_BTS                ,
       RRC_CONN_STP_FAIL_FROZBS             ,
       RRC_CONN_STP_FAIL_HC                 ,
       RRC_CONN_STP_FAIL_RNC                ,
       RRC_CONN_STP_FAIL_RNTI_ALLO          ,
       RRC_CONN_STP_FAIL_IUB_AAL2           ,
       RRC_CONN_STP_FAIL_TRANS              ,
       RAB_ACT_FAIL_CS_VOICE_IU             ,
       RAB_ACT_FAIL_CS_VOICE_RADIO          ,
       RAB_ACT_FAIL_CS_VOICE_BTS            ,
       RAB_ACT_FAIL_CS_VOICE_IUR            ,
       RAB_ACT_FAIL_CS_VOICE_RNC            ,
       RAB_ACT_FAIL_CS_VOICE_UE             ,
       RRC_RE_EST_SUCC_RT                   ,
       RRC_CSS_VOZ_NUM                      ,
       RRC_CSS_VOZ_DEN                      ,
       RAB_CSS_VOZ_NUM                      ,
       RAB_CSS_VOZ_DEN                      ,
       RAB_DROP_VOZ_USR_NUM                 ,
       RAB_DROP_VOZ_USR_DEN                 ,
       ACCESIBILIDAD_CS                     ,
       RETENIBILIDAD_CS                     ,
       QDA_CS_NUM                           ,
       QDA_CS_DEN                           ,
       QDA_CS_RATE                          ,
       QDR_CS_NUM                           ,
       QDR_CS_DEN                           ,
       QDR_CS_RATE                          ,
       CS_ERL_NUM                           ,
       CS_ERL_DEN                           ,
       CS_ERL                               ,
       HSDPA_USERS_RATIO_NUM                ,
       HSDPA_USERS_RATIO_DEN                ,
       HSDPA_USERS_RATIO_RATE               ,
       AVAILABILITY_NUM                     ,
       AVAILABILITY_DEN                     ,
       WEIGHTED_AVAILABILITY                ,
       ACCESIBILITY_PS_NUM                  ,
       ACCESIBILITY_PS_DEN                  ,
       ACCESIBILITY_PS_RATE                 ,
       RETENIBILITY_PS_NUM                  ,
       RETENIBILITY_PS_DEN                  ,
       RETENIBILITY_PS_RATE                 ,
       QDA_PS_NUM                           ,
       QDA_PS_DEN                           ,
       QDA_PS_RATE                          ,
       QDR_PS_NUM                           ,
       QDR_PS_DEN                           ,
       QDR_PS_RATE                          ,
       CELL_WO_STATE_USR_NUM                ,
       CELL_WO_STATE_USR_DEN                ,
       CELL_WO_STATE_NET_NUM                ,
       CELL_WO_STATE_NET_DEN                ,
       USER_THROUGHPUT_NUM                  ,
       USER_THROUGHPUT_DEN                  ,
       USER_THROUGHPUT_RATE                 ,
       DLR99MACDMB                          ,
       HSDPAMACDMB                          ,
       ULR99MACDMB                          ,
       HSUPAMACESMB                         ,
       WCELL_NAME                           ,
       PORTADORA                            ,
       MAINTENANCE_REGION_NAME              ,
       NUM_BB_SUBUNITS                      ,
       MAX_USED_BB_SUBUNITS                 ,
       UTIL_BB                              ,
       PTXCELLMAX                           ,
       MAXDLPOWERCAPABILITY                 ,
       CELLPOWER_DBM                        ,
       CELLPOWER_W                          ,
       FR                                   ,
       FSM                                  ,
       ROUND(
       QDA_CS_RATE * QDR_CS_RATE *
       RETENTION_CS_RATE *
       (100 - DIRECT_RETRY_RATE) *
       WEIGHTED_AVAILABILITY /
       POWER(10, 8), 4) NQI                 ,
       
       TWAMP_RTT_AVERAGE                    ,
       IP_TWAMP_PS_RATIO_NUM                ,
       IP_TWAMP_PS_RATIO_DEN                ,
       IP_TWAMP_PS_RATIO_RATE               ,
       
       PEAKRTWP                             ,
       RTWP90HOUR                           ,
       AVGRTWP                              ,
       MINRTWP                              ,
       TOTALHOURSRTWP                       ,
       RTWPGREATERTHAN90                    ,
       LOAD_CELL                            ,
       ERL_EQUIV                            ,
       DL_CELL_SECTOR_THRO_MBPS             ,
       ERL_EQUIV_MEH                        ,
       LOAD_CELL_MEH                        ,
       VOICE_12_2                           ,
       VOICE_5_9                            ,
       HS_A_DCH                             ,
       HS_A_DCH_MEH                         ,
       SRB_STANDALONE                       ,
       DL_PS_R99

  FROM (

SELECT A.FECHA,
       A.OSSRC,
       A.WCELL_GID,
       A.WBTS_GID,
       A.RNC_GID,
       DIRECT_RETRY_NUM,
       DIRECT_RETRY_DEN,
       ROUND(100 * DECODE(DIRECT_RETRY_DEN, 0, 0,
                          DIRECT_RETRY_NUM /
                          DIRECT_RETRY_DEN), 2)          DIRECT_RETRY_RATE,
       RETENTION_NUM                                     RETENTION_CS_NUM,
       RETENTION_DEN                                     RETENTION_CS_DEN,
       ROUND(100 * (1 - DECODE(RETENTION_DEN, 0, 0,
                               RETENTION_NUM /
                               RETENTION_DEN)), 2)       RETENTION_CS_RATE,
       PS_RETENTION_NUM                                  RETENTION_PS_NUM,
       PS_RETENTION_DEN                                  RETENTION_PS_DEN,
       ROUND(100 * (1 - (DECODE(PS_RETENTION_DEN, 0, 0,
                                PS_RETENTION_NUM/
                                PS_RETENTION_DEN))), 2)  RETENTION_PS_RATE,
       VOICE_ERLANGS,
       RAB_STP_FAIL_CS_VOICE_AC,
       RAB_STP_FAIL_CS_VOICE_BTS,
       RAB_STP_FAIL_CS_VOICE_TRANS,
       RAB_STP_FAIL_CS_VOICE_RNC,
       RAB_STP_FAIL_CS_VOICE_FROZBS,
       RAB_STP_FAIL_CS_V_IUB_AAL2,
       RAB_ACC_FAIL_CS_VOICE_MS,
       RAB_ACC_FAIL_CS_VOICE_RNC,
       RRC_CONN_STP_FAIL_AC,
       RRC_CONN_STP_FAIL_BTS,
       RRC_CONN_STP_FAIL_FROZBS,
       RRC_CONN_STP_FAIL_HC,
       RRC_CONN_STP_FAIL_RNC,
       RRC_CONN_STP_FAIL_RNTI_ALLO,
       RRC_CONN_STP_FAIL_IUB_AAL2,
       RRC_CONN_STP_FAIL_TRANS,
       RAB_ACT_FAIL_CS_VOICE_IU,
       RAB_ACT_FAIL_CS_VOICE_RADIO,
       RAB_ACT_FAIL_CS_VOICE_BTS,
       RAB_ACT_FAIL_CS_VOICE_IUR,
       RAB_ACT_FAIL_CS_VOICE_RNC,
       RAB_ACT_FAIL_CS_VOICE_UE,
       RRC_RE_EST_SUCC_RT,
       RRC_CSS_VOZ_NUM,
       RRC_CSS_VOZ_DEN,
       RAB_CSS_VOZ_NUM,
       RAB_CSS_VOZ_DEN,
       RAB_DROP_VOZ_USR_NUM,
       RAB_DROP_VOZ_USR_DEN,
       ACCESIBILIDAD_CS,
       RETENIBILIDAD_CS,
       A.QDA_NUM                                     QDA_CS_NUM,
       A.QDA_DEN                                     QDA_CS_DEN,
       ROUND(100 * DECODE(A.QDA_DEN,0 ,0,
                          A.QDA_NUM / A.QDA_DEN), 4) QDA_CS_RATE,
       A.QDR_NUM                                     QDR_CS_NUM,
       A.QDR_DEN                                     QDR_CS_DEN,
       ROUND(100 * DECODE(A.QDR_DEN, 0 ,0,
                          A.QDR_NUM / A.QDR_DEN), 4) QDR_CS_RATE,
       CS_ERL_NUM,
       PERIOD_DURATION_CELLRES CS_ERL_DEN,
       DECODE(PERIOD_DURATION_CELLRES, 0, 0,
       ROUND(CS_ERL_NUM / (100 * 60 * PERIOD_DURATION_CELLRES), 4)) CS_ERL,
       HSDPA_USERS_RATIO_NUM,
       HSDPA_USERS_RATIO_DEN,
       ROUND(100 * DECODE(HSDPA_USERS_RATIO_DEN, 0, 0,
                          HSDPA_USERS_RATIO_NUM /
                          HSDPA_USERS_RATIO_DEN), 2) HSDPA_USERS_RATIO_RATE,
       AVAILABILITY_NUM,
       AVAILABILITY_DEN,
       ROUND(100 * DECODE(AVAILABILITY_DEN, 0, 0,
                          AVAILABILITY_NUM /
                          AVAILABILITY_DEN), 4) WEIGHTED_AVAILABILITY,

       ACCESIBILITY_NUM  ACCESIBILITY_PS_NUM,
       ACCESIBILITY_DEN  ACCESIBILITY_PS_DEN,
       ACCESIBILITY_PS   ACCESIBILITY_PS_RATE,

       RETENIBILITY_NUM  RETENIBILITY_PS_NUM,
       RETENIBILITY_DEN  RETENIBILITY_PS_DEN,
       RETENIBILITY_PS   RETENIBILITY_PS_RATE,

       B.QDA_NUM                                     QDA_PS_NUM,
       B.QDA_DEN                                     QDA_PS_DEN,
       ROUND(100 * DECODE(B.QDA_DEN,0 ,0,
                          B.QDA_NUM / B.QDA_DEN), 4) QDA_PS_RATE,

       B.QDR_NUM                                     QDR_PS_NUM,
       B.QDR_DEN                                     QDR_PS_DEN,
       ROUND(100 * DECODE(B.QDR_DEN, 0 ,0,
                          B.QDR_NUM / B.QDR_DEN), 4) QDR_PS_RATE,

       CELL_WO_STATE_USR_NUM,
       CELL_WO_STATE_USR_DEN,
       CELL_WO_STATE_NET_NUM,
       CELL_WO_STATE_NET_DEN,

       USER_THROUGHPUT_NUM,
       USER_THROUGHPUT_DEN,
       ROUND(USER_THROUGHPUT_NUM /
             USER_THROUGHPUT_DEN, 2) USER_THROUGHPUT_RATE,

       DLR99MACDMB,
       HSDPAMACDMB,
       ULR99MACDMB,
       HSUPAMACESMB,

       WCELL_NAME,
       PORTADORA,
       MAINTENANCE_REGION_NAME,

       NUM_BB_SUBUNITS,
       MAX_USED_BB_SUBUNITS,
       UTIL_BB,

       PTXCELLMAX,
       MAXDLPOWERCAPABILITY,
       CELLPOWER_DBM,
       CELLPOWER_W,

       FR,
       FSM,
       
       TWAMP_RTT_AVERAGE,
       IP_TWAMP_PS_RATIO_NUM,
       IP_TWAMP_PS_RATIO_DEN,
       IP_TWAMP_PS_RATIO_RATE,
       
       PEAKRTWP,
       RTWP90HOUR,
       AVGRTWP,
       MINRTWP,
       TOTALHOURSRTWP,
       RTWPGREATERTHAN90,
       LOAD_CELL,
       ERL_EQUIV,
       DL_CELL_SECTOR_THRO_MBPS,
       ERL_EQUIV_MEH,
       LOAD_CELL_MEH,
       VOICE_12_2,
       VOICE_5_9,
       HS_A_DCH,
       HS_A_DCH_MEH,
       SRB_STANDALONE,
       DL_PS_R99


  FROM CLDD_NQI_1ST_AUX_HOUR A,
       CLDD_NQI_2ND_AUX_HOUR B,
       CLDD_NQI_3RD_AUX_HOUR C,
       CLDD_NQI_TWP_AUX_HOUR T,
       CLDD_RADAR_AUX_HOUR   R,
       (
SELECT PERIOD_START_TIME FECHA,
       OSSRC,
       WBTS_GID,
       RNC_GID,
       /*AVG(NUM_BB_SUBUNITS)      */NUM_BB_SUBUNITS,
       /*MAX(MAX_USED_BB_SUBUNITS) */MAX_USED_BB_SUBUNITS,
       100 *
       DECODE(/*AVG*/(NUM_BB_SUBUNITS), 0, 0,
              /*MAX*/(MAX_USED_BB_SUBUNITS) /
              /*AVG*/(NUM_BB_SUBUNITS)) UTIL_BB
  FROM UMTS_C_NSN_WBTSMON_WBTS_RAW@SMART.WORLD
 WHERE PERIOD_START_TIME BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY HH24')
                             AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY HH24')
   AND OSSRC = RC
       ) D,
       (
SELECT WCELL_GID,
       OSSRC,
       WCELL_NAME,
       PORTADORA,
       MAINTENANCE_REGION_NAME
  FROM (
SELECT WCELL_ID WCELL_GID,
       OSSRC,
       WCELL_NAME,
       PORTADORA,
       MAINTENANCE_REGION_NAME,
       ROW_NUMBER() OVER(PARTITION BY WCELL_ID, OSSRC ORDER BY WCELL_VALID_START_DATE DESC, WCELL_VALID_FINISH_DATE DESC) ORDEN
  FROM OBJECTS_SP_UMTS@SMART.WORLD
 WHERE OSSRC = RC
   AND DATOS = 'OBJECT2'
       )
 WHERE ORDEN = 1
       ) O,
       (
SELECT WCEL || WBTS || RNC WCELL_GID,
       OSSRC,
       PTXCELLMAX, MAXDLPOWERCAPABILITY,
       LEAST(PTXCELLMAX, MAXDLPOWERCAPABILITY) / 10 CELLPOWER_DBM,
       ROUND(POWER(10, (((LEAST(PTXCELLMAX, MAXDLPOWERCAPABILITY) / 10) -30) / 10)), 0) CELLPOWER_W
  FROM OBJECTS_NSN_WCEL_AUX@SMART.WORLD
  WHERE OSSRC = RC
       ) F,
       (
SELECT OSSRC,
       WBTS || RNC WBTS_GID,
       --WBTS,
       WBTSNAME,
       GETVALUEPARAM(LIST_UNITLIST, 'FR') FR,
       GETVALUEPARAM(LIST_UNITLIST, 'FSM') || DECODE(TRIM(GETVALUEPARAM(LIST_UNITLIST, 'FSP')), NULL, NULL, '+' ||
                                                     TRIM(GETVALUEPARAM(LIST_UNITLIST, 'FSP'))) FSM
  FROM (
SELECT A.GID, A.OSSRC, A.WBTS, A.RNC, B.WBTSNAME,
       REPLACE(LIST_UNITLIST, ',', '') LIST_UNITLIST
  FROM OBJECTS_NSN_MRBTS_AUX@SMART.WORLD A,
       OBJECTS_NSN_WBTS_AUX@SMART.WORLD B
 WHERE A.OSSRC = B.OSSRC (+)
   AND A.WBTS = B.WBTS (+)
   AND A.RNC = B.RNC (+)
   AND A.OSSRC = RC
   AND A.WBTS IS NOT NULL
 UNION ALL
SELECT A.GID, A.OSSRC, B.WBTS, B.RNC, B.WBTSNAME,
       REPLACE(LIST_UNITLIST, ',', '') LIST_UNITLIST
  FROM OBJECTS_NSN_MRBTS_AUX@SMART.WORLD A,
       OBJECTS_NSN_WBTS_AUX@SMART.WORLD B
 WHERE A.OSSRC = B.OSSRC (+)
   AND A.NAME = B.WBTSNAME (+)
   AND A.OSSRC = RC
   AND A.WBTS IS NULL
       )
 WHERE LIST_UNITLIST IS NOT NULL
   --AND WBTS || RNC = 51346
       ) G

 WHERE A.FECHA = B.FECHA (+)
   AND A.FECHA = C.FECHA (+)
   AND A.FECHA = D.FECHA (+)
   AND A.FECHA = T.FECHA (+)
   AND A.FECHA = R.FECHA (+)

   AND A.OSSRC = B.OSSRC (+)
   AND A.OSSRC = C.OSSRC (+)
   AND A.OSSRC = D.OSSRC (+)
   AND A.OSSRC = O.OSSRC (+)
   AND A.OSSRC = F.OSSRC (+)
   AND A.OSSRC = G.OSSRC (+)
   AND A.OSSRC = T.OSSRC (+)
   AND A.OSSRC = R.OSSRC (+)

   AND A.WCELL_GID = B.WCELL_GID (+)
   AND A.WCELL_GID = C.WCELL_GID (+)
   AND A.WCELL_GID = O.WCELL_GID (+)
   AND A.WCELL_GID = F.WCELL_GID (+)
   AND A.WCELL_GID = R.WCELL_GID (+)

   AND A.WBTS_GID = G.WBTS_GID (+)
   AND A.WBTS_GID = D.WBTS_GID (+)
   AND A.WBTS_GID = T.WBTS_GID (+)

   AND A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY HH24')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY HH24')
   AND A.OSSRC = RC
       );

TYPE T_TABLERO IS TABLE OF C_TABLERO%ROWTYPE;
TABLERO T_TABLERO;

TYPE T_TABLERO_NQI_HOUR IS TABLE OF TABLERO_NQI_HOUR%ROWTYPE INDEX BY PLS_INTEGER;
TABLERO_NQI_HOU2 T_TABLERO_NQI_HOUR;

C_LIMIT PLS_INTEGER := 1000;

PCNT NUMBER := 0;

BEGIN
  
G_PARTITION_MGMT.P_TRUNCATE_SUBPARTITION_HOUR('TABLERO_NQI_HOUR', P_FECHA_DESDE, P_FECHA_HASTA, 'UMTS WCELL '||P_OSSRC);

OPEN C_TABLERO (P_OSSRC, P_FECHA_DESDE, P_FECHA_HASTA);
LOOP

FETCH C_TABLERO BULK COLLECT INTO TABLERO LIMIT C_LIMIT;

FOR I IN 1 .. TABLERO.COUNT LOOP

  PCNT := PCNT + 1;

  TABLERO_NQI_HOU2(I).FECHA                                     := TABLERO(I).FECHA                                              ;
  TABLERO_NQI_HOU2(I).ELEMENT_CLASS                             := TABLERO(I).PHASE                                              ;
  TABLERO_NQI_HOU2(I).ELEMENT_ID                                := TABLERO(I).WCELL_GID                                          ;
  TABLERO_NQI_HOU2(I).ELEMENT_NAME                              := TABLERO(I).WCELL_NAME                                         ;

  TABLERO_NQI_HOU2(I).DIRECT_RETRY_NUM                          := TABLERO(I).DIRECT_RETRY_NUM                                   ;
  TABLERO_NQI_HOU2(I).DIRECT_RETRY_DEN                          := TABLERO(I).DIRECT_RETRY_DEN                                   ;
  TABLERO_NQI_HOU2(I).DIRECT_RETRY_RATE                         := TABLERO(I).DIRECT_RETRY_RATE                                  ;
  TABLERO_NQI_HOU2(I).RETENTION_CS_NUM                          := TABLERO(I).RETENTION_CS_NUM                                   ;
  TABLERO_NQI_HOU2(I).RETENTION_CS_DEN                          := TABLERO(I).RETENTION_CS_DEN                                   ;
  TABLERO_NQI_HOU2(I).RETENTION_CS_RATE                         := TABLERO(I).RETENTION_CS_RATE                                  ;
  TABLERO_NQI_HOU2(I).RETENTION_PS_NUM                          := TABLERO(I).RETENTION_PS_NUM                                   ;
  TABLERO_NQI_HOU2(I).RETENTION_PS_DEN                          := TABLERO(I).RETENTION_PS_DEN                                   ;
  TABLERO_NQI_HOU2(I).RETENTION_PS_RATE                         := TABLERO(I).RETENTION_PS_RATE                                  ;
  TABLERO_NQI_HOU2(I).VOICE_ERLANGS                             := TABLERO(I).VOICE_ERLANGS                                      ;

  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_VOICE_AC                  := TABLERO(I).RAB_STP_FAIL_CS_VOICE_AC                           ;
  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_VOICE_BTS                 := TABLERO(I).RAB_STP_FAIL_CS_VOICE_BTS                          ;
  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_VOICE_TRANS               := TABLERO(I).RAB_STP_FAIL_CS_VOICE_TRANS                        ;
  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_VOICE_RNC                 := TABLERO(I).RAB_STP_FAIL_CS_VOICE_RNC                          ;
  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_VOICE_FROZBS              := TABLERO(I).RAB_STP_FAIL_CS_VOICE_FROZBS                       ;
  TABLERO_NQI_HOU2(I).RAB_STP_FAIL_CS_V_IUB_AAL2                := TABLERO(I).RAB_STP_FAIL_CS_V_IUB_AAL2                         ;
  TABLERO_NQI_HOU2(I).RAB_ACC_FAIL_CS_VOICE_MS                  := TABLERO(I).RAB_ACC_FAIL_CS_VOICE_MS                           ;
  TABLERO_NQI_HOU2(I).RAB_ACC_FAIL_CS_VOICE_RNC                 := TABLERO(I).RAB_ACC_FAIL_CS_VOICE_RNC                          ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_AC                      := TABLERO(I).RRC_CONN_STP_FAIL_AC                               ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_BTS                     := TABLERO(I).RRC_CONN_STP_FAIL_BTS                              ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_FROZBS                  := TABLERO(I).RRC_CONN_STP_FAIL_FROZBS                           ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_HC                      := TABLERO(I).RRC_CONN_STP_FAIL_HC                               ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_RNC                     := TABLERO(I).RRC_CONN_STP_FAIL_RNC                              ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_RNTI_ALLO               := TABLERO(I).RRC_CONN_STP_FAIL_RNTI_ALLO                        ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_IUB_AAL2                := TABLERO(I).RRC_CONN_STP_FAIL_IUB_AAL2                         ;
  TABLERO_NQI_HOU2(I).RRC_CONN_STP_FAIL_TRANS                   := TABLERO(I).RRC_CONN_STP_FAIL_TRANS                            ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_IU                  := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_IU                           ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_RADIO               := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_RADIO                        ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_BTS                 := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_BTS                          ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_IUR                 := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_IUR                          ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_RNC                 := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_RNC                          ;
  TABLERO_NQI_HOU2(I).RAB_ACT_FAIL_CS_VOICE_UE                  := TABLERO(I).RAB_ACT_FAIL_CS_VOICE_UE                           ;
  TABLERO_NQI_HOU2(I).RRC_RE_EST_SUCC_RT                        := TABLERO(I).RRC_RE_EST_SUCC_RT                                 ;
  TABLERO_NQI_HOU2(I).RRC_CSS_VOZ_NUM                           := TABLERO(I).RRC_CSS_VOZ_NUM                                    ;
  TABLERO_NQI_HOU2(I).RRC_CSS_VOZ_DEN                           := TABLERO(I).RRC_CSS_VOZ_DEN                                    ;
  TABLERO_NQI_HOU2(I).RAB_CSS_VOZ_NUM                           := TABLERO(I).RAB_CSS_VOZ_NUM                                    ;
  TABLERO_NQI_HOU2(I).RAB_CSS_VOZ_DEN                           := TABLERO(I).RAB_CSS_VOZ_DEN                                    ;
  TABLERO_NQI_HOU2(I).RAB_DROP_VOZ_USR_NUM                      := TABLERO(I).RAB_DROP_VOZ_USR_NUM                               ;
  TABLERO_NQI_HOU2(I).RAB_DROP_VOZ_USR_DEN                      := TABLERO(I).RAB_DROP_VOZ_USR_DEN                               ;
  TABLERO_NQI_HOU2(I).ACCESIBILITY_CS_RATE                      := TABLERO(I).ACCESIBILIDAD_CS                                   ;
  TABLERO_NQI_HOU2(I).RETENIBILITY_CS_RATE                      := TABLERO(I).RETENIBILIDAD_CS                                   ;

  TABLERO_NQI_HOU2(I).QDA_CS_NUM                                := TABLERO(I).QDA_CS_NUM                                         ;
  TABLERO_NQI_HOU2(I).QDA_CS_DEN                                := TABLERO(I).QDA_CS_DEN                                         ;
  TABLERO_NQI_HOU2(I).QDA_CS_RATE                               := TABLERO(I).QDA_CS_RATE                                        ;
  TABLERO_NQI_HOU2(I).QDR_CS_NUM                                := TABLERO(I).QDR_CS_NUM                                         ;
  TABLERO_NQI_HOU2(I).QDR_CS_DEN                                := TABLERO(I).QDR_CS_DEN                                         ;
  TABLERO_NQI_HOU2(I).QDR_CS_RATE                               := TABLERO(I).QDR_CS_RATE                                        ;
  TABLERO_NQI_HOU2(I).CS_ERL                                    := TABLERO(I).CS_ERL                                             ;
  TABLERO_NQI_HOU2(I).HSDPA_USERS_RATIO_NUM                     := TABLERO(I).HSDPA_USERS_RATIO_NUM                              ;
  TABLERO_NQI_HOU2(I).HSDPA_USERS_RATIO_DEN                     := TABLERO(I).HSDPA_USERS_RATIO_DEN                              ;
  TABLERO_NQI_HOU2(I).HSDPA_USERS_RATIO_RATE                    := TABLERO(I).HSDPA_USERS_RATIO_RATE                             ;

  TABLERO_NQI_HOU2(I).AVAILABILITY_PS_NUM                       := TABLERO(I).AVAILABILITY_NUM                                   ;
  TABLERO_NQI_HOU2(I).AVAILABILITY_PS_DEN                       := TABLERO(I).AVAILABILITY_DEN                                   ;
  TABLERO_NQI_HOU2(I).AVAILABILITY_PS_RATE                      := TABLERO(I).WEIGHTED_AVAILABILITY                              ;
  TABLERO_NQI_HOU2(I).ACCESIBILITY_PS_NUM                       := TABLERO(I).ACCESIBILITY_PS_NUM                                ;
  TABLERO_NQI_HOU2(I).ACCESIBILITY_PS_DEN                       := TABLERO(I).ACCESIBILITY_PS_DEN                                ;
  TABLERO_NQI_HOU2(I).ACCESIBILITY_PS_RATE                      := TABLERO(I).ACCESIBILITY_PS_RATE                               ;
  TABLERO_NQI_HOU2(I).RETENIBILITY_PS_NUM                       := TABLERO(I).RETENIBILITY_PS_NUM                                ;
  TABLERO_NQI_HOU2(I).RETENIBILITY_PS_DEN                       := TABLERO(I).RETENIBILITY_PS_DEN                                ;
  TABLERO_NQI_HOU2(I).RETENIBILITY_PS_RATE                      := TABLERO(I).RETENIBILITY_PS_RATE                               ;
  TABLERO_NQI_HOU2(I).QDA_PS_NUM                                := TABLERO(I).QDA_PS_NUM                                         ;
  TABLERO_NQI_HOU2(I).QDA_PS_DEN                                := TABLERO(I).QDA_PS_DEN                                         ;
  TABLERO_NQI_HOU2(I).QDA_PS_RATE                               := TABLERO(I).QDA_PS_RATE                                        ;
  TABLERO_NQI_HOU2(I).QDR_PS_NUM                                := TABLERO(I).QDR_PS_NUM                                         ;
  TABLERO_NQI_HOU2(I).QDR_PS_DEN                                := TABLERO(I).QDR_PS_DEN                                         ;
  TABLERO_NQI_HOU2(I).QDR_PS_RATE                               := TABLERO(I).QDR_PS_RATE                                        ;
  TABLERO_NQI_HOU2(I).CELL_WO_STATE_USR_NUM                     := TABLERO(I).CELL_WO_STATE_USR_NUM                              ;
  TABLERO_NQI_HOU2(I).CELL_WO_STATE_USR_DEN                     := TABLERO(I).CELL_WO_STATE_USR_DEN                              ;
  TABLERO_NQI_HOU2(I).CELL_WO_STATE_NET_NUM                     := TABLERO(I).CELL_WO_STATE_NET_NUM                              ;
  TABLERO_NQI_HOU2(I).CELL_WO_STATE_NET_DEN                     := TABLERO(I).CELL_WO_STATE_NET_DEN                              ;
  TABLERO_NQI_HOU2(I).USER_THROUGHPUT_NUM                       := TABLERO(I).USER_THROUGHPUT_NUM                                ;
  TABLERO_NQI_HOU2(I).USER_THROUGHPUT_DEN                       := TABLERO(I).USER_THROUGHPUT_DEN                                ;
  TABLERO_NQI_HOU2(I).USER_THROUGHPUT_RATE                      := TABLERO(I).USER_THROUGHPUT_RATE                               ;
  TABLERO_NQI_HOU2(I).DLR99MACDMB                               := TABLERO(I).DLR99MACDMB                                        ;
  TABLERO_NQI_HOU2(I).HSDPAMACDMB                               := TABLERO(I).HSDPAMACDMB                                        ;
  TABLERO_NQI_HOU2(I).ULR99MACDMB                               := TABLERO(I).ULR99MACDMB                                        ;
  TABLERO_NQI_HOU2(I).HSUPAMACESMB                              := TABLERO(I).HSUPAMACESMB                                       ;

  --TABLERO_NQI_HOU2(I).SECTORES                                  := TABLERO(I).SECTORES                                           ;
  TABLERO_NQI_HOU2(I).PORTADORA                                 := TABLERO(I).PORTADORA                                          ;

  TABLERO_NQI_HOU2(I).RF_CONFIGURATION                          := TABLERO(I).FR                                                 ;
  TABLERO_NQI_HOU2(I).SM_CONFIGURATION                          := TABLERO(I).FSM                                                ;
  TABLERO_NQI_HOU2(I).BB_CONFIGURATION                          := TABLERO(I).UTIL_BB                                            ;
  TABLERO_NQI_HOU2(I).POTENCIA                                  := TABLERO(I).CELLPOWER_W                                        ;
  TABLERO_NQI_HOU2(I).NQI                                       := TABLERO(I).NQI                                                ;

  TABLERO_NQI_HOU2(I).NUM_BB_SUBUNITS                           := TABLERO(I).NUM_BB_SUBUNITS                                    ;
  TABLERO_NQI_HOU2(I).MAX_USED_BB_SUBUNITS                      := TABLERO(I).MAX_USED_BB_SUBUNITS                               ;
  TABLERO_NQI_HOU2(I).PTXCELLMAX                                := TABLERO(I).PTXCELLMAX                                         ;
  TABLERO_NQI_HOU2(I).MAXDLPOWERCAPABILITY                      := TABLERO(I).MAXDLPOWERCAPABILITY                               ;
  TABLERO_NQI_HOU2(I).CELLPOWER_DBM                             := TABLERO(I).CELLPOWER_DBM                                      ;

  TABLERO_NQI_HOU2(I).TWAMP_RTT_AVERAGE                         := TABLERO(I).TWAMP_RTT_AVERAGE                                  ;
  TABLERO_NQI_HOU2(I).IP_TWAMP_PS_RATIO_NUM                     := TABLERO(I).IP_TWAMP_PS_RATIO_NUM                              ;
  TABLERO_NQI_HOU2(I).IP_TWAMP_PS_RATIO_DEN                     := TABLERO(I).IP_TWAMP_PS_RATIO_DEN                              ;
  TABLERO_NQI_HOU2(I).IP_TWAMP_PS_RATIO_RATE                    := TABLERO(I).IP_TWAMP_PS_RATIO_RATE                             ;

  TABLERO_NQI_HOU2(I).PEAKRTWP                                  := TABLERO(I).PEAKRTWP                                           ;
  TABLERO_NQI_HOU2(I).RTWP90HOUR                                := TABLERO(I).RTWP90HOUR                                         ;
  TABLERO_NQI_HOU2(I).AVGRTWP                                   := TABLERO(I).AVGRTWP                                            ;
  TABLERO_NQI_HOU2(I).MINRTWP                                   := TABLERO(I).MINRTWP                                            ;
  TABLERO_NQI_HOU2(I).TOTALHOURSRTWP                            := TABLERO(I).TOTALHOURSRTWP                                     ;
  TABLERO_NQI_HOU2(I).RTWPGREATERTHAN90                         := TABLERO(I).RTWPGREATERTHAN90                                  ;
  TABLERO_NQI_HOU2(I).LOAD_CELL                                 := TABLERO(I).LOAD_CELL                                          ;
  TABLERO_NQI_HOU2(I).ERL_EQUIV                                 := TABLERO(I).ERL_EQUIV                                          ;
  TABLERO_NQI_HOU2(I).DL_CELL_SECTOR_THRO_MBPS                  := TABLERO(I).DL_CELL_SECTOR_THRO_MBPS                           ;
  TABLERO_NQI_HOU2(I).ERL_EQUIV_MEH                             := TABLERO(I).ERL_EQUIV_MEH                                      ;
  TABLERO_NQI_HOU2(I).LOAD_CELL_MEH                             := TABLERO(I).LOAD_CELL_MEH                                      ;
  TABLERO_NQI_HOU2(I).VOICE_12_2                                := TABLERO(I).VOICE_12_2                                         ;
  TABLERO_NQI_HOU2(I).VOICE_5_9                                 := TABLERO(I).VOICE_5_9                                          ;
  TABLERO_NQI_HOU2(I).HS_A_DCH                                  := TABLERO(I).HS_A_DCH                                           ;
  TABLERO_NQI_HOU2(I).HS_A_DCH_MEH                              := TABLERO(I).HS_A_DCH_MEH                                       ;
  TABLERO_NQI_HOU2(I).SRB_STANDALONE                            := TABLERO(I).SRB_STANDALONE                                     ;
  TABLERO_NQI_HOU2(I).DL_PS_R99                                 := TABLERO(I).DL_PS_R99                                          ;

  TABLERO_NQI_HOU2(I).MAINTENANCE_REGION_NAME                   := TABLERO(I).MAINTENANCE_REGION_NAME                            ;

END LOOP;

IF C_TABLERO%NOTFOUND THEN

   FORALL I IN TABLERO_NQI_HOU2.FIRST .. PCNT
   INSERT INTO TABLERO_NQI_HOUR VALUES TABLERO_NQI_HOU2(I);

   EXIT;

ELSE

   FORALL I IN TABLERO_NQI_HOU2.FIRST .. TABLERO_NQI_HOU2.LAST
   INSERT INTO TABLERO_NQI_HOUR VALUES TABLERO_NQI_HOU2(I);

END IF;

PCNT := 0;

END LOOP;

CLOSE C_TABLERO;

COMMIT;

END P_TABLERO_NQI_HOUR_INS;
