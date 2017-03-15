WAP ZTE
=======


1.	OBJETIVO
------------
El presente documento buscar explicar y detallar el proceso que genera el WAP ZTE.

2.	ALCANCE 
-----------
Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------
•	Cortado: Servidor LINUX en donde se importan los CSV desde el proveedor.
El nombre es cortado.claro.amx y la dirección IP física es 10.105.146.8

4.	DESCRIPCION GENERAL 
-----------------------
La plataforma WAP ZTE es un internet Gateway que permite a los teléfonos que no son smart phones la posibilidad de navegar en internet. No sólo funciona como proxy, sino también como adaptador de contenido, y en casos donde se visita una página web que tiene imágenes en alta definición, le baja la resolución para que el viejo teléfono lo pueda mostrar".


Campos de la tabla WAP_GATEWAY_KPI_ZTE_AUX: 

.. image:: ../_static/images/wapZte/pag4.png
  :align: center 

Campos de la tabla WAP_GATEWAY_KPI_ZTE_RAW: 

.. image:: ../_static/images/wapZte/pag4.2.png
  :align: center 

Campos de la tabla WAP_GATEWAY_SERVICE_ZTE_AUX:

.. image:: ../_static/images/wapZte/pag5.png
  :align: center 


Campos de la tabla WAP_GATEWAY_SERVICE_ZTE_BH:

.. image:: ../_static/images/wapZte/pag5.2.png
  :align: center 

Campos de la tabla WAP_GATEWAY_SERVICE_ZTE_DAY:

.. image:: ../_static/images/wapZte/pag6.png
  :align: center 

Campos de la tabla WAP_GATEWAY_SERVICE_ZTE_IBHW: 

.. image:: ../_static/images/wapZte/pag6.2.png
  :align: center 

Campos de la tabla  WAP_GATEWAY_SERVICE_ZTE_RAW: 

.. image:: ../_static/images/wapZte/pag7.png
  :align: center 

5.	MACRO FLUJO DEL PROCESO 
---------------------------

.. image:: ../_static/images/wapZte/pag7.2.png
  :align: center 


6.	DESCRIPCION DETALLADA
------------------------- 

6.1.	Datos Origen
....................

•	Server Origen y Path: 10.105.146.8 - /home/ztearchive/wapgw

•	Cantidad de archivos origen: 2 archivos

				*	1.03 Daily WAP Gateway Kpi Report
				*	1.04 Daily Service Gateway Real-Time Report

•	Frecuencia actualización: Frecuencia diaria

•	Tipo de Archivo: csv

6.2.	Datos Destino
.....................

•	Server Destino: Cortado

•	Conversión de Archivos: No 

•	Tabla Files: Si 

•	Tabla Auxiliar: Si

•	Frecuencia de corrida del proceso: 1 vez al día

•	Regionales: No

•	RAW Si/No: Si

•	Hour Si/No: Si

•	Day Si/No: Si

•	BH Si/No: Si

•	Países: No

•	Directorio Destino (File System): /home/calidad/WapZte/wapgw

6.3.	Shell Copiar Archivos Origen a Destino y limpieza de los mismos
.......................................................................

Los Scripts tienen las siguientes funciones: 

1-	Copiar los archivos

2-	Limpieza 

3-	Ejecutar Pentaho

El Script wapZteDiario.sh es la raíz de proceso 

Los scripts son los siguientes:

.. _wapZteDiario: ../_static/images/wapZte/wapZteDiario.sh 

.. _cleanUpFiles:  ../_static/images/wapZte/cleanUpFiles.sh

.. _scpWapZte: ../_static/images/wapZte/scpWapZte.sh 

.. _scpWapZteDate: ../_static/images/wapZte/scpWapZteDate.sh 

.. _wapzte: ../_static/images/wapZte/wapzte.sh 

*	wapZteDiario_ 

*	cleanUpFiles_

*	scpWapZte_

*	scpWapZteDate_

*	wapzte_


6.4.	Listado de Tablas Utilizadas
....................................

Campos de la tabla FILE:

.. image:: ../_static/images/wapZte/pag3.png
  :align: center 

Las tablas utilizadas son las siguientes: 

.. image:: ../_static/images/wapZte/pag9.png
  :align: center 



6.5.	Pentaho
...............

Estructura del proyecto: 

.. image:: ../_static/images/wapZte/pag9.2.png
  :align: center 

•	Proceso Pentaho End to End 

.. image:: ../_static/images/wapZte/pag9.3.png
  :align: center 

Tenemos el Shell  wapZteDiario.sh que trae datos para el servidor Cortado. Luego setea variables de entorno, directorios donde se encuentran los datos para procesar los archivos disponibles. 

En la Carpeta File se encuentran todos los archivos a procesar.

Los archivos a procesar dependen del status en que se encuentran: 

*	0: Se procesó correctamente

*	1: Se procesó pero tuvo error

*	5: Para procesar


•	Pentaho Inserción tabla Files 

Get WAPZTE File Names: se encarga de buscar los archivos del sistema operativo  y los envía  a Populate FILES table  para escribirlos en la tabla File.
Escribe los siguientes datos:
	
	*	 Nombre del archivo		
	*	 Status

.. image:: ../_static/images/wapZte/pag10.png
  :align: center 


•	Pentaho Inserción tabla auxiliar / raw / hour (No contiene hour)

.. image:: ../_static/images/wapZte/pag10.2.png
  :align: center 


Tabla auxiliar de la tabla WAP_GATEWAY_KPI_ZTE

Tabla auxiliar de la tabla WAP_GATEWAY_SERVICE_ZTE_AUX

.. image:: ../_static/images/wapZte/pag11.png
  :align: center 

•	Pentaho Calculo Sumarizaciones

Las sumarizaciones se calculan a día vencido (el día anterior al actual), para dicho cálculo se debe llamar al procedimiento Call P_CALCULAR_SUMARIZACIONES_ZTE DB Procedures.

.. image:: ../_static/images/wapZte/pag11.2.png
  :align: center 

6.6.	Controles 
.................

.. image:: ../_static/images/wapZte/pag11.3.png
  :align: center 

7.	REPROCESO MANUAL
--------------------

7.1 Administracion de particiones
.................................

.. _G_PARTITION_MGMT: ../_static/images/archivo/G_PARTITION_MGMT.sql 


Antes de realizar el reproceso manual se debe realizar la administración de particiones, la cual se encarga de borrar los datos que serán reprocesados e insertados nuevamente a la tabla.

Para realizar este proceso se debe ejecutar la siguiente querie: 

+ G_PARTITION_MGMT_

Parámetros: 

• Nombre de la tabla
• Fecha desde (DD.MM.YYYY)
• Fecha hasta (DD.MM.YYYY)

Para todos los niveles se utilizan los mismos parámetros de ejecución. 

Por ejemplo: 

• G_PARTITION_MGMT.P_DROP_PARTITION_WEEK('CISCO_GGSN_EPDG_ISABHW','01.01.2017','07.01.2017');


7.2 Procedimiento de reproceso manual paso a paso: 
..................................................

Se debe ejecutar el script ScpWapZteDate.sh, el cual debe recibir por parámetro la Fecha solicitada, para realizar la limpieza, para luego ejecutar el ImportRework.kjb en Pentaho de manera manual.

Ubicación de los scripts en la carpeta /home/calidad/WapZte/Scripts

Ubicación del Rework de ejecución en Pentaho: /home/calidad/WapZte/Rework

El Formato de la fecha es el siguiente:

•	 YYYYMMDD

Por consola se utiliza de la siguiente manera: 

•	./Pentaho61/data-integration/kitchen.sh  -file=/home/calidad/WapZte/Rework.kjb –param:FECHA_PROC= YYYYMMDD

.. image:: ../_static/images/wapZte/pag12.png
  :align: center


8.	SMART
---------

Los reportes en la herramienta Smart se muestran de la siguiente manera:

.. image:: ../_static/images/wapZte/pag13.png
  :align: center


.. image:: ../_static/images/wapZte/pag14.png
  :align: center

.. image:: ../_static/images/wapZte/pag14.2.png
  :align: center

.. image:: ../_static/images/wapZte/pag15.png
  :align: center

.. image:: ../_static/images/wapZte/pag15.2.png
  :align: center

9. CONTROL DE CAMBIOS
---------------------


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
    <td> </td>
    <td>  </td>
    <td> <p><a href=""> </a></p> </td>
    <td>  </td>
    <td> </td>
  </tr>
  </table>