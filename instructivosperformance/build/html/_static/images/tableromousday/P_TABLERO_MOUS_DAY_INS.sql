CREATE PROCEDURE P_TABLERO_MOUS_DAY_INS (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR) IS
 
-- Autor: Mario Heredia.
-- Actualizacion: Mario Heredia. Fecha: May 29 2009.
-- Actualizacion: Mario Heredia. Fecha: 21.09.2010.
-- Actualizacion: Mario Heredia. Fecha: 26.01.2011.
-- Actualizacion: Mario Heredia. Fecha: 18.07.2011.
-- Actualizacion: Mario Heredia. Fecha: 14.12.2011. Motivo: Se cambia el tbs AUXILIAR por TBS_AUXILIAR.
-- Actualizacion: Mario Heredia. Fecha: 02.12.2014. Motivo: Migracion e Implementacion de Procedure.
-- Actualizacion: Mario Heredia. Fecha: 08.12.2014. Motivo: Implementacion de nuevas variables en la referencia de trafico Mac-D.
-- Actualizacion: Mario Heredia. Fecha: 06.06.2016. Motivo: Implementacion de campo ORDEN = 1, porque existian valores duplicados.
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Multivendor Alm Day.
-- Indicador: Tch Mous. [Mous]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_GSM_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(TCH_MOUS, 0) TCH_MOUS
  FROM (
SELECT A.FECHA,
       ALM.MERCADO,
       SUM(A.TCH_MOUS) TCH_MOUS
  FROM MULTIVENDOR_ALM_DAY A,
       ALM_MERCADO ALM
WHERE ALM.ALM = A.ALM
   AND A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
GROUP BY A.FECHA,
          ALM.MERCADO
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA, R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_GSM_DAY IS TABLE OF CUR_TAB_MOUS_GSM_DAY%ROWTYPE;
TAB_MOUS_GSM_DAY TYP_TAB_MOUS_GSM_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Multivendor Gprs Alm Day.
-- Indicador: Traffic Gprs + Apertura, Traffic Edge + Apertura. [Mbytes]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_GPRS_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(TRAFFIC_DL_EDGE, 0) TRAFFIC_DL_EDGE,
       NVL(TRAFFIC_UL_EDGE, 0) TRAFFIC_UL_EDGE,
       NVL(TRAFFIC_EDGE, 0)    TRAFFIC_EDGE,
       NVL(TRAFFIC_DL_GPRS, 0) TRAFFIC_DL_GPRS,
       NVL(TRAFFIC_UL_GPRS, 0) TRAFFIC_UL_GPRS,
       NVL(TRAFFIC_GPRS, 0)    TRAFFIC_GPRS
  FROM (
SELECT A.FECHA,
       ALM.MERCADO,
       ROUND(SUM(A.EDGE_DL_TRAFFIC)/ 1024, 2) TRAFFIC_DL_EDGE,
       ROUND(SUM(A.EDGE_UL_TRAFFIC)/ 1024, 2) TRAFFIC_UL_EDGE,
       ROUND(SUM(A.EDGE_DL_TRAFFIC +
                 A.EDGE_UL_TRAFFIC)/ 1024, 2) TRAFFIC_EDGE,
       ROUND(SUM(A.GPRS_DL_TRAFFIC)/ 1024, 2) TRAFFIC_DL_GPRS,
       ROUND(SUM(A.GPRS_UL_TRAFFIC)/ 1024, 2) TRAFFIC_UL_GPRS,
       ROUND(SUM(A.GPRS_DL_TRAFFIC +
                 A.GPRS_UL_TRAFFIC)/ 1024, 2) TRAFFIC_GPRS
  FROM MULTIVENDOR_GPRS_ALM_DAY A,
       ALM_MERCADO ALM
WHERE ALM.ALM = A.ALM
   AND A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
GROUP BY A.FECHA,
          ALM.MERCADO
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA,
          R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_GPRS_DAY IS TABLE OF CUR_TAB_MOUS_GPRS_DAY%ROWTYPE;
TAB_MOUS_GPRS_DAY TYP_TAB_MOUS_GPRS_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Rns Ps Servi Service1 Hour. DB: OSSRC1
-- Indicador: SMS MO y SMS MT. [Cantidades]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_SMSM_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(SHORT_MESSAGE_MO, 0) SHORT_MESSAGE_MO,
       NVL(SHORT_MESSAGE_MT, 0) SHORT_MESSAGE_MT
  FROM (
SELECT FECHA,
       MERCADO,
       SHORT_MESSAGE_MO,
       SHORT_MESSAGE_MT
  FROM NSN_MSC_SMSM_MKT_DAY
WHERE FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                 AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA, R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_SMSM_DAY IS TABLE OF CUR_TAB_MOUS_SMSM_DAY%ROWTYPE;
TAB_MOUS_SMSM_DAY TYP_TAB_MOUS_SMSM_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Nokia Msc Traffic Bh.
-- Indicador: Subs Lac Gsm, Subs Lac Umts, Current Subs In Vlr. [Cantidades]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_SUBS_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(TOT_SUBS_LAC_GSM, 0)           TOT_SUBS_LAC_GSM,
       NVL(TOT_SUBS_LAC_UMTS, 0)          TOT_SUBS_LAC_UMTS
  FROM (
SELECT TRUNC(FECHA) FECHA,
       OMSC.MERCADO,
       SUM(A.TOT_SUBS_LAC_GSM) TOT_SUBS_LAC_GSM,
       SUM(A.TOT_SUBS_LAC_UMTS) TOT_SUBS_LAC_UMTS
  FROM NOKIA_MSC_TRAFFIC_BH A,
       NOKIA_OBJECTS_SP_MSC OMSC
WHERE A.MSC_ID = OMSC.MSC_ID
   AND A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
GROUP BY TRUNC(FECHA),
          OMSC.MERCADO
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA,
          R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_SUBS_DAY IS TABLE OF CUR_TAB_MOUS_SUBS_DAY%ROWTYPE;
TAB_MOUS_SUBS_DAY TYP_TAB_MOUS_SUBS_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Umts Nsn Service Alm Day.
-- Indicador: Mous Voz, Mous VideoCall. [Mous]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_UMTS_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(MOUS_VOZ, 0)       MOUS_VOZ,
       NVL(MOUS_VIDEOCALL, 0) MOUS_VIDEOCALL
  FROM (
SELECT A.FECHA,
       ALM.MERCADO,
       ROUND(SUM(A.CS_MOUS_VOZ), 2) MOUS_VOZ,
       ROUND(SUM(A.CS_MOUS_VIDEOCALL), 2) MOUS_VIDEOCALL
  FROM UMTS_NSN_SERVICE_ALM_DAY A,
       ALM_MERCADO ALM
WHERE ALM.ALM = A.ALM
   AND A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
GROUP BY A.FECHA,
          ALM.MERCADO
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA,
          R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_UMTS_DAY IS TABLE OF CUR_TAB_MOUS_UMTS_DAY%ROWTYPE;
TAB_MOUS_UMTS_DAY TYP_TAB_MOUS_UMTS_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Umts Counter Nsn Mac-d Alm Day.
-- Indicador: HSDPA, HSUPA, DLR99 y ULR99. [Mbytes]
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_MACD_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       NVL(HSDPA_MACD_MBYTES, 0)       HSDPA_MACD_MBYTES,
       NVL(DL_R99_MACD_MBYTES, 0)      DL_R99_MACD_MBYTES,
       NVL(UL_R99_MACD_MBYTES, 0)      UL_R99_MACD_MBYTES,
       NVL(HSUPA_MACD_MBYTES, 0)       HSUPA_MACD_MBYTES
  FROM (
SELECT A.PERIOD_START_TIME FECHA,
       ALM.MERCADO,
       ROUND(SUM(A.HS_DSCH_DATA_VOL) / (1024 * 1024), 2) HSDPA_MACD_MBYTES,
       ROUND(SUM(A.NRT_DCH_DL_DATA_VOL) / (1024 * 1024), 2) DL_R99_MACD_MBYTES,
       ROUND(SUM(A.NRT_DCH_DL_DATA_VOL +
                 A.NRT_DCH_HSDPA_UL_DATA_VOL) / (1024 * 1024), 2) UL_R99_MACD_MBYTES,
       ROUND(SUM(A.NRT_EDCH_UL_DATA_VOL) / (1024 * 1024), 2) HSUPA_MACD_MBYTES
  FROM UMTSC_NSN_MACD_ALM_DAY A,
       ALM_MERCADO ALM
WHERE ALM.ALM = A.ALM
   AND A.PERIOD_START_TIME BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                               AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399 / 86400
GROUP BY A.PERIOD_START_TIME,
          ALM.MERCADO
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA,
          R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_MACD_DAY IS TABLE OF CUR_TAB_MOUS_MACD_DAY%ROWTYPE;
TAB_MOUS_MACD_DAY TYP_TAB_MOUS_MACD_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- Tabla: Tablero Mous References.
-- Indicador: Todos los indicadores. Nivel = 'Mercado'.
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_RFRC_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT R.FECHA,
       R.ELEMENT_CLASS,
       R.ELEMENT_NAME,
       TCH_MOUS,
       TRAFFIC_DL_GPRS,
       TRAFFIC_UL_GPRS,
       TRAFFIC_GPRS,
       TRAFFIC_DL_EDGE,
       TRAFFIC_UL_EDGE,
       TRAFFIC_EDGE,
       SHORT_MESSAGE_MO,
       SHORT_MESSAGE_MT,
       TOT_SUBS_LAC_GSM,
       TOT_SUBS_LAC_UMTS,
       MOUS_VOZ,
       MOUS_VIDEOCALL,
       HSDPA_MACD_MBYTES,
       HSUPA_MACD_MBYTES,
       DL_R99_MACD_MBYTES,
       UL_R99_MACD_MBYTES
  FROM (
SELECT FECHA,
       ELEMENT_NAME MERCADO,
       MAX(DECODE(INDICADOR_NOMBRE, 'MOUS'                      , INDICADOR_VALOR)) TCH_MOUS,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_DL_GPRS'           , INDICADOR_VALOR)) TRAFFIC_UL_GPRS,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_UL_GPRS'           , INDICADOR_VALOR)) TRAFFIC_DL_GPRS,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_GPRS'              , INDICADOR_VALOR)) TRAFFIC_GPRS,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_DL_EDGE'           , INDICADOR_VALOR)) TRAFFIC_DL_EDGE,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_UL_EDGE'           , INDICADOR_VALOR)) TRAFFIC_UL_EDGE,
       MAX(DECODE(INDICADOR_NOMBRE, 'TRAFFIC_EDGE'              , INDICADOR_VALOR)) TRAFFIC_EDGE,
       MAX(DECODE(INDICADOR_NOMBRE, 'SHORT_MESSAGE_MO'          , INDICADOR_VALOR)) SHORT_MESSAGE_MO,
       MAX(DECODE(INDICADOR_NOMBRE, 'SHORT_MESSAGE_MT'          , INDICADOR_VALOR)) SHORT_MESSAGE_MT,
       MAX(DECODE(INDICADOR_NOMBRE, 'TOT_SUBS_LAC_GSM'          , INDICADOR_VALOR)) TOT_SUBS_LAC_GSM,
       MAX(DECODE(INDICADOR_NOMBRE, 'TOT_SUBS_LAC_UMTS'         , INDICADOR_VALOR)) TOT_SUBS_LAC_UMTS,
       MAX(DECODE(INDICADOR_NOMBRE, 'UMTS_MOUS_VOZ'             , INDICADOR_VALOR)) MOUS_VOZ,
       MAX(DECODE(INDICADOR_NOMBRE, 'UMTS_MOUS_VIDEOCALL'       , INDICADOR_VALOR)) MOUS_VIDEOCALL,
       MAX(DECODE(INDICADOR_NOMBRE, 'HSDPA_DATA_MBYTES'         , INDICADOR_VALOR
                                  , 'HSDPA_MACD_MBYTES'         , INDICADOR_VALOR)) HSDPA_MACD_MBYTES,
       MAX(DECODE(INDICADOR_NOMBRE, 'HSUPA_DATA_MBYTES'         , INDICADOR_VALOR
                                  , 'HSUPA_MACD_MBYTES'         , INDICADOR_VALOR)) HSUPA_MACD_MBYTES,
       MAX(DECODE(INDICADOR_NOMBRE, 'UMTS_PS_DATA_DL_MBYTES'    , INDICADOR_VALOR
                                  , 'DL_R99_MACD_MBYTES'        , INDICADOR_VALOR)) DL_R99_MACD_MBYTES,
       MAX(DECODE(INDICADOR_NOMBRE, 'UMTS_PS_DATA_UL_MBYTES'    , INDICADOR_VALOR
                                  , 'UL_R99_MACD_MBYTES'        , INDICADOR_VALOR)) UL_R99_MACD_MBYTES
  FROM (
SELECT FECHA,
       ELEMENT_NAME,
       INDICADOR_NOMBRE,
       INDICADOR_VALOR,
       ROW_NUMBER() OVER(PARTITION BY TIPO_SUMARIZACION,
                                      SUB_TIPO_SUMARIZACION,
                                      ELEMENT_TYPE,
                                      ELEMENT_NAME,
                                      INDICADOR_NOMBRE
                             ORDER BY ULTIMA_MODIFICACION DESC) ORDEN
  FROM TABLERO_MOUS_REFERENCES
WHERE FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                 AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399/86400
   AND ELEMENT_TYPE = 'MERCADO'
   AND TIPO_SUMARIZACION = 'DAY'
   AND FLAG_STATUS = 'ENABLED'
       )
WHERE ORDEN = 1
GROUP BY FECHA,
          ELEMENT_NAME
       ) S,
       AUX_REF_TABLERO_MOUS_DAY R
WHERE R.FECHA = S.FECHA (+)
   AND R.ELEMENT_NAME = S.MERCADO (+)
ORDER BY R.FECHA,
          R.ELEMENT_NAME;
 
TYPE TYP_TAB_MOUS_RFRC_DAY IS TABLE OF CUR_TAB_MOUS_RFRC_DAY%ROWTYPE;
TAB_MOUS_RFRC_DAY TYP_TAB_MOUS_RFRC_DAY;
 
--------------------------------------------------------------------------------------------------------------------------------
-- AUX
--------------------------------------------------------------------------------------------------------------------------------
 
CURSOR CUR_TAB_MOUS_REF_DAY (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2) IS
SELECT FECHA,
       'MERCADO' ELEMENT_CLASS,
       MERCADO   ELEMENT_NAME
  FROM CALIDAD_STATUS_REFERENCES A,
       (SELECT DISTINCT MERCADO FROM ALM_MERCADO) B
WHERE FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY')
                 AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY') + 86399/86400
   AND HORA = '00'
ORDER BY FECHA, MERCADO;
 
TYPE REC_TAB_MOUS_REF_DAY IS RECORD (FECHA             DATE         ,
                                     ELEMENT_CLASS     VARCHAR2(20) ,
                                     ELEMENT_NAME      VARCHAR2(20) );
 
TYPE TYP_TAB_MOUS_REF_DAY IS TABLE OF REC_TAB_MOUS_REF_DAY INDEX BY PLS_INTEGER;
TAB_MOUS_REF_DAY TYP_TAB_MOUS_REF_DAY;
 
TYPE TYPE_MERCADOLIST IS TABLE OF VARCHAR2(20);
MERCADOLIST TYPE_MERCADOLIST := TYPE_MERCADOLIST();
 
TYPE TYPE_MERCADODATE IS TABLE OF DATE;
MERCADODATE TYPE_MERCADODATE := TYPE_MERCADODATE();
 
--------------------------------------------------------------------------------------------------------------------------------
-- Type Tabla = 'Tablero Mous Day'
--------------------------------------------------------------------------------------------------------------------------------
 
TYPE TYP_TAB_MOUS_DAY IS TABLE OF TABLERO_MOUS_DAY%ROWTYPE INDEX BY PLS_INTEGER;
--TYPE TYP_TAB_MOUS_DAY IS TABLE OF TYPE_TABLERO_MOUS INDEX BY PLS_INTEGER;
TAB_MOUS_DAY TYP_TAB_MOUS_DAY;
 
C_LIMIT PLS_INTEGER := 100;
 
CNT  NUMBER := 0;
PCNT NUMBER := 0;
 
TYPE INDICADORES_TYPE IS RECORD (TCH_MOUS           NUMBER,
                                 TRAFFIC_GPRS       NUMBER,
                                 TRAFFIC_DL_GPRS    NUMBER,
                                 TRAFFIC_UL_GPRS    NUMBER,
                                 TRAFFIC_EDGE       NUMBER,
                                 TRAFFIC_DL_EDGE    NUMBER,
                                 TRAFFIC_UL_EDGE    NUMBER,
                                 SHORT_MESSAGE_MO   NUMBER,
                                 SHORT_MESSAGE_MT   NUMBER,
                                 MOUS_VOZ           NUMBER,
                                 MOUS_VIDEOCALL     NUMBER,
                                 HSDPA_MACD_MBYTES  NUMBER,
                                 HSUPA_MACD_MBYTES  NUMBER,
                                 DL_R99_MACD_MBYTES NUMBER,
                                 UL_R99_MACD_MBYTES NUMBER,
                                 TOT_SUBS_LAC_GSM   NUMBER,
                                 TOT_SUBS_LAC_UMTS  NUMBER);
 
INDICADORES_VLES INDICADORES_TYPE;
 
VLES T_TYPE_SPARE_DATE;
 
BEGIN
 
VLES := F_MDT_DAILY_EQUAL (TO_DATE(P_FECHA_DESDE, 'DD.MM.YYYY'), TO_DATE(P_FECHA_HASTA, 'DD.MM.YYYY'));
 
FOR I IN 1 .. VLES.COUNT LOOP
 
  -- Drop / Create Reference Table
 
  EXECUTE IMMEDIATE 'DROP TABLE AUX_REF_TABLERO_MOUS_DAY PURGE';
 
  EXECUTE IMMEDIATE 'CREATE TABLE AUX_REF_TABLERO_MOUS_DAY '||
                    '(                                     '||
                    '  FECHA             DATE         ,    '||
                    '  ELEMENT_CLASS     VARCHAR2(20) ,    '||
                    '  ELEMENT_NAME      VARCHAR2(20)      '||
                    ') TABLESPACE TBS_AUXILIAR             ';
 
  -- Insert Reference Table
 
  OPEN CUR_TAB_MOUS_REF_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
 
  LOOP
 
  FETCH CUR_TAB_MOUS_REF_DAY BULK COLLECT INTO TAB_MOUS_REF_DAY LIMIT C_LIMIT;
 
  FORALL I IN 1 .. TAB_MOUS_REF_DAY.COUNT
  INSERT INTO AUX_REF_TABLERO_MOUS_DAY VALUES TAB_MOUS_REF_DAY(I);
 
  EXIT WHEN CUR_TAB_MOUS_REF_DAY%NOTFOUND;
 
  END LOOP;
 
  CLOSE CUR_TAB_MOUS_REF_DAY;
 
  -- Tratamiento
 
  OPEN CUR_TAB_MOUS_GSM_DAY  (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_GPRS_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_SMSM_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_SUBS_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_UMTS_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_MACD_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
  OPEN CUR_TAB_MOUS_RFRC_DAY (VLES(I).SPARE_01_CHR, VLES(I).SPARE_01_CHR);
 
  LOOP
 
  FETCH CUR_TAB_MOUS_GSM_DAY  BULK COLLECT INTO TAB_MOUS_GSM_DAY  LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_GPRS_DAY BULK COLLECT INTO TAB_MOUS_GPRS_DAY LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_SMSM_DAY BULK COLLECT INTO TAB_MOUS_SMSM_DAY LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_SUBS_DAY BULK COLLECT INTO TAB_MOUS_SUBS_DAY LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_UMTS_DAY BULK COLLECT INTO TAB_MOUS_UMTS_DAY LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_MACD_DAY BULK COLLECT INTO TAB_MOUS_MACD_DAY LIMIT C_LIMIT;
  FETCH CUR_TAB_MOUS_RFRC_DAY BULK COLLECT INTO TAB_MOUS_RFRC_DAY LIMIT C_LIMIT;
 
  FOR I IN 1 .. TAB_MOUS_GSM_DAY.COUNT LOOP
 
  CNT  :=  CNT + 1;
  PCNT := PCNT + 1;
 
  SELECT DECODE(TAB_MOUS_RFRC_DAY(I).TCH_MOUS           , NULL,
                 TAB_MOUS_GSM_DAY(I).TCH_MOUS           ,
                TAB_MOUS_RFRC_DAY(I).TCH_MOUS           )                       TCH_MOUS          ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_GPRS       , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_GPRS       ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_GPRS       )                       TRAFFIC_GPRS      ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_DL_GPRS    , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_DL_GPRS    ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_DL_GPRS    )                       TRAFFIC_DL_GPRS   ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_UL_GPRS    , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_UL_GPRS    ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_UL_GPRS    )                       TRAFFIC_UL_GPRS   ,
        DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_EDGE       , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_EDGE       ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_EDGE       )                       TRAFFIC_EDGE      ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_DL_EDGE    , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_DL_EDGE    ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_DL_EDGE    )                       TRAFFIC_DL_EDGE   ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TRAFFIC_UL_EDGE    , NULL,
                TAB_MOUS_GPRS_DAY(I).TRAFFIC_UL_EDGE    ,
                TAB_MOUS_RFRC_DAY(I).TRAFFIC_UL_EDGE    )                       TRAFFIC_UL_EDGE   ,
 
         DECODE(TAB_MOUS_RFRC_DAY(I).SHORT_MESSAGE_MO   , NULL,
                TAB_MOUS_SMSM_DAY(I).SHORT_MESSAGE_MO   ,
                TAB_MOUS_RFRC_DAY(I).SHORT_MESSAGE_MO   )                       SHORT_MESSAGE_MO  ,
         DECODE(TAB_MOUS_RFRC_DAY(I).SHORT_MESSAGE_MT   , NULL,
                TAB_MOUS_SMSM_DAY(I).SHORT_MESSAGE_MT   ,
                TAB_MOUS_RFRC_DAY(I).SHORT_MESSAGE_MT   )                       SHORT_MESSAGE_MT  ,
 
         DECODE(TAB_MOUS_RFRC_DAY(I).MOUS_VOZ           , NULL,
                TAB_MOUS_UMTS_DAY(I).MOUS_VOZ           ,
                TAB_MOUS_RFRC_DAY(I).MOUS_VOZ           )                       MOUS_VOZ          ,
         DECODE(TAB_MOUS_RFRC_DAY(I).MOUS_VIDEOCALL     , NULL,
                TAB_MOUS_UMTS_DAY(I).MOUS_VIDEOCALL     ,
                TAB_MOUS_RFRC_DAY(I).MOUS_VIDEOCALL     )                       MOUS_VIDEOCALL    ,
 
         DECODE(TAB_MOUS_RFRC_DAY(I).HSDPA_MACD_MBYTES  , NULL,
                TAB_MOUS_MACD_DAY(I).HSDPA_MACD_MBYTES  ,
                TAB_MOUS_RFRC_DAY(I).HSDPA_MACD_MBYTES  )                       HSDPA_MACD_MBYTES ,
         DECODE(TAB_MOUS_RFRC_DAY(I).HSUPA_MACD_MBYTES  , NULL,
                TAB_MOUS_MACD_DAY(I).HSUPA_MACD_MBYTES  ,
                TAB_MOUS_RFRC_DAY(I).HSUPA_MACD_MBYTES  )                       HSUPA_MACD_MBYTES ,
        DECODE(TAB_MOUS_RFRC_DAY(I).DL_R99_MACD_MBYTES , NULL,
                TAB_MOUS_MACD_DAY(I).DL_R99_MACD_MBYTES ,
                TAB_MOUS_RFRC_DAY(I).DL_R99_MACD_MBYTES )                       DL_R99_MACD_MBYTES,
         DECODE(TAB_MOUS_RFRC_DAY(I).UL_R99_MACD_MBYTES , NULL,
                TAB_MOUS_MACD_DAY(I).UL_R99_MACD_MBYTES ,
                TAB_MOUS_RFRC_DAY(I).UL_R99_MACD_MBYTES )                       UL_R99_MACD_MBYTES,
 
         DECODE(TAB_MOUS_RFRC_DAY(I).TOT_SUBS_LAC_GSM   , NULL,
                TAB_MOUS_SUBS_DAY(I).TOT_SUBS_LAC_GSM   ,
                TAB_MOUS_RFRC_DAY(I).TOT_SUBS_LAC_GSM   )                       TOT_SUBS_LAC_GSM   ,
         DECODE(TAB_MOUS_RFRC_DAY(I).TOT_SUBS_LAC_UMTS  , NULL,
                TAB_MOUS_SUBS_DAY(I).TOT_SUBS_LAC_UMTS  ,
                TAB_MOUS_RFRC_DAY(I).TOT_SUBS_LAC_UMTS  )                       TOT_SUBS_LAC_UMTS
    INTO INDICADORES_VLES
    FROM DUAL;
 
  MERCADODATE.EXTEND;
  MERCADODATE(MERCADODATE.LAST)              := TAB_MOUS_GSM_DAY(I).FECHA                ;
  MERCADOLIST.EXTEND;
  MERCADOLIST(MERCADOLIST.LAST)              := TRIM(TAB_MOUS_GSM_DAY(I).ELEMENT_NAME)   ;
 
  TAB_MOUS_DAY(I).FECHA                      := TAB_MOUS_GSM_DAY(I).FECHA                ;
  TAB_MOUS_DAY(I).MERCADO                    := TRIM(TAB_MOUS_GSM_DAY(I).ELEMENT_NAME)   ;
  TAB_MOUS_DAY(I).REGION                     := TRIM(TAB_MOUS_GSM_DAY(I).ELEMENT_CLASS)  ;
 
  TAB_MOUS_DAY(I).MOUS                       := INDICADORES_VLES.TCH_MOUS                ;
 
  TAB_MOUS_DAY(I).TRAFFIC_GPRS               := INDICADORES_VLES.TRAFFIC_GPRS            ;
  TAB_MOUS_DAY(I).TRAFFIC_DL_GPRS            := INDICADORES_VLES.TRAFFIC_DL_GPRS         ;
  TAB_MOUS_DAY(I).TRAFFIC_UL_GPRS            := INDICADORES_VLES.TRAFFIC_UL_GPRS         ;
  TAB_MOUS_DAY(I).TRAFFIC_EDGE               := INDICADORES_VLES.TRAFFIC_EDGE            ;
  TAB_MOUS_DAY(I).TRAFFIC_DL_EDGE            := INDICADORES_VLES.TRAFFIC_DL_EDGE         ;
  TAB_MOUS_DAY(I).TRAFFIC_UL_EDGE            := INDICADORES_VLES.TRAFFIC_UL_EDGE         ;
 
  TAB_MOUS_DAY(I).SHORT_MESSAGE_MO           := INDICADORES_VLES.SHORT_MESSAGE_MO        ;
  TAB_MOUS_DAY(I).SHORT_MESSAGE_MT           := INDICADORES_VLES.SHORT_MESSAGE_MT        ;
 
  TAB_MOUS_DAY(I).UMTS_MOUS_VOZ              := INDICADORES_VLES.MOUS_VOZ                ;
  TAB_MOUS_DAY(I).UMTS_MOUS_VIDEOCALL        := INDICADORES_VLES.MOUS_VIDEOCALL          ;
 
  TAB_MOUS_DAY(I).HSDPA_DATA_DL_MBYTES       := INDICADORES_VLES.HSDPA_MACD_MBYTES       ;
  TAB_MOUS_DAY(I).HSUPA_DATA_MBYTES          := INDICADORES_VLES.HSUPA_MACD_MBYTES       ;
  TAB_MOUS_DAY(I).UMTS_PS_DATA_DL_MBYTES     := INDICADORES_VLES.DL_R99_MACD_MBYTES      ;
  TAB_MOUS_DAY(I).UMTS_PS_DATA_UL_MBYTES     := INDICADORES_VLES.UL_R99_MACD_MBYTES      ;
 
  TAB_MOUS_DAY(I).TOT_SUBS_LAC_GSM           := INDICADORES_VLES.TOT_SUBS_LAC_GSM        ;
  TAB_MOUS_DAY(I).TOT_SUBS_LAC_UMTS          := INDICADORES_VLES.TOT_SUBS_LAC_UMTS       ;
 
  TAB_MOUS_DAY(I).CURRENT_SUBSCRIBERS_IN_VLR := INDICADORES_VLES.TOT_SUBS_LAC_GSM        +
                                                INDICADORES_VLES.TOT_SUBS_LAC_UMTS       ;
 
  END LOOP;
 
  --DBMS_OUTPUT.PUT_LINE(PCNT||' '||CNT);
 
  IF CUR_TAB_MOUS_GSM_DAY%NOTFOUND THEN
 
     FORALL I IN MERCADOLIST.FIRST .. PCNT
     DELETE FROM TABLERO_MOUS_DAY WHERE MERCADO = MERCADOLIST(I) AND FECHA = MERCADODATE(I) AND REGION = 'MERCADO';
 
     FORALL I IN TAB_MOUS_DAY.FIRST .. PCNT
     INSERT INTO TABLERO_MOUS_DAY VALUES TAB_MOUS_DAY(I);
 
     PCNT := 0;
     MERCADOLIST.DELETE;
     MERCADODATE.DELETE;
 
     EXIT;
 
  ELSE
 
     FORALL I IN MERCADOLIST.FIRST .. MERCADOLIST.LAST
     DELETE FROM TABLERO_MOUS_DAY WHERE MERCADO = MERCADOLIST(I) AND FECHA = MERCADODATE(I) AND REGION = 'MERCADO';
 
     FORALL I IN TAB_MOUS_DAY.FIRST .. TAB_MOUS_DAY.LAST
     INSERT INTO TABLERO_MOUS_DAY VALUES TAB_MOUS_DAY(I);
 
  END IF;
 
  PCNT := 0;
  MERCADOLIST.DELETE;
  MERCADODATE.DELETE;
 
  END LOOP;
 
  CLOSE CUR_TAB_MOUS_GSM_DAY;
  CLOSE CUR_TAB_MOUS_GPRS_DAY;
  CLOSE CUR_TAB_MOUS_SMSM_DAY;
  CLOSE CUR_TAB_MOUS_SUBS_DAY;
  CLOSE CUR_TAB_MOUS_UMTS_DAY;
  CLOSE CUR_TAB_MOUS_MACD_DAY;
  CLOSE CUR_TAB_MOUS_RFRC_DAY;
 
END LOOP;
 
COMMIT;
 
END P_TABLERO_MOUS_DAY_INS;
 