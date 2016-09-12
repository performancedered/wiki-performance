
Tablero Mous Day
====================

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Tablero MOUS DAY.

2.	ALCANCE 
-----------

Áreas involucradas: Performance de Red, procesos de operaciones y mantenimiento.

3.	DEFINICIONES 
----------------

•	FD: Fecha desde, en formato DD.MM.YYYY
•	FH: Fecha hasta, en formato DD.MM.YYYY
•	HD: Hora desde, en formato HH24
•	HH: Hora hasta, en formato HH24
•	RC: Regional Cluster, también abreviado como OSSRC
•	Smart: Base de datos Oracle donde se encuentran las tablas de datos para la red de acceso, incluido GSM y GPRS
•	Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart.  El nombre es perdido.claro.amx y la dirección ip física es 10.92.50.83

4.	DESCRIPCION GENERAL
-----------------------

TABLERO_MOUS_DAY
................

Descripción: el tablero_mous_day contiene información diaria sobre el tráfico de voz y datos, de las tecnologías gsm, umts y lte, agrupado por mercado y país. Para ver el tablero, una vez conectados a la base de datos Smart, con el PL/SQL ejecutar select * from tablero_mous_day.  Contiene los siguientes campos:

.. image:: ../_static/images/tableromousday/pag2.png
  :align: center
 
Descripción de los campos:

+	MOUS: MOUs = Minutes of Use.  Son los minutos de llamadas de voz
+	TRAFFIC_GPRS: Tráfico de Datos GSM de baja velocidad (gprs)
+	TRAFFIC_EDGE: Tráfico de Datos GSM de alta velocidad (edge)
+	SHORT_MESSAGE_MO: Cantidad de SMS mobile originated.  Mensaje corto originado desde un teléfono móvil
+	SHORT_MESSAGE_MT: Cantidad SMS mobile terminated.  Mensaje corto terminado en un teléfono móvil.
+	CURRENT_SUBSCRIBERS_IN_VLR: Cantidad de suscriptores registrados en la VLR (Virtual Location Register)
+	UMTS_MOUS_VOZ: Cantidad de minutos de las llamadas de voz UMTS (3G)
+	UMTS_MOUS_VIDEOCALL: Cantidad de minutos de las llamadas de video llamada UMTS(3G)
+	HSUPA_DATA_MBYTES: Tráfico de Datos de Subida UMTS del protocolo HSPA.  La "U" es de Uplink.
+	HSDPA_DATA_DL_MBYTES: Tráfico de Datos de Bajada UMTS del protocolo HSPA.  La "D" es de Downlink.
+	UMTS_PS_DATA_DL_MBYTES: Trafico de Paquetes de Subida UMTS.  Paquetes se denomina al protocolo R99.
+	UMTS_PS_DATA_UL_MBYTES: Trafico de Paquetes de Bajada UMTS.  Paquetes se denomina al protocolo R99.
+	TOT_SUBS_LAC_GSM: Cantidad de Suscriptores (en los LAC-Local Area Code) de la red GSM
+	TOT_SUBS_LAC_UMTS: Cantidad de Suscriptores (en los LAC-Local Area Code) de la red UMTS
+	TRAFFIC_DL_GPRS: Tráfico de Datos de Subida GSM de baja velocidad (gprs).  DL=Down Link
+	TRAFFIC_UL_GPRS: Tráfico de Datos de Bajada GSM de baja velocidad (gprs).  UL=Up Link
+	TRAFFIC_DL_EDGE: Tráfico de Datos de Bajada GSM de alta velocidad (edge).  DL=Down Link
+	TRAFFIC_UL_EDGE: Tráfico de Datos de Subida GSM de alta velocidad (edge).  UL=Up Link
+	LTE_DATA_DL_MBYTES: Tráfico de Datos de Bajada LTE (4G).  DL=Down Link
+	LTE_DATA_UL_MBYTES: Tráfico de Datos de Subida LTE (4G).  UL=Up Link
+	TOT_SUBS_LAC_LTE: Cantidad de Suscriptores de la red LTE, registrados en MME-Mobile Management Entity

Server: perdido.claro.amx (10.92.50.83).  

Base de Datos: Oracle 10G.  Instancia WILLY

Proceso que genera el tablero: el proceso tiene nombre "tablero_minutos.sh" y actualiza la tabla diariamente y se lo puede encontrar en el crontab del equipo perdido, a continuación se lo transcribe:

15 09 * * *        /calidad/tablero/minutos/tablero_minutos.sh                > /dev/null 2>&1

La ejecución entonces se realiza el minuto 15, de la hora 09, todos los días del año, todos los meses del año, todos los días de la semana (15 09 * * *)
Frecuencia del proceso: DIARIA

Duración del proceso: 2 minutos

Ubicación del proceso: /calidad/tablero/minutos/tablero_minutos.sh.  

Para poder ver el proceso se sugiere conectarse vía ftp al server perdido, con el usuario "calidad", y realizar una copia del archivo.

Logueo del proceso: el logueo del proceso se realiza en el archivo tablero_minutos.log (ubicado en el path calidad/tablero/minutos/) el cual se transcribe a continuación:

5.	MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/tableromousday/pag3.png
 	:align: center

6.	DESCRIPCION DETALLADA
-------------------------

El Shell Script tablero_minutos.sh se lo transcribe a continuación: 

#!/usr/bin/ksh

# Declaracion de Funciones
. /calidad/control/include.sh
. /calidad/control/variables.sh
. /calidad/control/f_tablero.sh

# Variables de entorno Oracle
export ORACLE_HOME=$oracleHome
export ORACLE_SID=$oracleSid
export ORACLE_TERM=$oracleTerm
export PATH=$path

# Comentarios
# Script Recoleccion y Carga de datos para tablero MOUS Integral
# Autor: Mario Heredia - 13 Jul 2007
# Actualizacion. Autor: Mario Heredia - 17.10.2008
# Actualizacion. Autor: Mario Heredia - 26.01.2011

# Declaracion de Variables
FECHA_DESDE=`f_fecha $diasDesdeTableroMousDay`
FECHA_HASTA=`f_fecha $diasHastaTableroMousDay`
LOG=tablero_minutos.log

cd ${wdirTableroMinutos}

:> $LOG

f_Tablero_Minutos_Day $FECHA_DESDE $FECHA_HASTA $LOG

La función denominada  f_Tablero_Minutos_Day se transcribe a continuación:

f_Tablero_Minutos_Day () {

  # Autor: Mario Heredia.
  # Actualizacion: Mario Heredia. Fecha: 04.12.2014.

  FECHA_DESDE="$1"
  FECHA_HASTA="$2"
  LOG=$3

  f_log 'Start Tablero Minutos Day' $LOG

  f_log 'Tablero Minutos Day' $LOG

  sqlplus -S / @${wdirTableroMinutos}tablero_mous_day.sql $FECHA_DESDE $FECHA_HASTA

  f_log 'Finish Tablero Minutos Day' $LOG

  f_log 'Start Reclamos Sitios Day' $LOG

  f_Claro_Reclamos_Sitios $FECHA_DESDE $FECHA_HASTA $LOG

  f_log 'Finish Reclamos Sitios Day' $LOG
}


El logueo del proceso se realiza en el archivo tablero_minutos.log (ubicado en el path calidad/tablero/minutos/) el cual se transcribe a continuación:


Start Tablero Minutos Day 08/07/2016 09:15:01

Tablero Minutos Day 08/07/2016 09:15:01

Finish Tablero Minutos Day 08/07/2016 09:16:10

Start Reclamos Sitios Day 08/07/2016 09:16:10

Start Reclamos por Sitio - Sumarizacion Diaria 08/07/2016 09:16:10

Reclamos por Sitio - Sumarizacion Diaria 08/07/2016 09:16:10

Reclamos por Pais - Sumarizacion Diaria - PROD  08/07/2016 09:16:32

Reclamos por Pais - Sumarizacion Diaria - UYPROD  08/07/2016 09:17:01

Reclamos por Pais - Sumarizacion Diaria - PYPROD  08/07/2016 09:17:02

Reclamos por Pais - Sumarizacion Diaria - PROD  08/07/2016 09:17:02

Reclamos por Pais - Sumarizacion Diaria - UYPROD  08/07/2016 09:17:03

Reclamos por Pais - Sumarizacion Diaria - PYPROD  08/07/2016 09:17:04

Reclamos por Pais - Sumarizacion Diaria - PROD  08/07/2016 09:17:05

Reclamos por Pais - Sumarizacion Diaria - UYPROD  08/07/2016 09:17:06

Reclamos por Pais - Sumarizacion Diaria - PYPROD  08/07/2016 09:17:07

Finish Reclamos por Sitio - Sumarizacion Diaria 08/07/2016 09:17:08

Finish Reclamos Sitios Day 08/07/2016 09:17:08


El proceso denominado tablero_mous_day.sql se obtiene a continuación:
.....................................................................

.. _Tablero_mous_day : ../_static/images/tableromousday/tablero_mous_day.sql

Tablero_mous_day_


Los procedimientos P_TABLERO_MOUS_DAY_INS y P_TABLERO_MOUS_DAY_NE_INS se transcriben a continuación:

.. _P_TABLERO_MOUS_DAY_INS: ../_static/images/tableromousday/P_TABLERO_MOUS_DAY_INS.sql

P_TABLERO_MOUS_DAY_INS_

.. _P_TABLERO_MOUS_DAY_NE_INS: ../_static/images/tableromousday/P_TABLERO_MOUS_DAY_NE_INS.sql

P_TABLERO_MOUS_DAY_NE_INS_