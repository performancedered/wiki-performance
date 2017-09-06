
Tablero IUR
===========

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera el Tablero IUR.

2. ALCANCE
----------

Áreas involucradas: Performance de Red, procesos. 

3. DEFINICIONES
---------------

+	Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es perdido.claro.amx y la dirección ip física es 10.92.50.83

4. DESCRIPCION GENERAL
----------------------

**Tablero IUR**

El IUR (Indicador Unico de Red) indica el porcentaje de celdas 3G de la red cuyos indicadores están OK. Ejemplo: en la red AUP hay 55.000 celdas, de las cuales 30.000 tienen sus indicadores OK, entonces el IUR es del 60%. IUR = 30.000 / 50.000 * 100

Para considerar que los indicadores de una celda están OK, todos y c/u de los indicadores de esa celda deben cumplir, o sea deben estar por encima del umbral definido. Si la celda cumple con todas las condiciones, se dice que está funcionando correctamente a nivel de acceso, y se asigna el valor de 1. Si no cumple con alguna de las condiciones se le asigna el valor de cero. El indicador se forma de siguiente manera:

	IUR = 100 * Suma de las celdas que cumplen las condiciones / Cantidad de celdas totales

Los indicadores definidos son:

1) *No Retenibilidad de Voz* : Representa el porcentaje de llamadas caídas. Menor o Igual que 1%
2) *Accesibilidad de Voz* : Representa el porcentaje de establecimiento de llamadas de voz. Mayor o Igual que 98% 
3) *RTWP*: Representa el nivel total de ruido dentro de la banda de frecuencia. Menor o Igual que -90 dBm
4) *No Accesibilidad Datos HSDPA* : Representa el porcentaje de fallas en el canal de datos HSDPA sobre el total de intentos. Menor o Igual a 5%
5) *Throughput HSDPA* : Representa la velocidad de conexión para los usuarios en HSDPA. Mayor o Igual que 400 kbps
6) *Usuarios Simultáneos HSDPA* : Indica la cantidad de usuarios conectados en forma simultánea. Menor o Igual a 40
7) *Disponibilidad Cliente* : Indica el porcentaje de tiempo que la celda está al aire. Mayor o Igual que 99,6%
8) *Capacity Management* : Representa el porcentaje de la carga de voz, datos y usuarios de la celda. Menor o Igual que 80%

Para todos los indicadores se consideran los valores ISABHW (pico semanal), excepto para la Disponibilidad Cliente que es diaria. ISABHW = Individual Sector Average-Busy-Hour Week, o sea promedio de los valores de hora pico de la semana, de cada sector individual.


.. image:: ../_static/images/tablero_iur/pag4.png
  :align: center


•	Server: perdido.claro.amx (10.92.50.83).

•	Base de Datos: Oracle 10G. Instancia WILLY

•	Proceso que genera el tablero: el proceso tiene nombre “tablero_iur.sh” y actualiza la tabla semanalmente  tablero_umts_iur_isabhw se lo puede encontrar en el crontab del equipo perdido, a continuación se lo transcribe:

00 11 * * 1 /calidad/tablero/iur/tablero_iur.sh                                   > /dev/null 2>&1
La ejecución entonces se realiza el minuto 11, de la hora 00, todos los días Lunes del año, todos los meses del año, todos los días de la semana (00 11 * * *) 

•	Frecuencia del proceso: Semana

•	Duración del proceso: 2 minutos aprox

•	Ubicación del proceso: /calidad/tablero/iur/tablero_iur.sh 

•	Logueo del proceso: el logueo del proceso se realiza en el archivo tablero_iur.log (ubicado en el path calidad/tablero/iur) 

4.2. Listado de Tablas Utilizadas
*********************************

Tablas utilizadas: 

•	UMTS_NSN_SERVICE_WCEL_ISABHWC 

.. image:: ../_static/images/tablero_iur/pag5.png
  :align: center

•	UMTS_NSN_SERVICE_WCEL_ISABHWP 

.. _UMTS_NSN_SERVICE_WCEL_ISABHWP: ../_static/images/tablero_iur/UMTS_NSN_SERVICE_WCEL_ISABHWP.xml

Tabla completa en: UMTS_NSN_SERVICE_WCEL_ISABHWP_ 

•	UMTSC_NSN_HSDPA_WCEL_ISABHW   

.. _UMTSC_NSN_HSDPA_WCEL_ISABHW: ../_static/images/tablero_iur/UMTSC_NSN_HSDPA_WCEL_ISABHW.xml

Tabla completa en: UMTSC_NSN_HSDPA_WCEL_ISABHW_ 

•	OBJECTS_SP_UMTS      

.. image:: ../_static/images/tablero_iur/pag6.png
  :align: center

•	NOC_UMTS_AVAIL_WCEL_DAYWO  

.. image:: ../_static/images/tablero_iur/pag7.png
  :align: center

•	UMTSC_NSN_MACD_WCEL_ISABHW 

.. image:: ../_static/images/tablero_iur/pag8.png
  :align: center

•	UMTS_NSN_HSDPA_WCEL_ISABHW 

.. image:: ../_static/images/tablero_iur/pag9.png
  :align: center

•	UMTS_CLDD_RADAR_WCEL_DAYW  

.. image:: ../_static/images/tablero_iur/pag10.png
  :align: center

5. MACRO FLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/tablero_iur/pag10.2.png
  :align: center

6. DESCRIPCION DETALLADA
------------------------

.. _tablero_iur_log: ../_static/images/tablero_iur/tablero_iur.log 
.. _tablero_iur: ../_static/images/tablero_iur/tablero_iur.sh 
.. _tablero_iur_umts_isabhw: ../_static/images/tablero_iur/tablero_iur_umts_isabhw.sql
.. _tablero_iur_umts_isabhw_rec: ../_static/images/tablero_iur/tablero_iur_umts_isabhw_rec.sql

•	Shell Script: tablero_iur_ 

•	El logueo del proceso se realiza en el archivo tablero_iur.log (ubicado en el path calidad/tablero/iur/): tablero_iur_log_

•	El proceso SQL tablero_iur_umts_isabhw: tablero_iur_umts_isabhw_

•	Proceso sql para realizar reproceso: tablero_iur_umts_isabhw_rec_


7.	REPROCESO
-------------

El reproceso se realiza de la siguiente manera: 

•	Formato de la fecha: DD.MM.YYYY

Ejemplo de reproceso: 

.. image:: ../_static/images/tablero_iur/pag11.png
  :align: center

8. SMART
--------

Los reportes en la herramienta Smart se muestran de la siguiente manera:

.. image:: ../_static/images/tablero_iur/pag12.png
  :align: center

.. image:: ../_static/images/tablero_iur/pag12.2.png
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
    <td>  19.07.2017 </td>
    <td> Monica Pellegrini </td>
    <td>  </td>
    <td> Se cambia la tabla de amx_load y se apunta a tabla que esta en base de dato cortado. </td>
    <td>  </td>
  </tr>

 </table>