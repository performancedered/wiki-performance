CGR : TRONCALES INDIVIDUALES Y AGRUPADOS
========================================

1. OBJETIVO
------------

Contar con información en la herramienta Smart sobre el tráfico de los troncales de tráfico individuales y agrupados

2. ALCANCE
-----------

Este documento alcanza al área Performance de Red.

3. DEFINICIONES
----------------

+	MSC: Los MSS son switches o conmutadores que pertenecen a las tecnologías móviles 2G y 3G y se encargan de conmutar las llamadas de voz de ambas tecnologías para todos los usuarios. A demás de esto permite separar la señalización del plano de usuario lo que garantiza una mejor ubicación de los elementos de red.

+	CGR: Son troncales o canales de comunicación q se definen entre los elementos de la red.

+	CGR_GROUP: Troncales agrupados.

+	Perdido: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart.

+	OSS: Servidor propuesto por nokia para la obtencion de informacion.

4. DESCRIPCION GENERAL
-----------------------

Se miden cantidad de paquetes enviados y recibidos, todo a nivel de troncales. A los troncales individuales se los llama CGR, es un componente del core.
Las comunicaciones entre los switches se implementa atraves de los troncales.
Cuando existen muchos switches que estan relacionados, lo que se hace es agrupar los troncales en grupos (Troncales agrupados: CGR_GROUP).

A continuacion se muestran los MSS existentes:

.. image:: ../_static/images/cgr/mss.png
  :align: center

5. MACROFLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/cgr/macroflujo.png
  :align: center


6. DESCRIPCION DETALLADA
-------------------------


6.1 Datos origen
****************

Los datos origen a nivel inicial se toman del OSS.

•	Servidor origen: OSS
•	Frecuencia actualización: Frecuencia Horaria
•	Tablas Origen - Destino:


.. image:: ../_static/images/cgr/tableorigendestino.png
  :align: center

6.2 Datos destino
*****************

•	Server Destino: perdido.claro.amx
•	Conversión de Archivos: No
•	Tabla Auxiliar: Si
•	Frecuencia de corrida del proceso: 1 vez por hora
•	Regionales: No
•	Sumarizacions disponibles segun tablas:

.. image:: ../_static/images/cgr/sumarizaciones.png
  :align: center

•	Directorio Destino (File System): /calidad/msc/cgr/hourly

6.3 Listado de Tablas Utilizadas
********************************


Tablas CGR Individuales
+++++++++++++++++++++++


nokia_msc_cgr_hour

.. image:: ../_static/images/cgr/table1.png
  :align: center 

nokia_msc_cgr_day

.. image:: ../_static/images/cgr/table2.png
  :align: center 

nokia_msc_cgr_bh

.. image:: ../_static/images/cgr/table3.png
  :align: center 

nokia_msc_cgr_bh_week

.. image:: ../_static/images/cgr/table4.png
  :align: center 

Tablas CGR Grupo
++++++++++++++++

nokia_msc_cgr_group_hour

.. image:: ../_static/images/cgr/table5.png
  :align: center 

nokia_msc_cgr_group_day

.. image:: ../_static/images/cgr/table6.png
  :align: center 

nokia_msc_cgr_group_bh

.. image:: ../_static/images/cgr/table7.png
  :align: center 

nokia_msc_cgr_group_bh_week

.. image:: ../_static/images/cgr/table8.png
  :align: center 

nokia_msc_cgr_group_day_mh_obj

.. image:: ../_static/images/cgr/table9.png
  :align: center 


Tablas mk
+++++++++++

nokia_msc_cgr_mk_hour

.. image:: ../_static/images/cgr/table10.png
  :align: center 

nokia_msc_cgr_mk_day

.. image:: ../_static/images/cgr/table11.png
  :align: center 

nokia_msc_cgr_mk_bh

.. image:: ../_static/images/cgr/table12.png
  :align: center 

Tablas Objetos
+++++++++++++

Las tablas objeto se actualizan automaticamente al insertarse un nuevo switch.

core_nsn_objects: Contiene listado de switches.

.. image:: ../_static/images/cgr/table13.png
  :align: center 

NOKIA_OBJECTS_CGR_RELATION: Contiene las relaciones entre todos los troncales individuales(a que grupo pertenecen).

.. image:: ../_static/images/cgr/table14.png
  :align: center


**Ejemplos de consultas SQL:**

Consulta sobre tabla core_nsn_objects:

.. _consulta_core: ../_static/images/cgr/consulta_uno.sql

*	consulta_core_ 

Consulta sobre tabla nokia_msc_cgr_group_day:

.. _consulta_nokia_msc_cgr_group_day: ../_static/images/cgr/consulta_dos.sql

*	consulta_nokia_msc_cgr_group_day_ 

Consulta sobre tabla nokia_msc_cgr_day:

.. _consulta_nokia_msc_cgr_day: ../_static/images/cgr/consulta_tres.sql

*	consulta_nokia_msc_cgr_day_ 

6.4 Shell Copiar Archivos Origen a Destino 
******************************************

El Shell Script nokia_msc_cgr_hour.sh esta croneado para correr una ves por hora.

.. _nokia_msc_cgr_hour.sh: ../_static/images/cgr/nokia_msc_cgr_hour.sh

*	nokia_msc_cgr_hour.sh_ 

Se ingresan los parametros:

+ FECHA_DESDE: DD.MM.YYYY HH24
+ FECHA_HASTA: DD.MM.YYYY HH24

Dentro del Shell Scrip se define la siguiente funcion Main f_Main_Msc_Cgr_Hourly:

.. _f_Main_Msc_Cgr_Hourly: ../_static/images/cgr/f_Main_Msc_Cgr_Hourly.sh

*	f_Main_Msc_Cgr_Hourly_ 

Esta funcion lo que hace es llamar a las siguentes funciones:

.. _f_Msc_Cgr_Hourly: ../_static/images/cgr/f_Msc_Cgr_Hourly

*	f_Msc_Cgr_Hourly_: Se encuentran los procesos sql para llenar las tablas hourly por troncales individuales y por mercado.

.. _f_Msc_Cgr_Group_Hourly: ../_static/images/cgr/f_Msc_Cgr_Group_Hourly

*	f_Msc_Cgr_Group_Hourly_: Se enuentran los procesos sql para agrupar por grupos los troncales.

**Procesos SQL dentro de f_Msc_Cgr_Hourly**

.. _nokia_msc_cgr_hour.sql: ../_static/images/cgr/nokia_msc_cgr_hour.sql

*	nokia_msc_cgr_hour.sql_

.. _nokia_msc_cgr_mk_hour.sql: ../_static/images/cgr/nokia_msc_cgr_mk_hour.sql

*	nokia_msc_cgr_mk_hour.sql_

**Procesos SQL dentro de f_Msc_Cgr_Group_Hourly**

.. _nokia_msc_cgr_group_hour.sql: ../_static/images/cgr/nokia_msc_cgr_group_hour.sql

*	nokia_msc_cgr_group_hour.sql_


7. Reproceso Automático y Manual
*********************************

Para el hour se debe ejecutar el siguiente script:


.. _nokia_msc_cgr_hour_rec.sh: ../_static/images/cgr/nokia_msc_cgr_hour_rec.sh

*	nokia_msc_cgr_hour_rec.sh_

Se ingresan los parametros:

+ FECHA_DESDE: DD.MM.YYYY HH24
+ FECHA_HASTA: DD.MM.YYYY HH24

Para el gruplal se realizan los mismos pasos.

.. _nokia_msc_cgr_group_rec.sh: ../_static/images/cgr/nokia_msc_cgr_group_rec.sh

*	nokia_msc_cgr_group_rec.sh_

8. Reportes de Smart
*********************

La visualización de CGR en la herramienta Smart se realiza desde los siguientes reportes:

Ruta del reporte: Core Switch / MSS / CGR

**Reportes disponibles:**

**CGR Individual Principales KPI Diario / Histórico**

**Diario**

.. image:: ../_static/images/cgr/reporte1.png
  :align: center

**Historico**

.. image:: ../_static/images/cgr/reporte2.png
  :align: center

**CGR Individual Principales KPI(NEW) Diario/ Histórico**

**Diario**

.. image:: ../_static/images/cgr/reporte3.png
  :align: center

**Historico**

.. image:: ../_static/images/cgr/reporte4.png
  :align: center

**CGR Agrupado Principales KPI Diario / Histórico**

**Diario**

.. image:: ../_static/images/cgr/reporte5.png
  :align: center

**Historico**

.. image:: ../_static/images/cgr/reporte6.png
  :align: center


**Huawei CGRs Diario / Histórico**

**Tablero Utilizacion POI Tablero**

.. image:: ../_static/images/cgr/reporte9.png
  :align: center


Describir los KPIs que muestra cada reporte y qué significa
