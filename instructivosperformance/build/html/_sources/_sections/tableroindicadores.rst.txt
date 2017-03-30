Tablero AMX Indicadores
=======================


1.  OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Tablero AMX Indicadores y que envía el correo correspondiente.

2.  ALCANCE 
-----------

Áreas involucradas: Performance de Red, procesos de operaciones y mantenimiento.

3.  DEFINICIONES 
----------------

• Smart: Base de datos Oracle donde se encuentran las tablas de datos para la red de acceso, incluido GSM y GPRS
• Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart.  El nombre es perdido.claro.amx y la dirección ip física es 10.92.50.83

4.  DESCRIPCION GENERAL
-----------------------

Descripción: el tablero amx_indicadores contiene información mensual sobre Tráfico, Inaccesibilidad y Retenebilidad, de Voz y de Datos, de las tecnologías gsm y umts, agrupado por país. Todos los campos corresponden a la hora pico mensual, salvo 2 que son el máximo horario del mes (gsm inacc/no reten) y el acumulado mensual (data traffic).  Los campos son los siguientes:

 

Descripción de los campos para Tecnología 1 (GSM):
..................................................

+ ID_REGISTRO: Es la fecha yyyymmm y el último dígito identifica al país (Argentina=3, Uruguay=5, Paraguay=4)

+ ID_TECNOLOGIA: Tecnologia 1=GSM y 2=UMTS

+ VOICE_INACC: Inaccesibilidad de Voz (%).  ISABH MONTH.  100 - ACCESS_RATE

+ VOICE_NONRET: No Retenibilidad de Voz (%).  ISABH MONTH.  TCH_DROP8E_RATE

+ VOICE_SPEECHQUALITY: Calidad de Voz.  ISABH MONTH.  FER_UL_RATE

+ VOICE_TRAFFIC: Tráfico de Voz [Erlangs].  ISABH MONTH.  TCH_ERLANG

+ DATA_INACC: Inaccesibilidad de Datos (%).  MAX HOUR  del PDP_ACT_FAIL_2G

+ DATA_NONRET: No Retenibilidad de Datos (%).  MAX HOUR del PDP_CON_CUT_OFF_6B

+ DATA_THR1: Velocidad de Descarga ISABH MONTH.

+ DATA_THR2: Velocidad de Descarga ISABH MONTH. 

+ DATA_TRAFFIC: Tráfico de Datos de Subida y Bajada.  DAY MONTH.  (TRAFFIC_GPRS + TRAFFIC_EDGE) / 1024)


Descripción de los campos para Tecnología 2 (UMTS):
...................................................

+ ID_REGISTRO: Es la fecha yyyymmm y el último dígito identifica al país (Argentina=3, Uruguay=5, Paraguay=4)

+ ID_TECNOLOGIA: Tecnologia 1=GSM y 2=UMTS

+ VOICE_INACC: Inaccesibilidad de Voz (%).  ISABH MONTH.  100 - ACCESSIBILITY_VOICE VOICE_INACC

+ VOICE_NONRET: No Retenibilidad de Voz (%).  ISABH MONTH.  RAB_DROP_VOICE VOICE_NONRET

+ VOICE_SPEECHQUALITY: Calidad de Voz.  ISABH MONTH.  BLER_VOICE_UL VOICE_SPEECHQUALITY

+ VOICE_TRAFFIC: Tráfico de Voz [Erlangs].  ISABHMONTHC.  CS_ERL VOICE_TRAFFIC

+ DATA_INACC: Inaccesibilidad de Datos (%).  ISABH MONTH.  100 - ACCESSIBILITY_PACKET DATA_INACC

+ DATA_NONRET: No Retenibilidad de Datos (%).  ISABH MONTH   RAB_DROP_PACKET DATA_NON_RET

+ DATA_THR1: Velocidad de Descarga R99.  ISABH MONTH.  R99_DL_PS_THROUGHPUT_SDU_KBPS R99

+ DATA_THR2: Velocidad de Descarga HSDPA.  ISABH MONTH.  THROUGHPUT_HSDPA_MACD

+ DATA_TRAFFIC: Tráfico de Datos de Subida y Bajada.  DAY MONTH.  (HSDPA_DATA_DL_MBYTES + UMTS_PS_DATA_DL_MBYTES) /1024 DATA_TRAFFIC

 
.. image:: ../_static/images/tableroindicadores/pag3.png
  :align: center

.. image:: ../_static/images/tableroindicadores/pag3.2.png
  :align: center
 
Server: perdido.claro.amx (10.92.50.83).  

Base de Datos: Oracle 10G.  Instancia WILLY

Proceso que genera el tablero: el proceso tiene nombre "bd_amx.sh" y actualiza la tabla mensualmente y se lo puede encontrar en el crontab del equipo perdido, a continuación se lo transcribe:

# Procesos Spool

45 14 1 1,2,3,4,5,6,7,8,9,10,11,12 * /calidad/ps_spool/amx/bd_amx.sh > /dev/null 2>&1

O sea que su ejecución es el minuto 45 , de la hora 14, del día 1, de los 12 meses.

Frecuencia del proceso: MENSUAL

Duración del proceso: 

Ubicación del proceso: /calidad/psspool/amx/bd_amx.sh

.. image:: ../_static/images/tableroindicadores/pag4.png
  :align: center
 
5.  MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/tableroindicadores/pag4.2.png
  :align: center

6.  DESCRIPCION DETALLADA
-------------------------

El proceso Shell Script bd_amx_indicadores.sh se transcribe a continuación:
...........................................................................

#!/usr/bin/ksh

# Declaracion de Funciones

. /calidad/control/unix.sh

. /calidad/control/include.sh

. /calidad/control/variables.sh

. /calidad/control/f_spool.sh

# Variables de entorno Oracle

export ORACLE_HOME=$oracleHome

export ORACLE_SID=$oracleSid

export ORACLE_TERM=$oracleTerm

export PATH=$path

# Comentarios

# Creacion de los txt que se envian mensualmente a AMX

# Autor: Mario Heredia - 08.04.2009

# -- Actualizacion: Mario Heredia - 02.06.2009

# Actualizacion: Mario Heredia. Fecha: 10.03.2014. Motivo: Ya no es necesario el aux. Los Updates dejaron de tener validez a inicios del 2010.

# Declaracion de Variables

MES_ATRAS=`sqlplus -S / << EOF

SET HEADING OFF PAGES 0 FEEDBACK OFF VERIFY OFF ECHO OFF HEAD OFF;

SELECT DECODE('$1', NULL, 1, '$1') FECHA_DESDE FROM DUAL;

EXIT;

EOF`

primerDiaMes=`f_primer_dia_mes $MES_ATRAS`

fileIndicadores=amx_indicadores.txt

cd $WorkDirSpoolAmx/scripts

sqlplus -S / @ gsm_amx_indicadores.sql $primerDiaMes

sqlplus -S / @ umts_amx_indicadores.sql $primerDiaMes

# sqlplus -S / @ aux_umts_indicadores.sql $primerDiaMes

cd $WorkDirSpoolAmx

rm $fileIndicadores

sqlplus -S / @ amx_indicadores.sql $primerDiaMes $fileIndicadores

f_mail_attach "Informe AMX - Indicadores $primerDiaMes" UX $WorkDirSpoolAmx $fileIndicadores

Logueo del proceso: no hay logueo del proceso

El proceso SQL gsm_amx_indicadores.sql se transcribe a continuación:
....................................................................

.. _gsm_amx_indicadores: ../_static/images/tableroindicadores/gsm_amx_indicadores.sql

+ gsm_amx_indicadores_

El proceso SQL umts_amx_indicadores.sql se transcribe a continuación:

.. _umts_amx_indicadores: ../_static/images/tableroindicadores/umts_amx_indicadores.sql

+ umts_amx_indicadores_

La ejecución manual del script bd_amx.sh se transcribe a continuación:
......................................................................

/calidad># cd ps_spool

/calidad/ps_spool># cd amx

/calidad/ps_spool/amx># bd_amx.sh

old   2:  WHERE ID_REGISTRO LIKE TO_CHAR(TO_DATE('&1', 'DD.MM.YYYY'), 'YYYYMM')||'%'

new   2:  WHERE ID_REGISTRO LIKE TO_CHAR(TO_DATE('01.06.2016', 'DD.MM.YYYY'), 'YYYYMM')||'%'

3 rows deleted.


Commit complete.

old  37:  WHERE FECHA = TO_DATE('&1', 'DD.MM.YYYY')

new  37:  WHERE FECHA = TO_DATE('01.06.2016', 'DD.MM.YYYY')

old  47:  WHERE FECHA = TO_DATE('&1','DD.MM.YYYY')

new  47:  WHERE FECHA = TO_DATE('01.06.2016','DD.MM.YYYY')

old  56: SELECT TO_CHAR(TO_DATE('&1','DD.MM.YYYY'), 'YYYYMM')||

new  56: SELECT TO_CHAR(TO_DATE('01.06.2016','DD.MM.YYYY'), 'YYYYMM')||

old  83:  WHERE D.FECHA BETWEEN TO_DATE('&1','DD.MM.YYYY')

new  83:  WHERE D.FECHA BETWEEN TO_DATE('01.06.2016','DD.MM.YYYY')

old  84:                    AND ADD_MONTHS(TRUNC(TO_DATE('&1', 'DD.MM.YYYY'), 'MM'), 1) - 1

new  84:                    AND ADD_MONTHS(TRUNC(TO_DATE('01.06.2016', 'DD.MM.YYYY'), 'MM'), 1) - 1

3 rows created.


Commit complete.

old   2:  WHERE ID_REGISTRO LIKE TO_CHAR(TO_DATE('&1', 'DD.MM.YYYY'), 'YYYYMM')||'%'

new   2:  WHERE ID_REGISTRO LIKE TO_CHAR(TO_DATE('01.06.2016', 'DD.MM.YYYY'), 'YYYYMM')||'%'

4 rows deleted.


Commit complete.

old  35:  WHERE FECHA = TO_DATE('&1', 'DD.MM.YYYY')

new  35:  WHERE FECHA = TO_DATE('01.06.2016', 'DD.MM.YYYY')

old  47:  WHERE FECHA = TO_DATE('&1', 'DD.MM.YYYY')

new  47:  WHERE FECHA = TO_DATE('01.06.2016', 'DD.MM.YYYY')

old  56:  WHERE FECHA = TO_DATE('&1','DD.MM.YYYY')

new  56:  WHERE FECHA = TO_DATE('01.06.2016','DD.MM.YYYY')

old  63:  WHERE FECHA = TO_DATE('&1','DD.MM.YYYY')

new  63:  WHERE FECHA = TO_DATE('01.06.2016','DD.MM.YYYY')

4 rows created.


Commit complete.

id_Registro|id_Tecnologia|voice_Inacc|voice_NonRet|voice_SpeechQuality|voice_Traffic|data_Inacc|data_NonRet|data_Thr1|data_Thr2|data_Traffic

2016063|1|5.22|1.99|1.68|89130.83||||67.3|334872.41

2016064|1|.69|.25|.62|3046.68|||||30791.39

2016065|1|.91|.6|.53|2541.67|||||13035.42

2016063|2|1.199|.7609||163971.8939|.9785|1.1944|||7849705.313076171875

2016064|2|.5404|.4761||8496.9608|.7856|.9187|||891083.8277734375

2016065|2|.3106|.6223||5685.3008|.4835|.5224|||351959.47357421875

/calidad/ps_spool/amx>#



7.  REPROCESO
-------------

Este tablero no tiene reproceso, pero esta croneado para que corra durante 5 dias: 

00 9 1,2,3,4,5 * * /calidad/ps_spool/amx/bd_amx.sh > /dev/null 2>&1


8.  CONTROL DE CAMBIOS
--------------------

.. raw:: html 

   <style type="text/css">
    table {
       border:2px solid red;
       border-collapse:separate;
       }
    th, td {
       border:1px solid red;
       padding:10px;
       }
  </style>

  <table border="3">
  <tr>
    <th>Fecha</th>
    <th>Responsable</th>
    <th>Ticket Jira</th>
    <th>Detalle</th>
    <th>Repositorio</th>
  </tr>
  <tr>
    <td>  01/02/2017</td>
    <td>  Monica Pellegrini</td>
    <td> <p><a href="http://jira.harriague.com.ar/jira/browse/CL-723"> CL-723 </a></p></td>
    <td> Se agrego proceso de recuperación de datos. </td>
    <td> </td>
  </tr>
   </table>