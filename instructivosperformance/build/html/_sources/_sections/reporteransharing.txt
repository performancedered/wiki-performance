
Reporte Movistar Ran Sharing
============================

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Reporte Movistar Ran Sharing.

2.	ALCANCE 
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.
•	Cortado: Servidor LINUX en donde se importan los CSV desde el proveedor.
El nombre es cortado.claro.amx y la dirección IP física es 10.105.146.8
•	Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart.

4.	DESCRIPCIÓN GENERAL
-----------------------

Este reporte muestra las portadoras LTE de Movistar en Sitios Claro, informando Tráfico DL, Tráfico UL y cantidad de celdas.
Se identifican las celdas Movistar al filtrar las celdas de nuestra tabla objetos cuyo EARFCN para Downlink sea 2000 o 9260

5.	MACROFLUJO 
--------------

.. image:: ../_static/images/reporteransharing/pag3.png
  :align: center 

6.	DESCRIPCIÓN DETALLADA
-------------------------

6.1. Datos de origen y datos destino
************************************

•	Server Origen y Path: falda.claro.amx, /calidad/RanSharing/
•	Frecuencia actualización: Frecuencia semanal(Lunes a las 13 pm )
•	Tipo de Archivo de Salida: .xlsx

6.2. Shell Copiar Archivos Origen a Destino y limpieza de los mismos
********************************************************************

Los scripts son los siguientes:

.. _cleanupLogs: ../_static/images/reporteransharing/cleanupLogs.sh 
.. _deleteEmptyLogs: ../_static/images/reporteransharing/deleteEmptyLogs.sh 
.. _tableroRanSharing: ../_static/images/reporteransharing/tableroRanSharing.sh
.. _tableroRanSharingRun: ../_static/images/reporteransharing/tableroRanSharingRun.sh



+	tableroRanSharing_
+	cleanupLogs_
+	deleteEmptyLogs_
+	tableroRanSharingRun_

6.3. Listado de Tablas Utilizadas
*********************************

La tabla utilizada es: 

Los datos son extraídos de la BD Perdido:

•	LTE_NSN_SERVICE_LCEL_IBHW 
•	OBJECTS_SP_LTE            
•	OBJECTS_NSN_LNCEL_AUX 
•	LTE_NSN_PAQ_LCEL_IBHW    
•	LTE_NSN_AVAIL_LCEL_IBHW   

6.4. Pentaho
************

Estructura del proyecto:

.. image:: ../_static/images/reporteransharing/pag4.png
  :align: center

•	Proceso Pentaho End to End

.. image:: ../_static/images/reporteransharing/pag4.2.png
  :align: center

•	Proceso Crear Reporte

En este proceso se encarga de ejecutar las queries para generar el Excel de salida.
En el Excel se muestra  cada trabajo en una hoja diferente.
Por ejemplo: una hoja de  Resumen y otra hoja de Detalle

.. image:: ../_static/images/reporteransharing/pag5.png
  :align: center

•	Proceso Resumen y Detalle 
Este proceso se encarga de ejecutar la query en Tablero Resumen o Detalle, en el siguiente paso se da formato a la fecha (dd/MM/yyyy) y para finalizar se genera la solapa de datos en la hoja de Excel.
Este mismo proceso se realiza para Detalle.

.. image:: ../_static/images/reporteransharing/pag5.2.png
  :align: center


7.	CONTROLES
-------------

**No contiene controles** 

8. REPROCESO MANUAL
-------------------

**No tiene reproceso**

Se envía vía email un archivo Excel con el nombre: 05-Ran_Sharing_MovistarLTE_20170322_09

.. image:: ../_static/images/reporteransharing/pag5.3.png
  :align: center

.. image:: ../_static/images/reporteransharing/pag6.png
  :align: center