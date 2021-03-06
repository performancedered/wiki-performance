 -- Actualizacion: Monica Pellegrini. Fecha: 30.06.2014. Motivo: se implementa variables bind.

VARIABLE FECHA_DESDE VARCHAR2(15);
VARIABLE FECHA_HASTA VARCHAR2(15);
VARIABLE MASCARA     VARCHAR2(15);
VARIABLE CGR_NAME    VARCHAR2(15);


EXEC :FECHA_DESDE := '&1 &2';
EXEC :FECHA_HASTA := '&3 &4';
EXEC :MASCARA     := 'DD.MM.YYYY HH24';
EXEC :CGR_NAME    := 'B';

MERGE INTO NOKIA_MSC_CGR_MK_HOUR D
 USING (
SELECT FECHA,
       ROUND(AVG(PERIOD_DURATION),2) PERIOD_DURATION,
       REG.MERCADO MSC_REGION,
       CGR_TYPE,
       CGR_DIRECTION,
       SUM(TOTAL_CGR) TOTAL_CGR,
       SUM(AVERAGE_CGR) AVERAGE_CGR,
       SUM(ERLANG) ERLANG,
       SUM(ERLANG_IN) ERLANG_IN,
       SUM(ERLANG_OUT) ERLANG_OUT,
       ROUND(SUM(ERLANG) / SCOTT.ERLANGB_CAPACITY(SUM(AVERAGE_CGR),0.01)*100,2) UTIL,
       ROUND(SCOTT.ERLANGB_CAPACITY(SUM(AVERAGE_CGR),0.01),2) CAPACITY,
       SUM(TIMECONG_PERCENTX100) TIMECONG_PERCENTX100,
       SUM(CALL_CONG_X_100) CALL_CONG_X_100,
       SUM(CALL_AMOUNT_IN) CALL_AMOUNT_IN,
       SUM(CALL_AMOUNT_OUT) CALL_AMOUNT_OUT,
       SUM(ACCEPTED_IN) ACCEPTED_IN,
       SUM(ACCEPTED_OUT) ACCEPTED_OUT,
       SUM(ANSWERED_IN) ANSWERED_IN,
       SUM(ANSWERED_OUT) ANSWERED_OUT,
       SUM(SUBS_FAIL_IN) SUBS_FAIL_IN,
       SUM(SUBS_FAIL_OUT) SUBS_FAIL_OUT,
       SUM(INT_FAIL_IN) INT_FAIL_IN,
       SUM(INT_FAIL_OUT) INT_FAIL_OUT,
       SUM(EXT_FAIL_IN) EXT_FAIL_IN,
       SUM(EXT_FAIL_OUT) EXT_FAIL_OUT,
       CASE WHEN CGR_TYPE= :CGR_NAME THEN
          (SUM(CALL_AMOUNT_IN) + SUM(CALL_AMOUNT_OUT))
       ELSE NULL END TOTAL_CALLS_AMOUNT
  FROM NOKIA_MSC_CGR_HOUR H,
       NOKIA_OBJECTS_SP_MSC REG
 WHERE H.MSC_NAME = REG.MSC_NAME
   AND FECHA BETWEEN TO_DATE(:FECHA_DESDE, :MASCARA)
                 AND TO_DATE(:FECHA_HASTA, :MASCARA)
 GROUP BY FECHA, REG.MERCADO, CGR_TYPE, CGR_DIRECTION
 ORDER BY FECHA, REG.MERCADO, CGR_TYPE, CGR_DIRECTION
       ) S
    ON (
       D.FECHA = S.FECHA AND
       D.MSC_REGION = S.MSC_REGION AND
       D.CGR_TYPE = S.CGR_TYPE AND
       D.CGR_DIRECTION = S.CGR_DIRECTION
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
                               D.TOTAL_CALLS_AMOUNT = S.TOTAL_CALLS_AMOUNT
  WHEN NOT MATCHED THEN INSERT
       (
       D.FECHA,                         D.PERIOD_DURATION,
       D.MSC_REGION,
       D.CGR_TYPE,                      D.CGR_DIRECTION,
       D.TOTAL_CGR,                     D.AVERAGE_CGR,
       D.ERLANG,                        D.ERLANG_IN,
       D.ERLANG_OUT,                    D.UTIL,
       D.CAPACITY,                      D.TIMECONG_PERCENTX100,
       D.CALL_CONG_X_100,               D.CALL_AMOUNT_IN,
       D.CALL_AMOUNT_OUT,               D.ACCEPTED_IN,
       D.ACCEPTED_OUT,                  D.ANSWERED_IN,
       D.ANSWERED_OUT,                  D.SUBS_FAIL_IN,
       D.SUBS_FAIL_OUT,                 D.INT_FAIL_IN,
       D.INT_FAIL_OUT,                  D.EXT_FAIL_IN,
       D.EXT_FAIL_OUT,                  D.TOTAL_CALLS_AMOUNT
       ) VALUES
       (
       S.FECHA,                         S.PERIOD_DURATION,
       S.MSC_REGION,
       S.CGR_TYPE,                      S.CGR_DIRECTION,
       S.TOTAL_CGR,                     S.AVERAGE_CGR,
       S.ERLANG,                        S.ERLANG_IN,
       S.ERLANG_OUT,                    S.UTIL,
       S.CAPACITY,                      S.TIMECONG_PERCENTX100,
       S.CALL_CONG_X_100,               S.CALL_AMOUNT_IN,
       S.CALL_AMOUNT_OUT,               S.ACCEPTED_IN,
       S.ACCEPTED_OUT,                  S.ANSWERED_IN,
       S.ANSWERED_OUT,                  S.SUBS_FAIL_IN,
       S.SUBS_FAIL_OUT,                 S.INT_FAIL_IN,
       S.INT_FAIL_OUT,                  S.EXT_FAIL_IN,
       S.EXT_FAIL_OUT,                  S.TOTAL_CALLS_AMOUNT
       );

COMMIT;

EXIT;
