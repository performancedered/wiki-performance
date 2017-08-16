ALTIOSTAR CELLS
================

1. OBJETIVO
------------

El objetivo de este documento es describir el proceso de recollecion de datos de los archivos XML para poder obtener tablas raw de contadores, para poder calcular las sumarizaciones hour, bh, day, ibhw y asi crear las tablas KPIs para luego graficarlos en Smart.

2. ALCANCE
-----------

Areas involucradas: Calidad y Performance de Red.

3. DEFINICIONES
----------------

• Falda: Servidor UNIX en donde se importan los XML desde el proveedor, y en donde se encuentra Smart. El nombre es falda.claro.amx y la direccion fisica es : 10.92.56.198
• Cortado: Servidor LINUX en donde se importan los CSV desde el proveedor. El nombre es cortado.claro.amx y la dirección IP física es 10.105.146.8

4. DESCRIPCION GENERAL
-----------------------

Altiostar es una plataforma de Acceso de tecnología 4G basada en microceldas ubicadas en postes de iluminación que se conectan a un nodo ubicado en un NOC a través de fibra óptica. Estas celdas permiten dar cobertura en áreas pequeñas con gran volumen de tráfico apoyando la red Macro.

La integración a SMART de esta plataforma consiste en recolectar archivos XML de la plataforma EMS, procesarlos para obtener las tablas raw de contadores, y a partir de estas crear tablas de KPIs para las distintas sumarizaciones, para luego mostrar la información gráficamente en SMART

Se divide el proyecto en dos partes, una que se encarga de ejecutar el parser y cargar las tablas raw y hour, luego realiza un insert sobre la segunda parte del proyecto para automatizarlo, en la segunda parte se realizan las sumarizaciones y se cargan las tablas BH, DAY e IBHW.

5. MACROFLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/altiostarcells/macroflujo.png
  :align: center

6. DESCRIPCION DETALLADA
-------------------------

6.1 Datos origen
****************

• Server Origen y Path: 10.231.88.2 , /stats/3gpp
• Cantidad de archivos origen: 5 a 8 archivos

A20170815.0845-0300-20170815.0900-0300_SubNetwork=ANIEMS

• Frecuencia actualización: Frecuencia Horaria
• Tipo de Archivo: XML

6.2 Datos destino
*****************

• Server Destino: cortado.claro.amx
• Conversión de Archivos: No
• Tabla Auxiliar: Si
• Frecuencia de corrida del proceso: 1 vez por hora
• Regionales: No
• RAW Si/No: Si
• Hour Si/No: Si
• Day Si/No: Si
• BH Si/No: Si
• IBHW Si/No: Si
• Países: No
• Directorio Destino (File System): /calidad/Altiostar

6.3. Shell Copiar Archivos Origen a Destino y limpieza de los mismo
********************************************************************

Scripts tienen las siguientes funciones:

+ a) Copiar los archivos

+ b) Limpieza

+ c) Ejecutar Pentaho

Los scripts son los siguientes: runAltiostar.sh es la raíz del proceso.

El path donde se encuentran los scripts en cortado es : 

/calidad/Altiostar/Scripts

Los Scrips a utilizar son: 

.. image:: ../_static/images/altiostarcells/image20.png 
  :align: center

.. _runAltiostar.sh: ../_static/images/altiostarcells/runAltiostar.sh

.. _runAltiostarEndtoEnd.sh: ../_static/images/altiostarcells/runAltiostarEndtoEnd.sh

* runAltiostar.sh_

* runAltiostarEndtoEnd.sh_

6.4 Listado de Tablas Utilizadas
********************************
**Las tablas utilizadas son las siguientes:**

- LTE_C_ALTIOSTAR_CELL_RAW
- LTE_C_ALTIOSTAR_CELL_HOUR
- LTE_C_ALTIOSTAR_CELL_DAY
- LTE_C_ALTIOSTAR_CELL_BH
- LTE_C_ALTIOSTAR_CELL_DIC
- CONTROL_FILES
 
 A continuacion se muestra el listado de campos de las tablas: 

+ LTE_C_ALTIOSTAR_CELL_RAW

.. image:: ../_static/images/altiostarcells/image1.png
  :align: center

.. image:: ../_static/images/altiostarcells/image2.png
  :align: center

Al ser tan extensa la lista de campos de la tabla raw se adjuntaron dos imagenes, el inicio y el final de los campos.

+ LTE_C_ALTIOSTAR_CELL_HOUR

.. image:: ../_static/images/altiostarcells/image3.png
  :align: center

.. image:: ../_static/images/altiostarcells/image4.png
  :align: center


+ LTE_C_ALTIOSTAR_CELL_DAY

.. image:: ../_static/images/altiostarcells/image5.png
  :align: center

.. image:: ../_static/images/altiostarcells/image6.png
  :align: center

+ LTE_C_ALTIOSTAR_CELL_BH

.. image:: ../_static/images/altiostarcells/image7.png
  :align: center

.. image:: ../_static/images/altiostarcells/image8.png
  :align: center

+ LTE_C_ALTIOSTAR_CELL_DIC

.. image:: ../_static/images/altiostarcells/image9.png
  :align: center

+ CONTROL_FILES

.. image:: ../_static/images/altiostarcells/image10.png
  :align: center

6.5. Pentaho
*************

+ Estructura del proyecto:

.. image:: ../_static/images/altiostarcells/image13.png
  :align: center

+ Pentaho AliostarEndtoEnd

.. image:: ../_static/images/altiostarcells/macroflujo.png
  :align: center

+ Pentaho Set Variables 

Dentro de Set Variables se levantan las variables

.. image:: ../_static/images/altiostarcells/image14.png
  :align: center

+ En Write To Log se corta el proceso en caso de tener un error, en Execute JAR se corre el parser para cargar las tablas raw, en Ins. Process To Run DAY & BH se realiza un insert para ejecutar automáticamente el proceso de sumarizacion de las tablas BH, DAY e IBHW

.. image:: ../_static/images/altiostarcells/image15.png
  :align: center

+ Pentaho SumALIOSTAR_BH_DAY_IBHWEndToEnd

.. image:: ../_static/images/altiostarcells/image16.png
  :align: center

Dentro de Calc Sum BH, DAY, IBHW, se divide en Get P_FECHA Variable se levanta una variable que viene por parámetro y call G_LTE_ALTIOSTAR. P_SUM_DAY_BH_IBHW_ALTIOSTAR llama a un procedimiento de la base de datos con el procedimiento P_SUM_DAY_BH_IBHW_ALTIOSTAR

.. image:: ../_static/images/altiostarcells/image17.png
  :align: center

Dentro de Set REGEXP variable se levantan variables que vienen por parámetro

.. image:: ../_static/images/altiostarcells/image18.png
  :align: center

Y dentro de Up process to Run ,se divide en Get Variables que se levantan variables que vienen por parámetros y en Update PROCESS_TO_RUN Table se llama a un proceso create_G_LTE_CELL_ALTIOSTAR_body

.. image:: ../_static/images/altiostarcells/image19.png
  :align: center

6.6. Controles 
***************

Actualmente este control se realiza mediante la tabla CONTROL_FILES que controla la diferencia de cantidad de registros que se insertaron en la tabla raw con la cantidad de registros que se procesaron en el parser.
 	
7. Reproceso Manual
-------------------

Para realizar el reproceso se debe ejecutar el script runAltiostarReworkEndToEnd.sh con la fecha que se desea reprocesar con el formato YYYYMMDD.HH24 (EJ:20170813.12)

.. _runAltiostarReworkEndtoEnd.sh: ../_static/images/altiostarcells/runAltiostarReworkEndtoEnd.sh

* runAltiostarReworkEndtoEnd.sh_

.. image:: ../_static/images/altiostarcells/image11.png
  :align: center

En delete RAW-HOUR-DAY-BH-IBHW se borran los datos anteriores para volver a cargar los datos del reproceso.

8. Reportes de Smart
---------------------

Los reportes en la herramienta Smart se muestran de la siguiente manera:

.. image:: ../_static/images/altiostarcells/image12.png
  :align: center

