– Autor: Mario Heredia

– Actualizacion: Mario Heredia - Aug 27 2009

– Actualizacion: Mario Heredia - 21.09.2010

– Actualizacion: Mario Heredia - 27.01.2011

– Actualizacion: Mario Heredia. Fecha: 04.12.2014. Motivo: Implementacion de funciones.

VARIABLE FECHA_DESDE VARCHAR2(15); VARIABLE FECHA_HASTA VARCHAR2(15);

EXEC :FECHA_DESDE := ‘&1’; EXEC :FECHA_HASTA := ‘&2’;

SELECT ‘INI: ‘||:FECHA_DESDE||’ ‘||:FECHA_HASTA||’ ‘||TO_CHAR(SYSDATE, ‘DD.MM.YYYY HH24:MI:SS’) INI FROM DUAL;

BEGIN

P_TABLERO_MOUS_DAY_INS (:FECHA_DESDE, :FECHA_HASTA); P_TABLERO_MOUS_DAY_NE_INS (:FECHA_DESDE, :FECHA_HASTA);

END; /

SELECT ‘FIN: ‘||:FECHA_DESDE||’ ‘||:FECHA_HASTA||’ ‘||TO_CHAR(SYSDATE, ‘DD.MM.YYYY HH24:MI:SS’) FIN FROM DUAL;

EXIT;