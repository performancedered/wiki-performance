
Reporte Tráfico Mensual Implantación
====================================


1.	OBJETIVO
------------
El presente documento buscar explicar y detallar el proceso que genera el Reporte Trafico Mensual Implantación.

2.	ALCANCE 
-----------
Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.
•	Cortado: Servidor LINUX en donde se importan los CSV desde el proveedor.
El nombre es cortado.claro.amx y la dirección IP física es 10.105.146.8

4.	DESCRIPCIÓN GENERAL
-----------------------

Este reporte será utilizado por el área de Implantación para saber si un contrato de alquiler de sitio debe renovarse o no con el propietario. 
Se deben remarcar los siguientes casos:

•	Sitios con contratos próximos a vencer de sitios que no tienen trafico  
•	Sitios con contratos vencidos o rescindidos que tiene trafico
	Se toma información de tráfico de la base de datos Smart (gsm, umts, lte).

El Excel muestra las siguientes solapas:

•	Tráfico: En esta solapa se deben ingresar los valores CELL ID para verificar si hay tráfico.
•	Detalle: Muestra una tabla con los datos de cada CELL ID

Para saber si hay tráfico en los últimos 6 meses se utiliza la solapa Trafico, ingresando el cell id

.. image:: ../_static/images/reporteimplantacion/pag3.png
  :align: center 


.. |banderaverde| image:: ../_static/images/reporteimplantacion/bandera1.png
.. |banderaroja| image:: ../_static/images/reporteimplantacion/bandera2.png

Cuando ingresamos las cell id nos devuelve dos resultados: 

•	Bandera Verde |banderaverde|: Significa que hubo tráfico en algunas de las mediciones en los meses que indica la planilla.
•	Bandera Roja  |banderaroja|: Significa que hubo no tráfico en algunas de las mediciones en los meses que indica la planilla.

5.	MACROFLUJO 
--------------

.. image:: ../_static/images/reporteimplantacion/pag4.png
  :align: center 

6. DESCRIPCIÓN DETALLADA
------------------------

6.1. Datos de origen y datos destino
************************************

•	Server Origen y Path: falda.claro.amx, /calidad/ReporteImp/ 
•	Frecuencia actualización:  Mensual (El quinto día de cada mes)
•	Tipo de Archivo de Salida: .xls

6.2. Shell Copiar Archivos Origen a Destino y limpieza de los mismos
********************************************************************

Los scripts son los siguientes:

.. _reporteImp: ../_static/images/reporteimplantacion/reporteImp.sh

.. _reporteImpMensual: ../_static/images/reporteimplantacion/reporteImpMensual.sh

+	reporteImp_

+	reporteImpMensual_


6.3. Listado de Tablas Utilizadas
*********************************

Las tablas utilizadas son: 

•	MULTIVENDOR_BTS_DAY_MONTH MV
•	MULTIVENDOR_GPRS_DAY_MONTH MV
•	OBJECTS_SP_GSM
•	UMTS_NSN_SERVICE_WCEL_DAYM
•	UMTSC_NSN_MACD_WCEL_DAYM
•	OBJECTS_SP_UMTS
•	OBJECTS_SP_LTE
•	LTE_NSN_SERVICE_LCEL_DAYM

6.4. Pentaho
************

Estructura del proyecto:

.. image:: ../_static/images/reporteimplantacion/pag5.png
  :align: center

•	Proceso Pentaho End to End

.. image:: ../_static/images/reporteimplantacion/pag5.2.png
  :align: center

•	Proceso Generar Excel 

Este proceso se encarga de ejecutar la query en tráfico imple, en el siguiente paso se da formato a la fecha (DD/MM/YYYY) y para finalizar se cargan los datos en el template de Excel 

.. image:: ../_static/images/reporteimplantacion/pag5.3.png
  :align: center

7.	CONTROLES
-------------

**No contiene controles**

8. REPROCESO MANUAL
-------------------

**No tiene reproceso.** 

Se envía vía email un archivo Excel con el nombre: trafico_implantacion 03-2017 

.. image:: ../_static/images/reporteimplantacion/pag6.png
  :align: center

.. image:: ../_static/images/reporteimplantacion/pag6.2.png
  :align: center