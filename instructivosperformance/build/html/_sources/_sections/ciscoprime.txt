
CISCO PRIME
===========

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera Cisco Prime.

2.	ALCANCE 
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Cortado: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es cortado.claro.amx y la dirección ip física es 10.105.146.8.

4.	DESCRIPCION GENERAL 
-----------------------

La plataforma Cisco Prime Performance es el sistema de gestión propietario del proveedor Cisco para todos sus routers y switches.  En Claro se utiliza para monitorear los KPIs del Backbone IP. La integración a Smart de esta plataforma consiste en recolectar los archivos CSV y XML de Cisco Prime Performance, y mostrarles en Smart.  Los KPIs son básicamente: Utilización de CPU y Memoria de los equipos, y  la Utilización de Interfaces.  La información puede visualizarse en Smart hora x hora, por hora pico del día, por hora pico de la semana, por hora pico del mes, por día, por semana, por mes.


.. _Cisco_Prime_Integracion: ../_static/images/documentos/CiscoPrimeIntegracion.xlsx

 
Documento de Requerimiento: Cisco_Prime_Integracion_

5.	MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/ciscoprime/pag3.png
  :align: center 


6.	DESCRIPCIÓN DETALLADA
--------------------------

6.1.	Datos Origen
********************

•	Server Origen y Path: 10.92.50.223 , /opt/CSCOppm-gw/reports/exporthourly/

•	Cantidad de archivos origen: 3 archivos

		+	INTERFACE.YYYY-MM-DD-HH.CSV

		+	INTERFACE_ERRORS.YYYY-MM-DD-HH.CSV

		+	INTERFACE_AVAIL.YYYY-MM-DD-HH.CSV

		+	CPU_DEVICE_AVG.YYYY-MM-DD-HH.CSV

		+	MEMORY_DEVICE_AVERAGE.YYYY-MM-DD-HH.CSV

•	Frecuencia actualización: Frecuencia diaria

•	Tipo de Archivo: CSV

6.2.	Datos Destino
*********************

•	Server Destino: Cortado
•	Conversión de Archivos: No 
•	Tabla Files: Si 
•	Tabla Auxiliar: No
•	Frecuencia de corrida del proceso: 1 vez al día
•	Regionales: No
•	RAW Si/No: No
•	Hour Si/No: Si
•	Day Si/No: Si
•	BH Si/No: Si
•	IBHW Si/No: Si 
•	Países: No 
•	Directorio Destino (File System): /calidad/CiscoPrime

6.3.	Shell Copiar Archivos Origen a Destino y limpieza de los mismos
***********************************************************************

Los Scripts tienen las siguientes funciones: 

1-	Copiar los archivos

2-	Ejecutar Pentaho

+	El Script ciscoPrimeDiario_ es la raíz de proceso 

.. _arma_log_csv: ../_static/images/ciscoprime/arma_log_csv.sh

.. _ciscoPrime: ../_static/images/ciscoprime/ciscoPrime.sh

.. _ciscoPrimeDiario: ../_static/images/ciscoprime/ciscoPrimeDiario.sh

.. _ciscoPrimeRework: ../_static/images/ciscoprime/ciscoPrimeRework.sh

.. _ciscoRework: ../_static/images/ciscoprime/ciscoRework.sh

.. _countLines: ../_static/images/ciscoprime/countLines.sh

.. _deleteEmptyLogs: ../_static/images/ciscoprime/deleteEmptyLogs.sh

.. _localCgnStatsCount: ../_static/images/ciscoprime/localCgnStatsCount.sh

.. _localCpuCount: ../_static/images/ciscoprime/localCpuCount.sh

.. _localCpuDeviceAvgCount: ../_static/images/ciscoprime/localCpuDeviceAvgCount.sh

.. _localInterfaceAvailCount: ../_static/images/ciscoprime/localInterfaceAvailCount.sh

.. _localInterfaceErrorsCount: ../_static/images/ciscoprime/localInterfaceErrorsCount.sh

.. _localMemoryCount: ../_static/images/ciscoprime/localMemoryCount.sh

.. _localMemoryDeviceAverageCount: ../_static/images/ciscoprime/localMemoryDeviceAverageCount.sh

.. _makeKVP: ../_static/images/ciscoprime/makeKVP.sh

+	arma_log_csv_

+	ciscoPrime_

+	ciscoPrimeDiario_

+	ciscoPrimeRework_ 

+	ciscoRework_

+	countLines_

+	deleteEmptyLogs_ 

+	localCgnStatsCount_

+	localCpuCount_

+	localInterfaceAvailCount_

+	localInterfaceErrorsCount_

+	localMemoryCount_

+	makeKVP_ 

6.4.	Listado de Tablas Utilizadas
************************************

Las tablas utilizadas son las siguientes:  

.. image:: ../_static/images/ciscoprime/pag6.png
  :align: center 

Los campos de las tablas utilizadas son las siguientes: 

•	Tabla Files

.. image:: ../_static/images/ciscoprime/pag6.2.png
  :align: center 

•	Tabla CSCO_CGN_STATS_BH

.. image:: ../_static/images/ciscoprime/pag7.png
  :align: center 

•	Tabla CSCO_CGN_STATS_DAY

.. image:: ../_static/images/ciscoprime/pag7.2.png
  :align: center 

•	Tabla CSCO_CGN_STATS_HOUR

.. image:: ../_static/images/ciscoprime/pag8.png
  :align: center 

•	Tabla CSCO_CGN_STATS_IBHW

.. image:: ../_static/images/ciscoprime/pag8.2.png
  :align: center 

•	Tabla CSCO_CPU_DEVICE_AVG_HOUR

.. image:: ../_static/images/ciscoprime/pag8.3.png
  :align: center 

•	Tabla  CSCO_MEM_DEVICE_AVG_BH

.. image:: ../_static/images/ciscoprime/pag9.png
  :align: center 

•	Tabla  CSCO_MEM_DEVICE_AVG_DAY

.. image:: ../_static/images/ciscoprime/pag9.2.png
  :align: center 

•	Tabla  CSCO_MEM_DEVICE_AVG_HOUR

.. image:: ../_static/images/ciscoprime/pag10.png
  :align: center

•	Tabla  CSCO_MEM_DEVICE_AVG_IBHW

.. image:: ../_static/images/ciscoprime/pag10.png
  :align: center

•	Tabla CSCO_INTERFACE_AVAIL_HOUR

.. image:: ../_static/images/ciscoprime/pag10.2.png
  :align: center

•	Tabla CSCO INTERFACE_BH

.. image:: ../_static/images/ciscoprime/pag11.png
  :align: center

•	Tabla CSCO INTERFACE_DAY

.. image:: ../_static/images/ciscoprime/pag12.png
  :align: center

•	Tabla CSCO INTERFACE_ERRORS_HOUR

.. image:: ../_static/images/ciscoprime/pag13.png
  :align: center

•	Tabla CSCO INTERFACE_HOUR

.. image:: ../_static/images/ciscoprime/pag14.png
  :align: center

•	Tabla CSCO INTERFACE_HOUR_OLD2

.. image:: ../_static/images/ciscoprime/pag15.png
  :align: center

•	Tabla CSCO INTERFACE_IBHW

.. image:: ../_static/images/ciscoprime/pag16.png
  :align: center

•	Tabla CSCO_LINKS

.. image:: ../_static/images/ciscoprime/pag17.png
  :align: center

•	Tabla CSCO_MEMORY_BH

.. image:: ../_static/images/ciscoprime/pag17.2.png
  :align: center

•	Tabla CSCO_MEMORY_DAY

.. image:: ../_static/images/ciscoprime/pag18.png
  :align: center

•	Tabla CSCO_MEMORY_DEVICE_AVG_HOUR

.. image:: ../_static/images/ciscoprime/pag18.2.png
  :align: center

•	Tabla CSCO_MEMORY_HOUR

.. image:: ../_static/images/ciscoprime/pag18.3.png
  :align: center

•	Tabla CSCO_MEMORY_IBHW
.. image:: ../_static/images/ciscoprime/pag18.4.png
  :align: center

•	Tabla ERROR_LOG_NEW

.. image:: ../_static/images/ciscoprime/pag19.png
  :align: center

•	Tabla PROCESS_TO_RUN

.. image:: ../_static/images/ciscoprime/pag19.2.png
  :align: center


6.5.	Pentaho
***************

.. image:: ../_static/images/ciscoprime/pag19.3.png
  :align: center

•	Proceso Pentaho End to End

.. image:: ../_static/images/ciscoprime/pag19.4.png
  :align: center

•	Pentaho Inventory End To End

.. image:: ../_static/images/ciscoprime/pag20.png
  :align: center

•	Pentaho Links End To End

.. image:: ../_static/images/ciscoprime/pag20.1.png
  :align: center

•	Pentaho Cgn Stats End To End

.. image:: ../_static/images/ciscoprime/pag21.png
  :align: center

•	Pentaho Interface End To End

.. image:: ../_static/images/ciscoprime/pag21.2.png
  :align: center

•	Pentaho Interface Avail End To End

.. image:: ../_static/images/ciscoprime/pag21.3.png
  :align: center

•	Pentaho Interface Errors End To End

.. image:: ../_static/images/ciscoprime/pag22.png
  :align: center

•	Pentaho Cpu Device Avg End To End

.. image:: ../_static/images/ciscoprime/pag22.2.png
  :align: center

•	Pentaho Memory Device Avg End To End

.. image:: ../_static/images/ciscoprime/pag23.png
  :align: center

•	Pentaho Cpu Mem Device Avg End To End

.. image:: ../_static/images/ciscoprime/pag23.2.png
  :align: center

7.	REPROCESO MANUAL
--------------------

**Pendiente**

8.	SMART
---------

Los reportes en la herramienta Smart se muestran de la siguiente manera: 

.. image:: ../_static/images/ciscoprime/pag24.png
  :align: center

.. image:: ../_static/images/ciscoprime/pag24.2.png
  :align: center

.. image:: ../_static/images/ciscoprime/pag24.3.png
  :align: center

.. image:: ../_static/images/ciscoprime/pag25.png
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
    <td>  </td>
    <td>  </td>
    <td> <p><a href="">  </a></p>  </td>
    <td>  </td>
    <td> </td>
  </tr>
  <tr>
    <td>  </td>
    <td> </td>
    <td>  <p><a href=""> </a></p>  </td>
    <td>   </td>
    <td></td>
    
  </tr>
  </table>