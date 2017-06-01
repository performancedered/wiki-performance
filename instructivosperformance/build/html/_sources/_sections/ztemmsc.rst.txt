
ZTE MMSC
========

1.	OBJETIVO
------------

El presente documento busca explicar y detallar el proceso que genera MMSC

2.	ALCANCE 
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

Servidor de desarrollo: falda.claro.amx
Servidor productivo: cortado.claro.amx

4.	DESCRIPCION GENERAL 
-----------------------

MMSC (Multimedia Messaging Service) es una plataforma perteneciente al área de SVA (Servicios de Valor Agregado) que se encarga del manejo y control de los mensajes multimedia recibidos de los usuarios.
Hay un servidor solo que contiene la información para los 3 países en archivos CSV.

5.	MACRO FLUJO DEL PROCESO
---------------------------

No aplica esta sub-seccion.

6.	DESCRIPCIÓN DETALLADA
--------------------------

6.1.	Datos Origen
********************

• Server Origen y Path

  10.105.146.8

  ztearchive
  
  ZteArchive2015 
  
  /home/ztearchive/mmsc/ARG
  
  /home/ztearchive/mmsc/
  
  /home/ztearchive/mmsc/ARG


6.2.	Datos Destino
*********************

• Server Destino: cortado.claro.amx

• Conversión de Archivos: No.

• Tabla Files: Si

• Tabla Auxiliar: Si

• Frecuencia de corrida del proceso: cada 1 DIA

• Regionales: No

• RAW Si/No: No

• Hour Si/No: Si

• Day Si/No: Si

• BH Si/No: Si

• ISABH Si/No: Si

• Directorio Destino (File System): /calidad/MmscZTE

6.3.	Shell Copiar Archivos Origen a Destino y limpieza de los mismos
***********************************************************************

Scripts tienen las siguientes funciones:
1- Copiar los archivos
2- Limpieza
3- Ejecutar Pentaho

No aplica esta sub-seccoion.


6.4.	Listado de Tablas Utilizadas
************************************

Las tablas utilizadas son las siguientes:

MMSC_SERVICE_ZTE_HOUR

.. image:: ../_static/images/ztemmsc/image1.png
  :align: center

MMSC_SERVICE_ZTE_DAY

MMSC_SERVICE_ZTE_BH

MMSC_SERVICE_ZTE_IBHW

MMSC_SERVICE_ZTE_AUX

MMSC_SERVICE_ZTE_TMP

FILES

6.5.	Pentaho
**************

No aplica esta sub-seccion.

7.  CONTROLES
-------------

• El analista reporta los faltantes de datos.
• Se revisa que los datos se estén generando en el origen
• Se revisa los procedimientos y las horas faltantes que cargan las tablas.
• Una vez detectado el problema se procede a reclamar al proveedor por los datos faltantes o se reprocesan las tablas en caso de ser un error de carga de las tablas.

8.	REPROCESO MANUAL
--------------------

No aplica esta sub-seccion.

8.	SMART
---------

Los reportes en la herramienta Smart se muestran de la siguiente manera: 

.. image:: ../_static/images/ztemmsc/image2.png
  :align: center

.. image:: ../_static/images/ztemmsc/image3.png
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
    <td> 26/05/2017 </td>
    <td> Franco Rianldi </td>
    <td> <p><a href="http://jira.harriague.com.ar/jira/browse/CL-592"> CL-529 </a></p>  </td>
    <td> Creacion de documentación de Proyecto existente.
         <br>Proyecto actual - Cortado.</br></td>
    <td> Servidor: CORTADO </td>
  </tr>
  </table>