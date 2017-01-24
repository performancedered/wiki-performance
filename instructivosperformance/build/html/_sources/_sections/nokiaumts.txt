Uplink Interference (Nokia UMTS)
================================

1.  OBJETIVO 
------------

El presente documento buscar explicar y detallar el proceso que genera Uplink Interference (Nokia UMTS)

2.  ALCANCE
-----------

Áreas involucradas: Performance de Red

3.  DEFINICIONES
----------------

• Cortado: Servidor LINUX en donde se importan los CSV desde el proveedor.
El nombre es cortado.claro.amx y la dirección IP física es 10.105.146.8

4.  DESCRIPCIÓN GENERAL
-----------------------

**Nokia UMTS Uplink Interference**

Este desarrollo tiene la finalidad de detectar y clasificar la interferencia en las celdas UMTS tomando RTWP en función del tráfico de voz.
Al cruzar estos parámetros, obtenemos una nube de puntos la cual se modela con una regresión lineal, obteniendo así una pendiente y una ordenada al origen para cada celda. Esta información demuestra cómo evoluciona la interferencia según crece el tráfico. En función de estos valores se clasifica la celda dentro de 4 categorías que son indicadores de las acciones a tomar en cada caso.

.. image:: ../_static/images/nokiaumts/pag3.png
  :align: center

5.  MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/nokiaumts/pag4.png
  :align: center

6.  DESCRIPCIÓN DETALLADA
-------------------------

6.1.  Datos de origen
*********************

Server Origen: perdido.claro.amx

6.2.  Datos Destino 
*******************

• Server Destino: cortado.claro.amx

• BD: Smart2

• Frecuencia de corrida del proceso: 1 minuto

• RAW Si/No: No

• Hour Si/No: Si 

• Day Si/No: No

• BH Si/No: Si

• ISABH Si/No: Si 

6.3. Listado de Tablas Utilizadas
*********************************

Las tablas utilizadas son:

• UMTS_UL_INTFRNC_WCEL_HOUR


.. image:: ../_static/images/nokiaumts/pag4.2.png
  :align: center

• TABLERO_UMTS_ULINTFN_WCEL_WEEK

.. image:: ../_static/images/nokiaumts/pag5.png
  :align: center

Las Tablas utilizadas desde Perdido son: 

• UMTS_C_NSN_CELLRES_MNC1_RAW@SMART.WORLD T1

• UMTS_C_NSN_TRAFFIC_MNC1_RAW@SMART.WORLD T2

• UMTS_C_NSN_SERVLEV_MNC1_RAW@SMART.WORLD T3

7.  REPROCESO MANUAL
--------------------

**Pendiente de agregar**

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
