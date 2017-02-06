
ALCATEL LTE URUGUAY - ENODB
===========================

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera ALCATEL LTE URUGUAY - ENODB.

2.	ALCANCE
-----------

Áreas involucradas: Performance de Red.

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.

4.	DESCRIPCIÓN GENERAL
-----------------------

**ALCATEL LTE URUGUAY – ENODEB** 

La arquitectura de la red de acceso de LTE se compone de una única entidad de red denominada evolved NodeB (eNodeB) que constituye la estación base de E-UTRAN. Así pues, la estación base E-UTRAN integra toda la funcionalidad de la red de acceso.
Este desarrollo permite almacenar y monitorear los Indicadores de Performance y los parámetros de configuración correspondientes a los eNodeB del vendor Alcatel instalados en Uruguay, con la finalidad de obtener datos estadísticos y poder visualizarlos en la plataforma SMART

5.	MACROFLUJO DEL PROCESO
--------------------------


.. image:: ../_static/images/enodb/pag3.png
  :align: center 

6.	DESCRIPCIÓN DETALLADA
-------------------------

6.1.	Datos Origen
********************

•	Server Origen y Path: 10.111.102.62, /opt/5620sam/lte/stats/20160627/eNodeB/LCA003

•	Cantidad de archivos origen: Si 

	Por ejemplo: 
		
		o	A20170130.0000-0300-0015-0300_eNodeB-LCA003.gz

•	Frecuencia actualización: Cada 15 min

•	Tipo de Archivo: xml 

6.2.	Datos Destino
*********************

•	Server Destino: falda.claro.amx
•	Conversión de Archivos: Si 
•	Tabla Files: Si 
•	Tabla Auxiliar: Si 
•	Frecuencia de corrida del proceso: 14 minutos aproximadamente 
•	Regionales: No
•	RAW Si/No: Si 
•	Hour Si/No: Si 
•	Day Si/No: Si
•	BH Si/No: Si
•	ISABH Si/No: Si 
•	Países: Uruguay.
•	Directorio Destino (File System): "/calidad/ENodeB/"

6.3.	Shell Copiar Archivos Origen a Destino y limpieza de los mismos
***********************************************************************

Scripts tienen las siguientes funciones:

1- Copiar los archivos

2- Limpieza

3- Ejecutar Pentaho

Los scripts son los siguientes:

.. _ENodeBEndToEnd:  ../_static/images/enodb/ENodeBEndToEnd.sh
.. _runENodeB:  ../_static/images/enodb/runENodeB.sh
.. _runParserEnodeB:  ../_static/images/enodb/runParserEnodeB.sh 
.. _syncro_enodeb:  ../_static/images/enodb/syncro_enodeb.sh
.. _xml_parse:  ../_static/images/enodb/xml_parse.sh

+	ENodeBEndToEnd_

+	runENodeB_

+	runParserEnodeB_

+	syncro_enodeb_

+	xml_parse_


6.4.	Listado de tablas utilizadas
************************************

Las tablas utilizadas son las siguientes:

•	ERROR_LOG_NEW

.. image:: ../_static/images/enodb/pag5.png
  :align: center 

•	FILES

.. image:: ../_static/images/enodb/pag5.2.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_BH

.. image:: ../_static/images/enodb/pag6.png
  :align: center 

.. image:: ../_static/images/enodb/pag7.png
  :align: center 


•	LTE_C_ALC_UY_ENODEB_DAY


.. image:: ../_static/images/enodb/pag8.png
  :align: center 

.. image:: ../_static/images/enodb/pag9.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_DIC

.. image:: ../_static/images/enodb/pag9.2.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_HOUR

.. image:: ../_static/images/enodb/pag10.png
  :align: center 


.. image:: ../_static/images/enodb/pag11.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_IBHW

.. image:: ../_static/images/enodb/pag12.png
  :align: center 


.. image:: ../_static/images/enodb/pag13.png
  :align: center 


•	LTE_C_ALC_UY_ENODEB_RAW1

En esta tabla se obtiene los C”N”, con el valor hasta C627


.. image:: ../_static/images/enodb/pag14.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_RAW2

En esta tabla se obtiene los C”N”, con el valor hasta C627

.. image:: ../_static/images/enodb/pag14.2.png
  :align: center 

•	LTE_C_ALC_UY_ENODEB_RAW3

En esta tabla se obtiene los C”N”, con el valor hasta C627

.. image:: ../_static/images/enodb/pag15.png
  :align: center 

•	PROCESS_TO_RUN

.. image:: ../_static/images/enodb/pag15.2.png
  :align: center 

6.5.	Pentaho
***************

•	Proceso Pentaho End to End 

.. image:: ../_static/images/enodb/pag15.3.png
  :align: center 

•	Pentaho ParseXml

Este proceso parsea los archivos xml cada 15 minutos.

.. image:: ../_static/images/enodb/pag16.png
  :align: center 


•	Pentaho Get Files

Este proceso obtiene los archivos generados por el parser en formato csv, este archivo generado contiene 4 archivos xml de una misma hora, cada archivo se genera cada 15 minutos.

Luego de generar el csv, se guarda el nombre del archivo en la tabla Files.

.. image:: ../_static/images/enodb/pag16.2.png
  :align: center 


•	Pentaho Get FileName from Table

Una vez obtenido el csv, los datos son insertados en  3 tablas Raw.

El significado de cada columna de la tabla Raw se encuentra en la tabla LTE_C_ALC_UY_ENODEB_DIC

.. image:: ../_static/images/enodb/pag16.3.png
  :align: center 

7.	REPROCESO MANUAL
--------------------

Macro Flujo de Reproceso: 

.. image:: ../_static/images/enodb/pag17.png
  :align: center 


Este reproceso borra los registros para la hora que desee reprocesar, descargando los archivos para la hora necesaria y realiza el mismo procedimiento del macro flujo original. 

Ubicación de los scripts en la carpeta: "/calidad/ENodeB/Scripts/"

Ubicación del Rework de ejecución en Pentaho:  "/calidad/ENodeB/Rework/RunEnodeB.kjb"–

Para realizar el reproceso se debe ingresar los siguientes parámetros:

	•	Ruta del proyecto

	•	Fecha con formato YYYYMMDD

	•	Fecha con formato YYYYMMDD.HH24

	•	Fecha con formato DDMMYYYYHH24

Por consola se utiliza de la siguiente manera: 

.. image:: ../_static/images/enodb/pag17.2.png
  :align: center 

Ejecutando el  siguiente script:

.. _ENodeBEndToEndRework: ENodeBEndToEndRework.sh

.. _syncro_enodeb_rework: syncro_enodeb_rework.sh

+	ENodeBEndToEndRework_

+	syncro_enodeb_rework_

Al ejecutar el script ENodeBEndToEndRework_, dentro del mismo se ejecuta el script syncro_enodeb_rework_.

8.	Smart
---------

**Se encuentran pendientes los gráficos.**

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