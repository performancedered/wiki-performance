
Instructivo Control y Reproceso de tablas UMTS 
==============================================

1.	OBJETIVO
------------

El presente documento busca explicar y detallar el control y reproceso de datos para las plataformas 3G (UMTS), para mantener la consistencia de datos de manera diaria

2.	DEFINICIONES 
----------------

•	FD: Fecha desde, en formato DD.MM.YYYY
•	FH: Fecha hasta, en formato DD.MM.YYYY
•	HD: Hora desde, en formato HH24
•	HH: Hora hasta, en formato HH24
•	Smart: Base de datos Oracle donde se encuentran las tablas de datos para la red de acceso, incluido UMTS
•	Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. Dirección de acceso: perdido.claro.amx
•	RC: Regional Cluster, también mencionado como OSSRC. 

3.	INSTRUCCIONES OPERATIVAS
----------------------------

Para realizar este instructivo, se requiere acceso por SSH a Perdido, y el programa PL/SQL Developer con acceso a Smart.

.. image:: ../_static/images/instructivo-umts/pag2.png
  :align: center

Ingresar al programa PL/SQL Developer   -->Ingresar Username
										-->  Ingresa Password

.. image:: ../_static/images/instructivo-umts/pag3.png
  :align: center

.. image:: ../_static/images/instructivo-umts/pag3.2.png
  :align: center

3.1. CONTROLES
****************


Aquí se referenciarán las consultas presentes en los scripts: 

•	Control_1_UMTS.RAW.sql
•	Control_2_UMTS.HOUR.sql
•	Control_3_UMTS.DAY.sql
•	Control_4_UMTS.BH.sql

1.  Procedimiento Controles RAW:
.............................


Se controla las  tablas de counters raw de las diferentes plataformas, que se insertan los datos desde los puntos csv.all que se extraen desde los .xml. Estas tablas son las primeras tablas que traen los datos crudos desde el proceso parser. Los datos que aquí no se encuentren pueden ser por problemas de origen (es decir, desde el RC se generaron mal o no) o problemas en el proceso de parsing. Se muestra sólo la primera técnica de reproceso, pero para mayores problemas referenciarse al documento de Troubleshooting proceso parser.doc

Control 1 UMTS.sql 
~~~~~~~~~~~~~~~~~~~~~~

Se ejecuta la consulta Control 1 UMTS.sql.

.. _Control_1_UMTS_RAW.sql: ../_static/images/instructivo-umts/Control1-UMTS.sql

+	Control_1_UMTS_RAW.sql_


La misma recibe los siguientes parámetros:

	•	&1 : Fecha Desde, en formato DD.MM.YYYY (ej: 29.12.2015)
	•	&2 : Fecha Hasta, en formato DD.MM.YYYY (ej: 29.12.2015)

Ingresar:

	•	Fecha desde
	•	Fecha hasta

.. image:: ../_static/images/instructivo-umts/pag7.png
  :align: center

La busqueda a traves de las variables ingresadas muestra como resultado:

.. image:: ../_static/images/instructivo-umts/pag7.2.png
  :align: center



En caso de faltante de datos, verificar si se encuentran los XML, y si estos ya han sido procesados o no. Para ello, se debe ejecutar la siguiente consulta, en donde deberemos ajustar el FILENAME según el RC que nos interese, y la fecha/hora que nos importe:


.. image:: ../_static/images/instructivo-umts/pag8.png
  :align: center

.. image:: ../_static/images/instructivo-umts/pag8.2.png
  :align: center


Los valores en Status pueden ser tres posibles:

	•	0: Sin procesar, con lo cual está en cola de espera para ser procesado
	•	1: Procesado
	•	5: En procesamiento, con lo cual ese archivo está tratándose para insertar los datos a la BD.

REPROCESO
~~~~~~~~~~~~~

Nótese que hay 13 elementos, que corresponden a las 13 mediciones diferentes, para el RC seleccionado, en la hora seleccionada.

En caso de que necesitar reprocesar lo único que se debe hacer el dejar el archivo en estado PENDIENTE. Para ello ejecutar la siguiente sentencia, siempre ajustando el valor del RC y de la fecha/hora:


.. image:: ../_static/images/instructivo-umts/pag9.png
  :align: center

Luego presiona commit --> Yes 


.. image:: ../_static/images/instructivo-umts/pag9.2.png
  :align: center

2.  Procedimiento Controles Hour:
.............................

Control 2 UMTS.sql.
~~~~~~~~~~~~~~~~~~~~~~~~

 Aquí se revisan las tablas hour, pero del denominado “modelo nuevo de UMTS”, el cual consiste en un conjunto de tablas maestro/detalle, separadas por medición, y agrupadas en tablas de celda (WCELL) y demás elementos (NE). Este modelo carga sus datos mediante un sistema de colas de procesamiento. 
Las mediciones que se utilizan son:

•	Service
•	CellRes
•	HO (Handover)


La siguiente consulta se utiliza para Service pero en formato se aplica de la misma manera para HO. 

La consulta recibe los siguientes parámetros:
•	&1 : Fecha Desde, en formato DD.MM.YYYY (ej: 29.12.2015)
•	&2 : Fecha Hasta, en formato DD.MM.YYYY (ej: 29.12.2015)

.. _Control_2_UMTS_HOUR.sql: ../_static/images/instructivo-umts/Control2-UMTS.sql

+	Control_2_UMTS_HOUR.sql_

Debe Ingresar:

	•	Fecha Desde
	•	Fecha Hasta 

.. image:: ../_static/images/instructivo-umts/pag12.2.png
  :align: center

La Busqueda a traves de las variables ingresadas muestra como resultado:

.. image:: ../_static/images/instructivo-umts/pag13.png
  :align: center

REPROCESO
~~~~~~~~~~~~~~~~~~

Si tenemos diferencias o faltantes pero tenemos datos en dichas horas en las tablas raw, debemos ingresar manualmente “nuevos pedidos de procesamiento” en las colas. Para ello, tenemos un script que permite generar la llamada a esos pedidos. 
Existen 8 scripts que hay correr, dependiendo de la clase de tabla que falte:

SERVICE

	•	Para tablas detalle wcell: umtsDetailServiceWcellHour_EnqInRec.sql
	•	Para tablas master wcell: umtsMasterServiceWcellHour_EnqInRec.sql
	•	Para tablas detalle ne: umtsDetailServiceWbtsHour_EnqInRec.sql
	•	Para tablas master ne: umtsMasterServiceWbtsHour_EnqInRec.sql

HO: 

	•	Para tablas detalle wcell: umtsDetailHoWcellHour_EnqInRec.sql
	•	Para tablas master wcell: umtsMasterHoWcellHour_EnqInRec.sql
	•	Para tablas detalle ne: umtsDetailHoWbtsHour_EnqInRec.sql
	•	Para tablas master ne: umtsMasterHoWbtsHour_EnqInRec.sql

De ahí que, en dicho script, se comente/descomente la línea de DBMS_OUTPUT, para lograr la salida deseada, para la tabla que necesitamos.
En general, siempre procesar primero tablas detail wcell, luego master master wcell, y luego ídem con tablas NE.

.. image:: ../_static/images/instructivo-umts/pag14.png
  :align: center

Este script genera la siguiente salida:

.. image:: ../_static/images/instructivo-umts/pag14.2.png
  :align: center

Copiamos estos comandos, y los debemos ejecutar en Perdido, en la ruta /calidad/nokia/umts/aq/hourly/enqueue. 

.. image:: ../_static/images/instructivo-umts/pag15.png
  :align: center

Luego presiona --> Open

.. image:: ../_static/images/instructivo-umts/pag16.png
  :align: center

En dicha ruta existen a modo de ejemplo los siguientes scripts, los cuales pueden servir de referencia

.. image:: ../_static/images/instructivo-umts/pag16.2.png
  :align: center


Luego, se deben controlar el estado de dichas colas, para ello ejecutar las consultas:

SERVICE:

	•	ReportUmtsNsnHourlyServiceDetailNe.sql
	•	ReportUmtsNsnHourlyServiceDetailWcell.sql
	•	ReportUmtsNsnHourlyServiceMasterNe.sql
	•	ReportUmtsNsnHourlyServiceMasterWcell.sql

HO:

	•	ReportUmtsNsnHourlyHoDetailNe.sql
	•	ReportUmtsNsnHourlyHoDetailWcell.sql
	•	ReportUmtsNsnHourlyHoMasterNe.sql
	•	ReportUmtsNsnHourlyHoMasterWcell.sql

A modo ejemplo ejecutamos  la siguiente consulta: ReportUmtsNsnHourlyServiceDetailWcell.sql

.. image:: ../_static/images/instructivo-umts/pag17.png
  :align: center

.. image:: ../_static/images/instructivo-umts/pag18.png
  :align: center


3.	Procedimiento Controles Daily/Busy Hour – Controles Diarios:
................................................................

Control UMTS 3.DAY & Control UMTS 4.BH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Se controla las tablas del modelo viejo de UMTS a nivel daily y busy hour. Para ello corremos la consulta Control_3_UMTS.DAY.sql / Control_4_UMTS.BH.sql (El procedimiento es el mismo para los dos controles)
La misma recibe los siguientes parámetros:


.. _Control_3_UMTS_DAY.sql: ../_static/images/instructivo-umts/Control_UMTS_3.DAY.sql

+	Control_3_UMTS_DAY.sql_

.. _Control_4_UMTS_BH.sql: ../_static/images/instructivo-umts/Control_UMTS_4.BH.sql

+	Control_4_UMTS_BH.sql_ 

.. raw:: html 


•	&1 : Fecha Desde, en formato DD.MM.YYYY (ej: 29.12.2015)
•	&2 : Fecha Hasta, en formato DD.MM.YYYY (ej: 29.12.2015) 

.. image:: ../_static/images/instructivo-umts/pag18.2.png
  :align: center


.. image:: ../_static/images/instructivo-umts/pag19.png
  :align: center

Reprocesamos cuando hemos reprocesado a nivel hour y llevamos más de 3 días de retraso, ya que por default en Perdido hay una tarea sincronizada que corre todos los días la carga de datos de tablas day de las últimas 72 hs. 

REPROCESO
~~~~~~~~~~

Para reprocesar debemos ir a la carpeta /calidad/nokia/umts/daily/, y ejecutar los siguientes scripts:
	
	•	Tablas day:  recoveryNokiaUmtsDay.sh
	•	Tablas busy hour (BH): recoveryNokiaUmtsBusyHour.sh

Estos scripts reciben 3 parámetros:

	•	$1 : Fecha Desde, en formato DD.MM.YYYY
	•	$2 : Fecha Hasta, en formato DD.MM.YYYY
	•	$3: Medición, que puede ser: ho, service, hsdpa, macd, noc, cpucor o wbtsmon.

.. image:: ../_static/images/instructivo-umts/pag20.png
  :align: center

El script nos da como resultado: 

.. image:: ../_static/images/instructivo-umts/pag21.png
  :align: center


Si se han recuperado tablas a nivel day/bh, es necesario reprocesar los tableros diarios ejecutando los scripts ubicados en:
 
+ /calidad/tablero/minutos/tablero_minutos.sh
+ /calidad/tablero/geometria/daily/geometriaIndicadores. 
+ /calidad/tablero/radar/daily/umtsCldd_RadarIndicador.sh     
+ /calidad/tablero/nqi/daily/nqi_day_ins.sh  

Si se han recuperado tablas a nivel day/bh correspondientes a la semana anterior, es necesario reprocesar las tablas semanales y los tableros semanales.


Para reprocesar tablas semanales nos situamos en la carpeta /calidad/nokia/umts/summary/, donde ejecutamos el siguiente script: 

		+ nokia_umts_week.sh. 

El cual no recibe parámetros y calcula automáticamente la semana anterior a la fecha del dia.  Este script carga las tablas de isabh week y de day week.


Para reprocesar los tableros semanales ejecutar los siguientes scripts:
 
                     
+ /calidad/tablero/indicators/analisis_indicadores.sh                  
+ /calidad/tablero/dashboard/dashboard_week.sh                                      
+ /calidad/tablero/taskforce/tablero_taskfoce.sh                      
+ /calidad/tablero/iur/tablero_iur.sh                                  

 
Si se han recuperado tablas a nivel day/bh del mes anterior, es necesario reprocesar DAY_MONTH y todos los tableros mensuales.

4.	Procedimiento Controles DayW / ISABHW – Controles Semanal:
..................................................................

Control UMTS 5.DAYW & Control UMTS 6.ISABHW
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Se controla las tablas de UMTS a nivel DAYWEEK y ISABHW. Para ello corremos la consulta Control_5_UMTS.DAYW.sql / Control_4_UMTS.ISABHW.sql (El procedimiento es el mismo para los dos controles)
La misma recibe los siguientes parámetros:

.. _Control_5_UMTS_DAYW.sql: ../_static/images/instructivo-umts/Control_UMTS_5.DAYW.sql

+	Control_5_UMTS_DAYW.sql_

.. _Control_6_UMTS_ISABHW.sql: ../_static/images/instructivo-umts/Control_UMTS_6.ISABHW.sql

+	Control_6_UMTS_ISABHW.sql_ 

.. raw:: html 


•	&1 : Fecha Desde, en formato DD.MM.YYYY (ej: 29.12.2015)
•	&2 : Fecha Hasta, en formato DD.MM.YYYY (ej: 29.12.2015) 

.. image:: ../_static/images/instructivo-umts/pag25.png
  :align: center

.. image:: ../_static/images/instructivo-umts/pag26.png
  :align: center

Reprocesamos cuando hemos reprocesado a nivel hour y llevamos más de 3 días de retraso, ya que por default en Perdido hay una tarea sincronizada que corre todos los días la carga de datos de tablas day de las últimas 72 hs. 

REPROCESO
~~~~~~~~~

Para reprocesar debemos ir a la carpeta /calidad/nokia/umts/summary/, y ejecutar los siguientes scripts:
	
	•	Tablas WAYW & ISABHW:  recoveryNokiaUmtsDay.sh

Estos scripts reciben 1 parámetros:

	•	Numero que representa la semana anterior.

Para saber a que semana corresponde dicho numero se ejecuta las siguientes funciones(incorporadas en el bash):

	•	f_primer_dia_semana
	•	f_ultimo_dia_semana

.. image:: ../_static/images/instructivo-umts/pag27.png
  :align: center

Luego ejecutar el script recoveryNokiaUmtsDay.sh (numeroSemana)

.. image:: ../_static/images/instructivo-umts/pag28.png
  :align: center



4. REINCERSION DE TABLAS UMTS
--------------------------

Este proceso es semiautomático y se deben realizar los siguientes pasos para reinsertar datos: 

1° Para construir el set de datos primero se debe ejecutar la query:

.. _insertarTablaAuxRawUMTS: ../_static/images/queries/insertarTablaAuxRawUMTS.sql

insertarTablaAuxRawUMTS_
  
2° Ejecutar la query del constructor: 

.. _constructorCallConstructorProcedureReInsert_Umts: ../_static/images/queries/constructorCallConstructorProcedureReInsert_Umts.sql 

constructorCallConstructorProcedureReInsert_Umts_

Nos muestra como resultado: 

.. image:: ../_static/images/instructivo-umts/pag23.png
  :align: center

3° Se debe tomar el resultado que nos muestra en la pestaña “Output” para crear el bloque PL/SQL anónimo, ejecutar el bloque PL/SQL anónimo:

.. image:: ../_static/images/instructivo-umts/pag24.png
  :align: center

En el bloque PL/SQL define los siguientes parámetros: 

.. image:: ../_static/images/instructivo-umts/pag24.2.png
  :align: center

Al finalizar los pasos detallados anteriormente los datos son reinsertados con éxito. 