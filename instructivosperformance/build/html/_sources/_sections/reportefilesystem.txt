
Reporte File System
===================

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Reporte File System

2.	ALCANCE
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

•	Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx.

4.	DESCRIPCIÓN GENERAL
-----------------------

**REPORTE FILE SYSTEM**

Este reporte se utiliza para controlar el estado de los File System en los servidores.

5.	MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/reportefilesystem/pag3.png
  :align: center 
   
6.	DESCRIPCIÓN DETALLADA
-------------------------

6.1. Datos de origen y datos destino
************************************

•	Server Origen:

		•	PERDIDO

		•	GUERRERO

		•	CORTADO 

•	Frecuencia actualización: 2 veces por dia(hora 7hs y 16hs)

•	Tipo de Archivo de Salida: HTML

6.2. Shell Copiar Archivos Origen a Destino y limpieza de los mismos
********************************************************************

Los scripts son los siguientes:

.. _deleteEmptyLogs: ../_static/images/reportefilesystem/deleteEmptyLogs.sh

.. _diskFree: ../_static/images/reportefilesystem/diskFree.sh

.. _runInfoStorage: ../_static/images/reportefilesystem/runInfoStorage.sh

+	deleteEmptyLogs_

+	diskFree_

+	runInfoStorage_


6.3.	Listado de Tablas Utilizadas 
************************************

No utiliza  por que trae los datos desde los servidores.

6.4. Pentaho
************

Estructura del proyecto:


.. image:: ../_static/images/reportefilesystem/pag4.png
  :align: center 

•	Proceso Pentaho End to End

.. image:: ../_static/images/reportefilesystem/pag4.2.png
  :align: center 

•	Proceso StoragePerdidoRC21

Dentro de Perdido RC2 RC1 SSH commands se ejecuta el siguiente script: 

.. image:: ../_static/images/reportefilesystem/pag4.3.png
  :align: center 

.. image:: ../_static/images/reportefilesystem/pag5.png
  :align: center 

En los procesos: 

•	StoragePerdidoRC3

.. image:: ../_static/images/reportefilesystem/pag5.2.png
  :align: center 

•	StorageGuerreroST1

.. image:: ../_static/images/reportefilesystem/pag5.3.png
  :align: center 

•	StorageCortado

.. image:: ../_static/images/reportefilesystem/pag5.4.png
  :align: center 

Se realiza el mismo procedimiento que en StoragePerdidoRC21, solo se realiza la modificación en el Servidor del cual se obtienen los datos.

7.	REPROCESO MANUAL
--------------------

Para realizar el reproceso se debe correr lo siguiente por consola: 

.. image:: ../_static/images/reportefilesystem/pag5.5.png
  :align: center

El email muestra la información de la siguiente manera:

.. image:: ../_static/images/reportefilesystem/pag5.6.png
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
    <td> Marcelo Carrasco </td>
    <td> - </td>
    <td>  </td>
    <td> -</td>
  </tr>

 </table>