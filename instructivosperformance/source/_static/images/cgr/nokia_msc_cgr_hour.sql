-- Autor: Mario Heredia.
-- Actualizacion: Mario Heredia. Fecha: 06.10.2011.
-- Actualizacion: Mario Heredia. Fecha: 27.12.2011. Motivo: Se cambia el tbs AUXILIAR por TBS_AUXILIAR. Se quitan COMMIT's innecesarios.
-- Actualizacion: Mario Heredia. Fecha: 10.04.2013. Motivo: Se filtra por NetworkName en NokiaObjectsCgrRelation.
-- Actualizacion: Monica Pellegrini. Fecha: 30.06.2014. Motivo: se implementa variables bind.
-- Actualizacion: Monica Pellegrini. Fecha: 26.02.2016. Motivo: Se comienza a tomar datos desde tablas de smart.
-- Actualizacion: Mario Heredia. Fecha: 27.12.2016.

VARIABLE FECHA_DESDE VARCHAR2(15);
VARIABLE FECHA_HASTA VARCHAR2(15);
VARIABLE MASCARA     VARCHAR2(15);
VARIABLE MASCARA1    VARCHAR2(15);
VARIABLE CGR_NAME    VARCHAR2(2);
VARIABLE NN          VARCHAR2(15);
VARIABLE CN          VARCHAR2(15);

EXEC :FECHA_DESDE := '&1 &2';
EXEC :FECHA_HASTA := '&3 &4';
EXEC :MASCARA     := 'DD.MM.YYYY HH24';
EXEC :MASCARA1    := 'HH24';
EXEC :CGR_NAME    := 'B';
EXEC :NN          := 'NSN';
EXEC :CN          := 'UNKNOWN';

DROP TABLE AUX_NOKIA_MSC_CGR_HOUR PURGE;

CREATE TABLE AUX_NOKIA_MSC_CGR_HOUR
(
FECHA                  DATE,
MSC_NAME               VARCHAR2(30),
MSS_INT_ID             NUMBER,
CGR_NAME               VARCHAR2(255),
CGR_NUMBER             VARCHAR2(255),
CGR_TYPE               VARCHAR2(1),
CGR_DIRECTION          VARCHAR2(255),
TOTAL_CGR              NUMBER,
AVERAGE_CGR            NUMBER,
ERLANG                 NUMBER,
ERLANG_IN              NUMBER,
ERLANG_OUT             NUMBER,
UTIL                   NUMBER,
CAPACITY               NUMBER,
TIMECONG_PERCENTX100   NUMBER,
CALL_CONG_X_100        NUMBER,
CALL_AMOUNT_IN         NUMBER,
CALL_AMOUNT_OUT        NUMBER,
ACCEPTED_IN            NUMBER,
ACCEPTED_OUT           NUMBER,
ANSWERED_IN            NUMBER,
ANSWERED_OUT           NUMBER,
SUBS_FAIL_IN           NUMBER,
SUBS_FAIL_OUT          NUMBER,
INT_FAIL_IN            NUMBER,
INT_FAIL_OUT           NUMBER,
EXT_FAIL_IN            NUMBER,
EXT_FAIL_OUT           NUMBER,
TOTAL_CALLS_AMOUNT     NUMBER
)TABLESPACE TBS_AUXILIAR;

INSERT INTO AUX_NOKIA_MSC_CGR_HOUR
SELECT TRUNC(CGR.FECHA, :MASCARA1) FECHA,
       OMSC.MSS_NAME MSC_NAME,
       OMSC.MSC_ID MSS_INT_ID,
       CGR.CGR_NAME_ID CGR_NAME,
       CGR.CGR_ID CGR_NUMBER,
       SUBSTR(CGR.CGR_NAME_ID,0,1) CGR_TYPE,
       CGR.CGR_DIR_ID CGR_DIRECTION, -- 1,INCOMING ; 2,OUTGOING ; 3,BI-DIRECTIONAL
       CGR.CGRCGROUP_NOF_CIRCUITS TOTAL_CGR,
       ROUND(DECODE(NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,0) *
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT,0), 0,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT,0)) / 100,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT,0)) / 2 / 100), 0) AVERAGE_CGR,
       ROUND((NVL(CGR.CGRCGROUP_ERLANGS_IN_X_100,0) +
              NVL(CGR.CGRCGROUP_ERLANGS_OUT_X_100,0)) / 100, 2) ERLANG,
       ROUND(NVL((CGR.CGRCGROUP_ERLANGS_IN_X_100) / 100, 0), 2) ERLANG_IN,
       ROUND(NVL((CGR.CGRCGROUP_ERLANGS_OUT_X_100) / 100, 0), 2) ERLANG_OUT,
       NVL(ROUND(100 * DECODE((ROUND(SCOTT.ERLANGB_CAPACITY(TO_CHAR(NVL(DECODE(
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) *
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0), 0,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 100,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 2 / 100), 0), '9999999990'), 0.01), 2)), 0, 0 + NULL,
            (ROUND((NVL(CGR.CGRCGROUP_ERLANGS_IN_X_100 / 100, 0) +
                    NVL(CGR.CGRCGROUP_ERLANGS_OUT_X_100 / 100, 0)), 2)) /
       (ROUND(SCOTT.ERLANGB_CAPACITY(
           TO_CHAR(NVL(DECODE(NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) *
                              NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0), 0,
                             (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) +
                              NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 100,
                             (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN, 0) +
                              NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 2 / 100), 0), '9999999990'), 0.01), 2))), 2), 0) UTIL,
       NVL(ROUND(SCOTT.ERLANGB_CAPACITY(ROUND(DECODE(NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,
               0) * NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0), 0,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,  0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 100,
                   (NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_IN,  0) +
                    NVL(CGR.CGRCGROUP_NOF_WOEX_CRTS_OUT, 0)) / 2 / 100), 0), 0.01), 2), 0) CAPACITY,
       CGRCGROUP_TIMECONG_PERCENTX100                    TIMECONG_PERCENTX100,
       CGRCGROUP_CALL_CONG_X_100                         CALL_CONG_X_100,
       CGRCGROUP_CALL_AMOUNT_IN                          CALL_AMOUNT_IN,
       CGRCGROUP_CALL_AMOUNT_OUT                         CALL_AMOUNT_OUT,
       CGRCGROUP_ACCEPTED_IN                             ACCEPTED_IN,
       CGRCGROUP_ACCEPTED_OUT                            ACCEPTED_OUT,
       CGRCGROUP_ANSWERED_IN                             ANSWERED_IN,
       CGRCGROUP_ANSWERED_OUT                            ANSWERED_OUT,
       CGRCGROUP_SUBS_FAIL_IN                            SUBS_FAIL_IN,
       CGRCGROUP_SUBS_FAIL_OUT                           SUBS_FAIL_OUT,
       CGRCGROUP_INT_FAIL_IN                             INT_FAIL_IN,
       CGRCGROUP_INT_FAIL_OUT                            INT_FAIL_OUT,
       CGRCGROUP_EXT_FAIL_IN                             EXT_FAIL_IN,
       CGRCGROUP_EXT_FAIL_OUT                            EXT_FAIL_OUT,
       CASE WHEN SUBSTR(CGR.CGR_NAME_ID, 1, 1)= :CGR_NAME THEN
         CGRCGROUP_CALL_AMOUNT_IN + CGRCGROUP_CALL_AMOUNT_OUT
       ELSE NULL END TOTAL_CALLS_AMOUNT
  FROM NOKIA_MSC_REGION OMSC,
       CORE_NSN_PS_CGR_CGRDIR1_HOUR  CGR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE, :MASCARA)
                             AND TO_DATE(:FECHA_HASTA, :MASCARA)
   AND CGR.MSC_ID = OMSC.MSC_ID
   AND OMSC.OBJECT_CLASS = 107
   AND CGR.CGR_NAME_ID <>:CN ;

DROP TABLE AU2_NOKIA_MSC_CGR_HOUR PURGE;

CREATE TABLE AU2_NOKIA_MSC_CGR_HOUR
(
FECHA                  DATE,
MSC_NAME               VARCHAR2(30),
MSS_INT_ID             NUMBER,
CGR_NAME               VARCHAR2(255),
CGR_NUMBER             VARCHAR2(255),
CGR_TYPE               VARCHAR2(1),
CGR_DIRECTION          VARCHAR2(255),
MSC_CGR_GROUP          VARCHAR2(255),
TOTAL_CGR              NUMBER,
AVERAGE_CGR            NUMBER,
ERLANG                 NUMBER,
ERLANG_IN              NUMBER,
ERLANG_OUT             NUMBER,
UTIL                   NUMBER,
CAPACITY               NUMBER,
TIMECONG_PERCENTX100   NUMBER,
CALL_CONG_X_100        NUMBER,
CALL_AMOUNT_IN         NUMBER,
CALL_AMOUNT_OUT        NUMBER,
ACCEPTED_IN            NUMBER,
ACCEPTED_OUT           NUMBER,
ANSWERED_IN            NUMBER,
ANSWERED_OUT           NUMBER,
SUBS_FAIL_IN           NUMBER,
SUBS_FAIL_OUT          NUMBER,
INT_FAIL_IN            NUMBER,
INT_FAIL_OUT           NUMBER,
EXT_FAIL_IN            NUMBER,
EXT_FAIL_OUT           NUMBER,
TOTAL_CALLS_AMOUNT     NUMBER,
TIPO                   VARCHAR2(15),
OPERADOR               VARCHAR2(50),
DESBORDE               VARCHAR2(25),
CGR_NUMBERS            VARCHAR2(50)
)TABLESPACE TBS_AUXILIAR;

INSERT INTO AU2_NOKIA_MSC_CGR_HOUR
SELECT A.FECHA,
       A.MSC_NAME,
       A.MSS_INT_ID,
       A.CGR_NAME,
       A.CGR_NUMBER,
       A.CGR_TYPE,
       A.CGR_DIRECTION,
       DECODE(B.MSC_CGR_GROUP, NULL, A.CGR_NAME, B.MSC_CGR_GROUP) MSC_CGR_GROUP,
       A.TOTAL_CGR,
       A.AVERAGE_CGR,
       A.ERLANG,
       A.ERLANG_IN,
       A.ERLANG_OUT,
       A.UTIL,
       A.CAPACITY,
       A.TIMECONG_PERCENTX100,
       A.CALL_CONG_X_100,
       A.CALL_AMOUNT_IN,
       A.CALL_AMOUNT_OUT,
       A.ACCEPTED_IN,
       A.ACCEPTED_OUT,
       A.ANSWERED_IN,
       A.ANSWERED_OUT,
       A.SUBS_FAIL_IN,
       A.SUBS_FAIL_OUT,
       A.INT_FAIL_IN,
       A.INT_FAIL_OUT,
       A.EXT_FAIL_IN,
       A.EXT_FAIL_OUT,
       A.TOTAL_CALLS_AMOUNT,
       B.TIPO,
       B.OPERADOR,
       B.DESBORDE,
       B.CGR_NUMBERS
  FROM AUX_NOKIA_MSC_CGR_HOUR A,
       NOKIA_OBJECTS_CGR_RELATION B
 WHERE A.MSC_NAME = B.MSS_NAME (+)
   AND A.CGR_NAME = B.CGR_NAME (+)
   AND TRUNC(SYSDATE) BETWEEN B.VALID_START_DATE (+)
                          AND B.VALID_FINISH_DATE (+)
   AND B.NETWORK_NAME (+) = :NN;

MERGE INTO NOKIA_MSC_CGR_HOUR D
USING (SELECT FECHA,
              NULL BUSY_HOUR,
              1 PERIOD_DURATION,
              MSC_NAME,
              MSS_INT_ID,
              CGR_NAME,
              CGR_NUMBER,
              CGR_TYPE,
              CGR_DIRECTION,
              MSC_CGR_GROUP,
              TOTAL_CGR,
              AVERAGE_CGR,
              ERLANG,
              ERLANG_IN,
              ERLANG_OUT,
              UTIL,
              CAPACITY,
              TIMECONG_PERCENTX100,
              CALL_CONG_X_100,
              CALL_AMOUNT_IN,
              CALL_AMOUNT_OUT,
              ACCEPTED_IN,
              ACCEPTED_OUT,
              ANSWERED_IN,
              ANSWERED_OUT,
              SUBS_FAIL_IN,
              SUBS_FAIL_OUT,
              INT_FAIL_IN,
              INT_FAIL_OUT,
              EXT_FAIL_IN,
              EXT_FAIL_OUT,
              TOTAL_CALLS_AMOUNT,
              TIPO,
              OPERADOR,
              DESBORDE,
              CGR_NUMBERS
         FROM AU2_NOKIA_MSC_CGR_HOUR
      ) S
   ON (D.FECHA = S.FECHA AND
       D.MSS_INT_ID = S.MSS_INT_ID AND
       D.CGR_NUMBER = S.CGR_NUMBER AND
       D.CGR_TYPE   = S.CGR_TYPE AND
       D.MSC_CGR_GROUP = S.MSC_CGR_GROUP
      )
 WHEN MATCHED THEN UPDATE SET D.TOTAL_CGR = S.TOTAL_CGR,
                              D.AVERAGE_CGR= S.AVERAGE_CGR,
                              D.ERLANG = S.ERLANG,
                              D.ERLANG_IN= S.ERLANG_IN,
                              D.ERLANG_OUT = S.ERLANG_OUT,
                              D.UTIL = S.UTIL,
                              D.CAPACITY = S.CAPACITY,
                              D.TIMECONG_PERCENTX100 = S.TIMECONG_PERCENTX100,
                              D.CALL_CONG_X_100 = S.CALL_CONG_X_100,
                              D.CALL_AMOUNT_IN = S.CALL_AMOUNT_IN,
                              D.CALL_AMOUNT_OUT = S.CALL_AMOUNT_OUT,
                              D.ACCEPTED_IN = S.ACCEPTED_IN,
                              D.ACCEPTED_OUT = S.ACCEPTED_OUT,
                              D.ANSWERED_IN = S.ANSWERED_IN,
                              D.ANSWERED_OUT = S.ANSWERED_OUT,
                              D.SUBS_FAIL_IN = S.SUBS_FAIL_IN,
                              D.SUBS_FAIL_OUT = S.SUBS_FAIL_OUT,
                              D.INT_FAIL_IN = S.INT_FAIL_IN,
                              D.INT_FAIL_OUT = S.INT_FAIL_OUT,
                              D.EXT_FAIL_IN = S.EXT_FAIL_IN,
                              D.EXT_FAIL_OUT = S.EXT_FAIL_OUT,
                              D.TOTAL_CALLS_AMOUNT = S.TOTAL_CALLS_AMOUNT,
                              D.CGR_NUMBERS = S.CGR_NUMBERS
 WHEN NOT MATCHED THEN INSERT (
                              D.FECHA,
                              D.BUSY_HOUR,
                              D.PERIOD_DURATION,
                              D.MSC_NAME,
                              D.MSS_INT_ID,
                              D.CGR_NAME,
                              D.CGR_NUMBER,
                              D.CGR_TYPE,
                              D.CGR_DIRECTION,
                              D.MSC_CGR_GROUP,
                              D.TOTAL_CGR,
                              D.AVERAGE_CGR,
                              D.ERLANG,
                              D.ERLANG_IN,
                              D.ERLANG_OUT,
                              D.UTIL,
                              D.CAPACITY,
                              D.TIMECONG_PERCENTX100,
                              D.CALL_CONG_X_100,
                              D.CALL_AMOUNT_IN,
                              D.CALL_AMOUNT_OUT,
                              D.ACCEPTED_IN,
                              D.ACCEPTED_OUT,
                              D.ANSWERED_IN,
                              D.ANSWERED_OUT,
                              D.SUBS_FAIL_IN,
                              D.SUBS_FAIL_OUT,
                              D.INT_FAIL_IN,
                              D.INT_FAIL_OUT,
                              D.EXT_FAIL_IN,
                              D.EXT_FAIL_OUT,
                              D.TOTAL_CALLS_AMOUNT,
                              D.TIPO,
                              D.OPERADOR,
                              D.DESBORDE,
                              D.CGR_NUMBERS
                              )
                       VALUES (
                              S.FECHA,
                              S.BUSY_HOUR,
                              S.PERIOD_DURATION,
                              S.MSC_NAME,
                              S.MSS_INT_ID,
                              S.CGR_NAME,
                              S.CGR_NUMBER,
                              S.CGR_TYPE,
                              S.CGR_DIRECTION,
                              S.MSC_CGR_GROUP,
                              S.TOTAL_CGR,
                              S.AVERAGE_CGR,
                              S.ERLANG,
                              S.ERLANG_IN,
                              S.ERLANG_OUT,
                              S.UTIL,
                              S.CAPACITY,
                              S.TIMECONG_PERCENTX100,
                              S.CALL_CONG_X_100,
                              S.CALL_AMOUNT_IN,
                              S.CALL_AMOUNT_OUT,
                              S.ACCEPTED_IN,
                              S.ACCEPTED_OUT,
                              S.ANSWERED_IN,
                              S.ANSWERED_OUT,
                              S.SUBS_FAIL_IN,
                              S.SUBS_FAIL_OUT,
                              S.INT_FAIL_IN,
                              S.INT_FAIL_OUT,
                              S.EXT_FAIL_IN,
                              S.EXT_FAIL_OUT,
                              S.TOTAL_CALLS_AMOUNT,
                              S.TIPO,
                              S.OPERADOR,
                              S.DESBORDE,
                              S.CGR_NUMBERS
                              );

COMMIT;

EXIT;
