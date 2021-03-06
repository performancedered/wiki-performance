CREATE OR REPLACE PROCEDURE P_UMTS_CLDD_NQI_TWP_AUX_INS (P_FECHA_DESDE IN CHAR, P_FECHA_HASTA IN CHAR, P_OSSRC IN CHAR) IS

-- Autor: Monica Pellegrini. Fecha: 14.11.2016
-- Actualizacion: Mario Heredia. Fecha: 12.06.2017. Motivo: Migracion de Perdido a Falda.

CURSOR CUR_NSN_NQI_TWP_HOUR (FECHA_DESDE VARCHAR2, FECHA_HASTA VARCHAR2, RC VARCHAR2) IS
SELECT FECHA                      ,
       OSSRC                      ,
       WBTS_ID                    ,
       TWAMP_RTT_AVERAGE          ,
       IP_TWAMP_PS_RATIO_NUM      ,
       IP_TWAMP_PS_RATIO_DEN      ,
       IP_TWAMP_PS_RATIO
  FROM (
SELECT A.FECHA                    ,
       A.OSSRC                    ,
       A.WBTS_ID                  ,
       A.TWAMP_RTT_AVERAGE        ,
       A.IP_TWAMP_PS_RATIO_NUM    ,
       A.IP_TWAMP_PS_RATIO_DEN    ,
       A.IP_TWAMP_PS_RATIO        ,
       ROW_NUMBER() OVER (PARTITION BY FECHA, WBTS_ID ORDER BY TWSES_ID ASC) ORDEN
  FROM UMTS_NSN_IPTWAMP_WBTS_HOUR@SMART.WORLD A
 WHERE A.FECHA BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY HH24')
                   AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY HH24')
   AND A.OSSRC = RC
       )
 WHERE ORDEN = 1;

TYPE TYP_NSN_NQI_TWP_HOUR IS TABLE OF CUR_NSN_NQI_TWP_HOUR%ROWTYPE INDEX BY BINARY_INTEGER;
NSN_NQI_TWP_HOUR TYP_NSN_NQI_TWP_HOUR;

TYPE T_CLDD_NQI_TWP_AUX_HOUR IS TABLE OF  CLDD_NQI_TWP_AUX_HOUR%ROWTYPE INDEX BY PLS_INTEGER;
CLDD_NQI_TWP_AUX_HOU2 T_CLDD_NQI_TWP_AUX_HOUR;

C_LIMIT PLS_INTEGER := 1000;
PCNT    NUMBER := 0;

BEGIN

-- OPEN | FETCH | CLOSE

OPEN CUR_NSN_NQI_TWP_HOUR (P_FECHA_DESDE, P_FECHA_HASTA, P_OSSRC);

LOOP

FETCH CUR_NSN_NQI_TWP_HOUR BULK COLLECT INTO NSN_NQI_TWP_HOUR LIMIT C_LIMIT;

FOR I IN 1 .. NSN_NQI_TWP_HOUR.COUNT LOOP

  PCNT := PCNT + 1;

  CLDD_NQI_TWP_AUX_HOU2(I).FECHA                          := NSN_NQI_TWP_HOUR(I).FECHA                               ;
  CLDD_NQI_TWP_AUX_HOU2(I).OSSRC                          := NSN_NQI_TWP_HOUR(I).OSSRC                               ;
  CLDD_NQI_TWP_AUX_HOU2(I).WBTS_GID                       := NSN_NQI_TWP_HOUR(I).WBTS_ID                             ;
  CLDD_NQI_TWP_AUX_HOU2(I).TWAMP_RTT_AVERAGE              := NSN_NQI_TWP_HOUR(I).TWAMP_RTT_AVERAGE                   ;
  CLDD_NQI_TWP_AUX_HOU2(I).IP_TWAMP_PS_RATIO_NUM          := NSN_NQI_TWP_HOUR(I).IP_TWAMP_PS_RATIO_NUM               ;
  CLDD_NQI_TWP_AUX_HOU2(I).IP_TWAMP_PS_RATIO_DEN          := NSN_NQI_TWP_HOUR(I).IP_TWAMP_PS_RATIO_DEN               ;
  CLDD_NQI_TWP_AUX_HOU2(I).IP_TWAMP_PS_RATIO_RATE         := NSN_NQI_TWP_HOUR(I).IP_TWAMP_PS_RATIO                   ;

END LOOP;

IF CUR_NSN_NQI_TWP_HOUR%NOTFOUND THEN

   FORALL I IN CLDD_NQI_TWP_AUX_HOU2.FIRST .. PCNT
   INSERT INTO CLDD_NQI_TWP_AUX_HOUR VALUES CLDD_NQI_TWP_AUX_HOU2(I);

   EXIT;

ELSE

   FORALL I IN CLDD_NQI_TWP_AUX_HOU2.FIRST .. CLDD_NQI_TWP_AUX_HOU2.LAST
   INSERT INTO CLDD_NQI_TWP_AUX_HOUR VALUES CLDD_NQI_TWP_AUX_HOU2(I);

END IF;

PCNT := 0;

END LOOP;

COMMIT;

END P_UMTS_CLDD_NQI_TWP_AUX_INS;
