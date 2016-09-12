
-- Autor: Mario Heredia
-- Actalizacion: Mario Heredia - 29.07.2010
-- Actalizacion: Mario Heredia - 16.06.2011
-- Actalizacion: Mario Heredia - 05.07.2013. Motivo: Se deja en 0 el campo de CE.
-- Actualizacion: Monica Pellegrini Fecha: 04.01.2016. Motivo: se cambia atm_load por load_amx
-- Actualizacion: Mario Heredia. Fecha: 28.01.2016. Motivo: Implementacion de multivendorObject2.

SET HEADING OFF PAGES 0 FEEDBACK OFF VERIFY OFF ECHO OFF HEAD OFF LINESIZE 140;
SPOOL ./&2

SELECT 'fecha, wcell_id, accesibilidad_hsdpa, ce_available, load_amx, disponibilidad, confiabilidad, throughput_hsdpa_macd' CAMPO FROM DUAL UNION ALL
SELECT FECHA||', '||
       WCELL_NAME||', '||
       ACCESIBILIDAD_HSDPA||', '||
       CE_AVG_AVAILABLE||', '||
       LOAD_AMX||', '||
       DISPONIBILIDAD||', '||
       CONFIABILIDAD||', '||
       THROUGHPUT_HSDPA_MACD SE
  FROM (
SELECT A.FECHA,
       A.WCELL_NAME,
       A.ACCESIBILIDAD_HSDPA,
       A.CE_AVG_AVAILABLE,
       A.LOAD_AMX,
       A.DISPONIBILIDAD,
       A.CONFIABILIDAD,
       A.THROUGHPUT_HSDPA_MACD,
       NVL(B.ESTADO, 'Comercial') ESTADO
  FROM (
SELECT TO_CHAR(FECHA, 'DD.MM.YYYY') FECHA,
       WCELL_NAME,
       ACCESIBILIDAD_HSDPA,
       CE_AVG_AVAILABLE,
       LOAD_AMX,
       DISPONIBILIDAD,
       CONFIABILIDAD,
       NVL(THROUGHPUT_HSDPA_MACD, 0) THROUGHPUT_HSDPA_MACD
  FROM NOC_UMTS_KPI_WCEL_BH
 WHERE FECHA = TO_DATE('&1','DD.MM.YYYY') --9462
       ) A,
       (
SELECT WCELL_ID,
       WCELL_NAME,
       WBTS_ID,
       WBTS_NAME,
       RNC_ID,
       RNC_NAME,
       ALM,
       MERCADO,
       PAIS,
       MR_ID,
       D.MR_NAME,
       FECHA_DESDE_MR,
       FECHA_HASTA_MR,
       DECODE(D.MR_NAME, NC.MR_NAME, 'No Comercial', 'Comercial') ESTADO,
       COUNT(*) OVER(PARTITION BY WCELL_NAME) CANTIDAD
  FROM (
SELECT WCELL_ID,
       WCELL_NAME,
       WBTS_ID,
       WBTS_NAME,
       RNC_ID,
       RNC_NAME,
       ALM,
       MERCADO,
       PAIS,
       MR_ID,
       MR_NAME,
       FECHA_DESDE_MR,
       FECHA_HASTA_MR,
       ROW_NUMBER() OVER(PARTITION BY WCELL_NAME ORDER BY FECHA_DESDE_MR DESC) ORDEN
  FROM (
SELECT B.WCELL_ID,
       B.WCELL_NAME,
       B.WBTS_ID,
       B.WBTS_NAME,
       B.RNC_ID,
       B.RNC_NAME,
       B.ALM,
       B.MERCADO,
       B.PAIS,
       MR_ID,
       C.ELEMENT_NAME MR_NAME,
       FECHA_INICIO FECHA_DESDE_MR,
       FECHA_FIN FECHA_HASTA_MR
  FROM NOC_UMTS_MR_OBJECTS A,
       OBJECTS_SP_UMTS     B,
       MULTIVENDOR_OBJECT2 PARTITION (MR) C
 WHERE B.WCELL_ID = A.WCELL_ID (+)
   AND A.MR_ID = C.ELEMENT_ID (+) 
   AND (TRUNC(SYSDATE) BETWEEN FECHA_INICIO
                           AND FECHA_FIN
    OR FECHA_INICIO >= TRUNC(SYSDATE))
   AND REAL_FECHA_INICIO >= TO_DATE('01.01.2016', 'DD.MM.YYYY')
       )
 WHERE (TRUNC(SYSDATE) BETWEEN FECHA_DESDE_MR
                           AND FECHA_HASTA_MR
    OR FECHA_HASTA_MR <= TRUNC(SYSDATE))
       ) D, NOC_MR_NO_COMERCIALES NC
 WHERE ORDEN = 1
   AND D.MR_NAME = NC.MR_NAME (+)
       ) B
 WHERE A.WCELL_NAME = B.WCELL_NAME (+)
       )
 WHERE ESTADO <> 'No Comercial';

SPOOL OFF;

EXIT;

