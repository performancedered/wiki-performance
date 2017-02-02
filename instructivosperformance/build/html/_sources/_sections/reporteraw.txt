
Reporte Raw
===========

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Reporte a Nivel Raw.

2.	ALCANCE
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.

4.	DESCRIPCIÓN GENERAL
-----------------------

**REPORTE A NIVEL RAW**

Este reporte se utiliza para verificar si están todos los datos provenientes desde los XML ya insertados en la base de datos. 

5. MACRO FLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/reporteraw/pag3.png
  :align: center 


6.	DESCRIPCIÓN DETALLADA
-------------------------

6.1. Datos de origen y datos destino
************************************

•	Server Origen y Path: falda.claro.amx  /calidad/CYR

•	Frecuencia actualización: Frecuencia diaria

•	Tipo de Archivo de Salida: HTML

6.2. Shell Copiar Archivos Origen a Destino y limpieza de los mismos
********************************************************************

Los scripts son los siguientes:  

.. _buildHtml:  ../_static/images/reporteraw/buildHtml.sh
.. _control_raw: ../_static/images/reporteraw/control_raw.sh
.. _cyr: ../_static/images/reporteraw/cyr.sh
.. _replace_char_in_file: ../_static/images/reporteraw/replace_char_in_file.sh

+	buildHtml_

+	control_raw_

+	cyr_

+	replace_char_in_file_


6.3. Listado de Tablas Utilizadas
*********************************


**SCRIPT: STATUS_GSM_GRAL.SQL**

	o	MULTIVENDOR_OBJECT2

	o	CALIDAD_STATUS_REFERENCES

	o	GSM_C_NSN_TRAFFIC_HOU2

	o	GSM_C_NSN_HO_HOU2

	o	GSM_C_NSN_SERVICE_HOU2

	o	GSM_C_NSN_RESAVAIL_HOU2

	o	GSM_C_NSN_RESACC_HOU2

	o	GSM_C_NSN_FER_HOU2

	o	GSM_C_NSN_PCU_HOU2

	o	GSM_C_NSN_QOSPCL_HOU2

	o	GSM_C_NSN_RXQUAL_HOU2



**SCRIPT: STATUS_UMTS_GRAL.SQL**


	o	MULTIVENDOR_OBJECT2

	o	CALIDAD_STATUS_REFERENCES

	o	UMTS_C_NSN_SERVLEV_MNC1_RAW

	o	UMTS_C_NSN_TRAFFIC_MNC1_RAW

	o	UMTS_C_NSN_CELLRES_MNC1_RAW

	o	UMTS_C_NSN_HSDPAW_MNC1_RAW

	o	UMTS_C_NSN_CELLTP_MNC1_RAW

	o	UMTS_C_NSN_RRC_MNC1_RAW

	o	UMTS_C_NSN_INTSYSHO_MNC1_RAW

	o	UMTS_C_NSN_SOFTHO_MNC1_RAW

	o	UMTS_C_NSN_INTERSHO_MNC1_RAW

	o	UMTS_C_NSN_CELTPW_MNC1_RAW

	o	UMTS_C_NSN_CPICHQ_MNC1_RAW

	o	UMTS_C_NSN_L3IUB_MNC1_RAW

	o	UMTS_C_NSN_PKTCALL_MNC1_RAW


**SCRIPT: STATUS_LTE_GRAL.SQL**


	o	MULTIVENDOR_OBJECT2

	o	CALIDAD_STATUS_REFERENCES

	o	NOKLTE_PS_LCELAV_MNC1_RAW

	o	NOKLTE_PS_LCELLD_MNC1_RAW

	o	NOKLTE_PS_LCELLT_MNC1_RAW

	o	NOKLTE_PS_LEPSB_MNC1_RAW

	o	NOKLTE_PS_LPQDL_MNC1_RAW

	o	NOKLTE_PS_LPQUL_MNC1_RAW

	o	NOKLTE_PS_LRRC_MNC1_RAW

	o	NOKLTE_PS_LUEST_MNC1_RAW

6.4. Pentaho
************

Estructura del proyecto:

.. image:: ../_static/images/reporteraw/pag5.png
  :align: center


•	Proceso Pentaho End to End
******************************

.. image:: ../_static/images/reporteraw/pag5.2.png
  :align: center
 
•	Proceso Pentaho GetStatusGral
*********************************

En este proceso se ejecutan las 3 tecnologías, en el orden: 

	•	UMTS

	•	GSM

	•	LTE

.. image:: ../_static/images/reporteraw/pag5.3.png
  :align: center
 
 
•	Proceso Pentaho CreateFileMailContent
*****************************************

En este proceso se Valida la existencia del HTML para construir el Reporte que será enviado por email, en caso de no existir el HTML, se crea.

.. image:: ../_static/images/reporteraw/pag6.png
  :align: center

 
7.	REPROCESO MANUAL
--------------------

.. _clic_aqui: http://10.111.249.17/wiki-performance/instructivosperformance/build/html/acceso.html#acceso

Para realizar el reproceso a nivel raw hacer clic_aqui_
	
El email muestra la información de la siguiente manera:

.. image:: ../_static/images/reporteraw/pag6.2.png
  :align: center

8. CONTROL DE CAMBIOS
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
    <td>  </td>
    <td>  </td>
    <td> </td>
  </tr>

 </table>