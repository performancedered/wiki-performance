
Reporte Hour
============


1.	OBJETIVO 
------------

El presente documento buscar explicar y detallar el proceso que genera el Reporte a Nivel HOURS	

2.	ALCANCE
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.

4.	DESCRIPCIÓN GENERAL
-----------------------

**REPORTE A NIVEL HOURS**

Este reporte se utiliza para obtener los datos de las 3 tecnologías (GSM, UMTS, LTE) enviando un email con los datos y los gráficos del tráfico por hora. 

5.	MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/reportehour/pag3.png
  :align: center 

6.	DESCRIPCIÓN DETALLADA
-------------------------

6.1. Datos de origen
********************

•	Server Origen y Path: falda.claro.amx  , /calidad/Reportes/

•	Frecuencia actualización: Frecuencia diaria

•	Tipo de Archivo de Salida: xlsx

6.2. Datos Destino
******************

•	Server Destino: Falda 

•	Conversión de Archivos: No

•	Tabla Files: No

•	Tabla Auxiliar: No 

•	Frecuencia de corrida del proceso: 1 vez al día

•	Regionales: No

•	RAW Si/No: No

•	Hour Si/No: Si

•	Day Si/No: No

•	BH Si/No: No

•	Países: No

•	Directorio Destino (File System): /home/calidad/Reportes 

6.3. Shell Copiar Archivos Origen a Destino y limpieza de los mismos
********************************************************************

.. _Report: ../_static/images/reportehour/report.sh

El script es el siguiente:

+	Report_


6.4. Listado de Tablas Utilizadas
*********************************

Las tablas son las siguientes: 

•	CALIDAD_STATUS_REFERENCES

•	UMTS_NSN_SERVICE_WCEL_HOU2

•	UMTS_NSN_SERVICE_NE_HOUR

•	MULTIVENDOR_GPRS_ALM_HOUR

•	MULTIVENDOR_GPRS_MKT_HOUR

•	MULTIVENDOR_GPRS_BSC_HOUR

•	MULTIVENDOR_GPRS_PAIS_HOUR

•	MVENDOR_GPRS_BTS_HOUR

•	MULTIVENDOR_PAIS_HOUR

•	MULTIVENDOR_ALM_HOUR

•	MULTIVENDOR_MKT_HOUR

•	MULTIVENDOR_BSC_HOUR

•	UMTS_NSN_SERVICE_WCEL_HOU2

•	UMTS_NSN_SERVICE_NE_HOUR

•	LTE_NSN_SERVICE_LCEL_HOUR

•	LTE_NSN_PAQ_LCEL_HOUR

•	LTE_NSN_AVAIL_LCEL_HOUR

•	LTE_NSN_SERVICE_LCEL_HOUR

•	LTE_NSN_PAQ_LCEL_HOUR

•	LTE_NSN_AVAIL_LCEL_HOUR

•	LTE_NSN_SERVICE_LCEL_HOUR

•	LTE_NSN_PAQ_LCEL_HOUR

•	LTE_NSN_AVAIL_LCEL_HOUR

•	LTE_NSN_SERVICE_LCEL_HOUR

•	LTE_NSN_PAQ_LCEL_HOUR

•	LTE_NSN_AVAIL_LCEL_HOUR

•	LTE_NSN_SERVICE_NE_HOUR

•	LTE_NSN_PAQ_NE_HOUR

•	LTE_NSN_AVAIL_NE_HOUR


6.5. Pentaho
************

Estructura del proyecto:
 
.. image:: ../_static/images/reportehour/pag5.bis.png
  :align: center 

+	Proceso Pentaho End to End

.. image:: ../_static/images/reportehour/pag5.png
  :align: center 

+	Proceso Pentaho UMTS

En este proceso se obtiene datos de las tablas de UMTS_SERVICE y UMTS_HO y  se crea un excel con 2 hojas una para cada medición (service, ho) 

.. image:: ../_static/images/reportehour/pag5.2.png
  :align: center 


•	Proceso Pentaho GSM

.. image:: ../_static/images/reportehour/pag5.3.png
  :align: center 

•	Proceso Pentaho LTE

.. image:: ../_static/images/reportehour/pag6.png
  :align: center 

Para reprocesar se debe ejecutar por consola el script report.sh, los datos obtenidos será la fecha del dia anterior:

.. image:: ../_static/images/reportehour/pag6.2.png
  :align: center 
 
El email muestra los archivos adjuntos en formato xlsx que contiene los datos mencionados anteriormente:

.. image:: ../_static/images/reportehour/pag6.3.png
  :align: center 

Gráficos que se encuentran en el archivo que se envía adjunto al email:

.. image:: ../_static/images/reportehour/pag7.png
  :align: center 

.. image:: ../_static/images/reportehour/pag7.2.png
  :align: center 

.. image:: ../_static/images/reportehour/pag7.3.png
  :align: center 

7. CONTROL DE CAMBIOS
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
    <td> </td>
    <td>  </td>
    <td> </td>
  </tr>

 </table>