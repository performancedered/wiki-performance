TECNOTREE COMMERCIAL ENGINE
===========================

1.  OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera Tecnotree Commercial Engine.

2.  ALCANCE
-----------

Áreas involucradas: Performance de Red

3.  DEFINICIONES
----------------

• Cortado: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es cortado.claro.amx y la dirección ip física es 10.105.146.8

4.  DESCRIPCIÓN GENERAL 
-----------------------

La plataforma CE permite cobrar servicios de contenidos (suscripciones, votaciones, descargas, Claro Música, Claro Video, etc.) mediante webservices expuestos a los proveedores de contenidos.A su vez gestiona el ciclo de las suscripciones (la expiración, la entrega de contenidos, la renovación)


5.  DESCRIPCIÓN DETALLADA
-------------------------

5.2 Datos de Origen
....................

• Server Origen y Path: 10.48.69.68 - /data1/uyce/data/tpsfiles

• Cantidad de archivos origen: 2 archivos

    • CM_TPSReport_Individual
    • CDC_TPSReport_Individual 

• Frecuencia actualización: Frecuencia diaria

• Tipo de Archivo: csv

5.3 Datos de Destino
--------------------

• Server Destino: Cortado

• Conversión de Archivos: No

• Tabla Files: Si

• Tabla Auxiliar: Si

• Frecuencia de corrida del proceso: 1 vez al día

• Regionales: No

• RAW Si/No: Si

• Hour Si/No: Si

• Day Si/No: Si

• BH Si/No: Si

• IBHW Si/No: Si

• Países: No

• Directorio Destino (File System): /home/calidad/TecnotreeCE

5.4 Shell Copiar Archivos Origen a Destino y limpieza de los mismos:
--------------------------------------------------------------------

Los Scripts tienen las siguientes funciones:

1- Copiar los archivos

2- Limpieza

3- Ejecutar Pentaho

El Script falta script es la raíz de proceso

Los scripts son los siguientes:


.. _cleanupFiles: ../_static/images/tecnotree/cleanupFiles.sh 
.. _countLines: ../_static/images/tecnotree/countLines.sh
.. _firstLoad:  ../_static/images/tecnotree/firstLoad.sh
.. _scpTecnotree: ../_static/images/tecnotree/scpTecnotree.sh
.. _scpTecnotreeDate: ../_static/images/tecnotree/scpTecnotreeDate.sh
.. _scpTecnotreeTest: ../_static/images/tecnotree/scpTecnotreeTest.sh
.. _tecnotree:  ../_static/images/tecnotree/tecnotree.sh
.. _tecnotreeDiario: ../_static/images/tecnotree/tecnotreeDiario.sh

+ `cleanupFiles`_

+ `countLines`_

+ `firstLoad`_

+ `scpTecnotree`_

+ `scpTecnotreeDate`_

+ `scpTecnotreeTest`_ 

+ `tecnotree`_

+ `tecnotreeDiario`_


5.5 Listado de tablas utilizadas
................................

Campos de la tabla FILE: 

.. image:: ../_static/images/tecnotree/pag9.png
  :align: center

Las tablas utilizadas son las siguientes:

.. image:: ../_static/images/tecnotree/pag9.2.png
  :align: center

Campos de la tabla SVA_OBJECTS:


.. image:: ../_static/images/tecnotree/pag3.png
  :align: center

Campos de la tabla TEC_CE_CDC_TPS_AUX:

.. image:: ../_static/images/tecnotree/pag4.png
  :align: center

Campos de la tabla TEC_CE_CDC_TPS_AUX_TEMPLATE:

.. image:: ../_static/images/tecnotree/pag4.2.png
  :align: center

Campos de la tabla TEC_CE_CDC_TPS_BH:

.. image:: ../_static/images/tecnotree/pag4.3.png
  :align: center


Campos de la tabla TEC_CE_CDC_TPS_DAY:

.. image:: ../_static/images/tecnotree/pag4.4.png
  :align: center

Campos de la tabla TEC_CE_CDC_TPS_HOUR:

.. image:: ../_static/images/tecnotree/pag5.png
  :align: center


Campos de la tabla TEC_CE_CDC_TPS_IBHW:

.. image:: ../_static/images/tecnotree/pag5.2.png
  :align: center

Campos de la tabla TEC_CE_CM_TPS_AUX:

.. image:: ../_static/images/tecnotree/pag5.3.png
  :align: center


Campos de la tabla TEC_CE_CM_TPS_BH:

.. image:: ../_static/images/tecnotree/pag6.png
  :align: center

Campos de la tabla TEC_CE_CM_TPS_DAY:

.. image:: ../_static/images/tecnotree/pag6.2.png
  :align: center

Campos de la tabla TEC_CE_CM_TPS_HOUR:

.. image:: ../_static/images/tecnotree/pag6.3.png
  :align: center

Campos de la tabla TEC_CE_CM_TPS_IBHW: 

.. image:: ../_static/images/tecnotree/pag6.4.png
  :align: center

Campos de la tabla TEC_CE_CM_TPS_RAW: 

.. image:: ../_static/images/tecnotree/pag7.png
  :align: center


6.  MACROFLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/tecnotree/pag7.2.png
  :align: center

6.2 Pentaho
...........

Estructura del proyecto:

.. image:: ../_static/images/tecnotree/pag9.3.png
  :align: center


• Proceso Pentaho End to End

Tenemos el Shell `tecnotreeDiario`_ que trae datos para el servidor Cortado. Luego setea variables de entorno, directorios donde se encuentran los datos para procesar los archivos disponibles.

En la Carpeta File se encuentran todos los archivos a procesar.

Los archivos a procesar dependen del status en que se encuentran:

  • 0: Se procesó correctamente

  • 1: Se procesó pero tuvo error

  • 5: Para procesar

.. image:: ../_static/images/tecnotree/pag10.png
  :align: center

• Pentaho Inserción tabla Files

Get File Names To Import: se encarga de buscar los archivos del sistema operativo y los envía a Populate FILES table para escribirlos en la tabla File. Escribe los siguientes datos:

  • Nombre del archivo

  • Status

.. image:: ../_static/images/tecnotree/pag10.2.png
  :align: center

Por cada archivo debe crearse un proceso específico: 

  • Proceso CDC Data

.. image:: ../_static/images/tecnotree/pag11.png
  :align: center

• Proceso CM Data
 
.. image:: ../_static/images/tecnotree/pag11.2.png
  :align: center

• Pentaho Calculo Sumarizaciones

Las sumarizaciones se calculan a día vencido (el día anterior al actual), para dicho cálculo se debe llamar al procedimiento Call  DB Procedure.

.. image:: ../_static/images/tecnotree/pag11.3.png
  :align: center


7.  REPROCESO MANUAL
--------------------

7.1 Administración de particiones
.................................

Antes de realizar el reproceso manual se debe realizar la administración de particiones, la cual se encarga de borrar los datos que serán reprocesados e insertados nuevamente a la tabla.

Para realizar este proceso se debe ejecutar la siguiente querie: 

Parámetros: 

• Nombre de la tabla
• Fecha desde (DD.MM.YYYY)
• Fecha hasta (DD.MM.YYYY)

Para todos los niveles se utilizan los mismos parámetros de ejecución. 

Por ejemplo: 

• G_PARTITION_MGMT.P_DROP_PARTITION_WEEK('CISCO_GGSN_EPDG_ISABHW','01.01.2017','07.01.2017');

.. _G_PARTITION_MGMT: ../_static/images/archivo/G_PARTITION_MGMT.sql 


7.2 Procedimiento de reproceso manual paso a paso:
..................................................

Se debe ejecutar el script `scpTecnotreeDate`_ , el cual debe recibir por parámetro la Fecha solicitada, para realizar la limpieza, para luego ejecutar el TecnotreeCERework.kjb en Pentaho de manera manual. 

Ubicación de los scripts en la carpeta /home/calidad/TecnotreeCE/Scripts

Ubicación del Rework de ejecución en Pentaho: /home/calidadTecnoTreeCE/Rework

El Formato de la fecha es el siguiente:

  • YYYYMMDD

Por consola se utiliza de la siguiente manera:

  • ./Pentaho61/data-integration/kitchen.sh -file=/home/calidad/TecnotreeCE/ TecnotreeCERework.kjb –param:FECHA_PROC= YYYYMMDD

8.  SMART
---------

Interfaz de cobro (CM) - Comparativo por País: Histórico 

.. image:: ../_static/images/tecnotree/pag12.png
  :align: center

Interfaz de cobro(CM) - Comparativo por País: Diario

.. image:: ../_static/images/tecnotree/pag13.png
  :align: center

Control de Contenido (CDC): Diario

.. image:: ../_static/images/tecnotree/pag13.2.png
  :align: center

Control de Contenido (CDC): Histórico 

.. image:: ../_static/images/tecnotree/pag14.png
  :align: center

Control de Contenido (CDC) - Comparativo por País

.. image:: ../_static/images/tecnotree/pag14.2.png
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
    <td>  <p><a href="">  </a></p>  </td>
    <td>   </td>
    <td></td>
    
  </tr>
  </table>