
-- Autor: Mario Heredia
-- Actualizacion: Mario Heredia - 23.12.2009
-- Actualizacion: Mario Heredia - 05.07.2011

DELETE FROM AMX_INDICADORES
 WHERE ID_REGISTRO LIKE TO_CHAR(TO_DATE('&1', 'DD.MM.YYYY'), 'YYYYMM')||'%'
   AND ID_TECNOLOGIA = 1;

COMMIT;

INSERT INTO AMX_INDICADORES
(
  PK_ID_CVECALIDAD,
  ID_REGISTRO,
  ID_TECNOLOGIA,
  VOICE_INACC,
  VOICE_NONRET,
  VOICE_SPEECHQUALITY,
  VOICE_TRAFFIC,
  DATA_INACC,
  DATA_NONRET,
  DATA_THR1,
  DATA_THR2,
  DATA_TRAFFIC
)
SELECT ROW_NUMBER () OVER(ORDER BY A.ID_REGISTRO ASC) PK_ID_CVECALIDAD,
       A.ID_REGISTRO,
       A.ID_TECNOLOGIA,
       VOICE_INACC,
       VOICE_NONRET,
       VOICE_SPEECHQUALITY,
       VOICE_TRAFFIC,
       DATA_INACC,
       DATA_NON_RET,
       DATA_THR1,
       DATA_THR2,
       DATA_TRAFFIC
  FROM (
SELECT TO_CHAR(FECHA, 'YYYYMM')||
       DECODE(PAIS, 'Argentina', 3, 'Uruguay', 5, 'Paraguay', 4) ID_REGISTRO,
       1                                                         ID_TECNOLOGIA,
       100 - ACCESS_RATE                                         VOICE_INACC,
       TCH_DROP8E_RATE                                           VOICE_NONRET,
       FER_UL_RATE                                               VOICE_SPEECHQUALITY,
       TCH_ERLANG                                                VOICE_TRAFFIC
  FROM TABLERO_REGION_MONTH
 WHERE FECHA = TO_DATE('&1', 'DD.MM.YYYY')
   AND REGION = 'PAIS'
   AND SUMMARY = 'ISABH_MONTH'
       ) A,
       (
SELECT TO_CHAR(FECHA, 'YYYYMM')||
       DECODE(MERCADO, 'Argentina', 3, 'Uruguay', 5, 'Paraguay', 4) ID_REGISTRO,
       1                                                            ID_TECNOLOGIA,
       ROUND((TRAFFIC_GPRS + TRAFFIC_EDGE) / 1024, 2)               DATA_TRAFFIC
  FROM TABLERO_MOUS_DAYM
 WHERE FECHA = TO_DATE('&1','DD.MM.YYYY')
   AND REGION = 'PAIS'
       ) C,
       (
SELECT ID_REGISTRO,
       ID_TECNOLOGIA,
       MAX(DATA_THR1) DATA_THR1,
       MAX(DATA_THR2) DATA_THR2
  FROM (
SELECT TO_CHAR(TO_DATE('&1','DD.MM.YYYY'), 'YYYYMM')||
       CASE WHEN SIGN(INSTR(PRM_DESCRIPTION, 'Argentina')) = 1 THEN '3'
            WHEN SIGN(INSTR(PRM_DESCRIPTION, 'Uruguay')) = 1 THEN '5'
            WHEN SIGN(INSTR(PRM_DESCRIPTION, 'Paraguay')) = 1 THEN '4' END ID_REGISTRO,
       1 ID_TECNOLOGIA,
       CASE WHEN SIGN(INSTR(PRM_DESCRIPTION, 'GPRS')) = 1 THEN PRM_VALUE END DATA_THR1,
       CASE WHEN SIGN(INSTR(PRM_DESCRIPTION, 'EDGE')) = 1 THEN PRM_VALUE END DATA_THR2
  FROM CALIDAD_PARAMETROS
 WHERE PRM_ID BETWEEN 136 AND 141
       )
 GROUP BY ID_REGISTRO,
          ID_TECNOLOGIA
       ) D,
       (
SELECT TO_CHAR(FECHA, 'YYYYMM')||
       DECODE(PAIS, 'Argentina', 3, 'Uruguay', 5, 'Paraguay', 4) ID_REGISTRO,
       PDP_ACT_FAIL_2G                                           DATA_INACC,
       PDP_CON_CUT_OFF_6B                                        DATA_NON_RET
 FROM  (
SELECT TRUNC(D.FECHA, 'MM') FECHA,
       DECODE(D.SGSN_GID, 699591001, 'Paraguay',
                          119081001, 'Uruguay', 'Argentina') PAIS,
       ROUND(SUM(D.PDP_ACT_FAIL_NUM) /
             SUM(D.PDP_ACT_FAIL_DEN) * 100, 2) PDP_ACT_FAIL_2G,
       ROUND(SUM(D.PDP_CON_CUT_OFF_6B_NUM) /
             SUM(D.PDP_CON_CUT_OFF_6B_DEN) * 100, 2) PDP_CON_CUT_OFF_6B
  FROM NOKIA_CORE_SGSN_CELL_HOUR D
 WHERE D.FECHA BETWEEN TO_DATE('&1','DD.MM.YYYY')
                   AND ADD_MONTHS(TRUNC(TO_DATE('&1', 'DD.MM.YYYY'), 'MM'), 1) - 1
   AND TO_CHAR(D.FECHA,'HH24') > 6
   AND TO_CHAR(D.FECHA,'HH24') <= 23
 GROUP BY TRUNC(D.FECHA, 'MM'), DECODE(D.SGSN_GID, 699591001, 'Paraguay',
                                                   119081001, 'Uruguay', 'Argentina')
      )
 ORDER BY PAIS
      ) E
 WHERE A.ID_REGISTRO = C.ID_REGISTRO (+)
   AND A.ID_REGISTRO = D.ID_REGISTRO (+)
   AND A.ID_REGISTRO = E.ID_REGISTRO (+);

COMMIT;

EXIT;

