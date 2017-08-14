
Nokia WIFI (TAS)
===========

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que genera TAS.

2.	ALCANCE 
-----------

Áreas involucradas: Performance de Red

3.	DEFINICIONES
----------------

    • CORTADO: Servidor UNIX en donde se importan los archivos desde el proveedor. El nombre del servidor es cortado.claro.amx y la dirección IP física es 10.105.146.8

4.	DESCRIPCION GENERAL 
-----------------------

Tas es una entidad perteneciente a la red CORE de LTE que junto con otros elementos como el AAA, el CSCF y el iNUM componen lo que se llama el IMS (Subsistema Multimedia IP) y son elementos destinados a manejar información sobre el nuevo servicio que ofrece LTE de VOLTE (Voz sobre LTE). En Claro tenemos por el momento dos TAS, uno en Córdoba y otro en Torcuato.
La integración en SMART se realiza mediante la lectura de archivos XML que provienen del servidor de Netact (NOKIA) y cuyos KPI se encuentran en NETACT Regional Cluster 6 y la web es https://rc6login.rc6.netact.claro.amx/startpage/. 

**ARQUITECTURA IMS**

1. ORGANICACIÓN DE LA ARQUITECTURA

El grupo 3GPP fue el desarrollador de la tecnología 3G basadas en el estándar GSM y GPRS, y definió IMS como parte de su arquitectura de red. El grupo 3GPP2 en tanto, se ha encargado de desarrollar dicha tecnología, basada en estándares CDMA2000 e IS-41, y a sí mismo desarrolla el sistema IMS en sus redes, en función de lo establecido por el grupo 3GPP. Por lo mismo existen dos arquitecturas IMS similares, cada una desarrollada por uno de estos grupos.

La arquitectura genérica del IMS soporta la comunicación entre equipos que utilizan SIP para la señalización y la administración de sesiones, además de los protocolos ‘Diameter’ y Megaco/H.248’ para operaciones y manejo de recursos multimedia respectivamente. Parte fundamental de la arquitectura IMS está compuesta por los servidores de aplicación, quienes se encargan de: invocar los servicios, identificar qué señalización es requerida y de qué forma los servicios interactúan ente sí.

Básicamente está organizada en tres capas:

+ Capa de aplicaciones: contiene las plataformas de servicios (ej.: PoC, SMSC, servicios de localización LBS, servicios de mensajería, servicios de video, etc.).
+ Capa de control: responsable del control de las sesiones, incluyendo su establecimiento. El Soft Switch es el elemento principal en esta capa.
+ Capa de acceso: es la que incluye los diversos medios de acceso a la red, incluyendo interfaces wireless (UMTS, WIFI, GPRS) y cableadas (xDSL, dialup).

En la figura que se presenta a continuación se representa el modelo de capas descrito arriba. Se intenta dejar claro las diferencias entre cada una de las capas mencionadas.

.. image:: ../_static/images/wifi_tas/image42.png
  :align: center

2. COMPONENTES EN DETALLE DE LA ARQUITECTURA

A continuación se representa la arquitectura del IP Multimedia Subsystem tal y como se establece en el estándar del 3GPP. Se muestran las funciones e interfaces más importantes.

.. image:: ../_static/images/wifi_tas/image43.png
  :align: center

.. image:: ../_static/images/wifi_tas/image44.png
  :align: center

2.1. Call Session Control Function (CSCF)

El elemento Serving CSCF gerencia las sesiones SIP y coordina con otros elementos de la red el control de las llamadas/sesiones. El S-CSCF es responsable por las seguientes funciones:

+ Registro SIP – procesa solicitaciones de registro SIP (SIP REGe de datos y condición de suscriptores durante la duración de la sesión de registro;
+ Control de la Sesión – ejecuta el establecimiento de la llamada/sesión, modificación y terminación;
+ Control de Servicio – interactúa con los Servidores de Aplicación (Application Server) para soporte de servicios y aplicaciones;
+ Monitoreo de la llamada y generación de registros de tarifación (billetes);
+ Provee seguridad para la sesión.

El Proxy CSCF es el primer contacto para que un móvil SIP obtenga acceso a la red IMS a partir de una red orientada a paquetes. El elemento P-CSCF:

+ Provee el roteamiento SIP entre los móviles SIP y la red IMS;
+ Ejecuta la política de control definida por la operadora de la red;
+ Coordina con la red de acceso, autorizando el control de recursos y calidad de las llamadas/sesiones (QoS);
+ Adicionalmente, operadores pueden ofrecer localmente servicios controlados por el PCSCF. Para servicios que son ofrecidos por la red IMS de origen ( Home Network ), el PCSCF repasa la señalización SIP para el servidor IMS en la red de origen.


El Interrogating-CSCF es el punto de contacto en la red de un operador para todas las conexiones destinadas a un suscriptor de la red de este operador, o para un suscriptor visitando su 
red.
Pueden existir múltiplos I-CSCF en una red. Las funciones ejecutadas por el I-CSCF son:

+ Designar un S-CSCF para un usuario ejecutando un registro SIP;
+ Rotear una requisición SIP recebida de otra red en dirección al S-CSCF;
+ Obtener del HSS (Home Subscriber Subsystem) la dirección del S-CSCF;
+ Encaminar la requisición SIP o respuesta al S-CSCF determinada en el estagio arriba;
+ Encaminar la requisición SIP o respuesta para la designación óptima del MGW ( Home Control of roamers).
+ Enviar requisiciones/respuestas SIP al I-CSCF en una red de otro operador para designación óptima de un Media Gateway (MGW), para terminación de una llamada en la red pública conmutada (STFC).

Al ejecutar estas funciones citadas arriba, el operador puede usar el I-CSCF u otras técnicas para ocultar la configuración, capacidad y topología de su propia red del mundo externo. Cuando el I-CSCF es escogido para ocultar la configuración de la red, entonces para sesiones cruzando diferentes redes, el I-CSCF puede enviar requisiciones/respuestas SIP para otro I-CSCF (permitiendo la independencia de configuración entre redes).

2.2. Breakout Gateway Control Function (BGCF)

El BGCF selecciona la red en la cual el acceso a la red pública conmutada (STFC) debe ocurrir. Si el BGCF determina que el acceso va a ocurrir en la misma red en donde el BGCF está localizado, entonces el BGCF selecciona un MGCF. El MGCF será responsable por el interfuncionamiento con la red STFC. Si el punto de acceso está en otra red, el BGCF enviará la señalización de esta sesión a un BGCF o MGCF (dependiendo de la configuración) en la otra red. El objetivo final es minimizar el recorrido de la llamada/sesión.

2.3. Multimedia Resource Function Controller (MRFC)

El MFRC controla los recursos de media del elemento MultiMedia Resource Function Processor (MRFP). Por ejemplo, recursos necesarios para proveer tonos, anuncios y conferencia.


5.	MACRO FLUJO DEL PROCESO
---------------------------

.. image:: ../_static/images/wifi_tas/image1.png 
  :align: center 

6.	DESCRIPCIÓN DETALLADA
--------------------------

6.1.	Datos Origen
********************

•	Server Origen y Path: 10.105.39.140, 
    /d/oss/global/var/mediation/north/pm/export/YYYYMMDDHH/etlexpmx_TAS*

•	Cantidad de archivos origen: 5 archivos con distintos contadores cada uno.

    ETLEXPMX_TAS_YYYYMMDDHHMMSS_NÚMERO.xml.gz

.. image:: ../_static/images/wifi_tas/image2.png 
  :align: center 

•	Frecuencia actualización: Frecuencia Horaria
•	Tipo de Archivo: XML


6.2.	Datos Destino
*********************

•   Server Destino: Cortado
•	Conversión de Archivos: NO
•	Tabla Files: SI
•	Tabla Auxiliar: NO
•	Frecuencia de corrida del proceso: 1 vez por hora
•	Regionales: Si
•	RAW Si/No: Si
•	Hour Si/No: Si
•	Day Si/No: Si
•	BH Si/No: Si
•	ISABH Si/No: Si
•	Países: Argentina
•	Directorio Destino (File System): /calidad/NokiaWIFI


6.3.	Shell Copiar Archivos Origen a Destino y limpieza de los mismos
***********************************************************************

Scripts tienen las siguientes funciones:

    a- Copiar los archivos

    b- Limpieza

    c- Ejecutar Pentaho

Los scripts son los siguientes:
El Script NokiaWIFIEndToEnd.sh es la raíz del proceso.

Los Scrips a utilizar son:
•	NokiaWIFIEndToEnd.sh
•	runAll.sh
•	runNokiaWIFI.sh
•	runParserNokiaWIFI.sh
•	syncro_nokiawifi.sh
•	syncro_nokiawifi_object.sh
•	generarCsvAll.sh

6.4.	Listado de Tablas Utilizadas
************************************

Las tablas utilizadas son las siguientes:  

 .. image:: ../_static/images/wifi_tas/image3.png 
   :align: center

• TABLA LTE_C_NOKIA_TAS_HOUR

 .. image:: ../_static/images/wifi_tas/image4.png 
   :align: center

• TABLA LTE_C_NOKIA_TAS_DAY

 .. image:: ../_static/images/wifi_tas/image5.png 
   :align: center

• TABLA LTE_C_NOKIA_TAS_BH

 .. image:: ../_static/images/wifi_tas/image6.png 
   :align: center

• TABLA LTE_C_NOKIA_TAS_IBHW

 .. image:: ../_static/images/wifi_tas/image7.png 
   :align: center

6.5.	Pentaho
***************

 .. image:: ../_static/images/wifi_tas/image8.png 
  :align: center

•	Proceso Pentaho End to End

 .. image:: ../_static/images/wifi_tas/image9.png 
  :align: center

•	Pentaho runParserNokiaWIFI

 .. image:: ../_static/images/wifi_tas/image10.png 
  :align: center

•	Pentaho Get Files

 .. image:: ../_static/images/wifi_tas/image11.png 
  :align: center

•	Pentaho Get FileName & Populate Raw

 .. image:: ../_static/images/wifi_tas/image12.png 
  :align: center

•	Pentaho Update Table Files

 .. image:: ../_static/images/wifi_tas/image13.png 
  :align: center

•	Pentaho Merge Table Hour

 .. image:: ../_static/images/wifi_tas/image14.png 
  :align: center

•	Pentaho InsProcessToRunDAYBH

 .. image:: ../_static/images/wifi_tas/image15.png 
  :align: center

6.6. Controles

.. image:: ../_static/images/wifi_tas/image16.png 
  :align: center

7.	REPROCESO MANUAL
--------------------

PROCESO DE REWORK END TO END

.. image:: ../_static/images/wifi_tas/image17.png 
  :align: center

Ubicación de los scripts en la carpeta: /calidad/NokiaWIFI/Scripts

Ubicación del Rework de ejecución en Pentaho: /calidad/NokiaWIFI/Rework

El formato de fecha para el Rework sería el siguiente:

DDMMYYYYHH24
YYYYMMDDHH24

Por consola se utiliza de la siguiente manera: 

.. image:: ../_static/images/wifi_tas/image18.png 
  :align: center

Donde tenemos tres parámetros:

• RUTA: /calidad/NokiaWIFI/Scripts/NokiaWIFIEndToEndRework.sh
• FECHA_PROC: DDMMYYYYHH24
• HORA_PROC: YYYYMMDDHH24

Ejecutando el siguiente script:

• sh /calidad/NokiaWIFI/Scripts/NokiaWIFIEndToEndRework.sh DDMMYYYYHH24 YYYYMMDDHH24


8.	SMART
---------

Los reportes en la herramienta Smart se muestran de la siguiente manera: 

.. image:: ../_static/images/wifi_tas/image19.png 
  :align: center

.. image:: ../_static/images/wifi_tas/image20.png 
  :align: center

.. image:: ../_static/images/wifi_tas/image21.png 
  :align: center

.. image:: ../_static/images/wifi_tas/image22.png 
  :align: center

.. image:: ../_static/images/wifi_tas/image23.png 
  :align: center

Nota: Los valores mostrados en SMART no deben presentar picos horarios de más del 50% de una hora respecto de la otra.
En SMART se muestran todos los KPI que se pidieron analizar con su nombre correspondiente.


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
    <td> 23/05/2017 </td>
    <td> Franco Rinaldi </td>
    <td> <p><a href="http://jira.harriague.com.ar/jira/browse/CL-740" </a></p>  </td>
    <td> Creacion de documentación de Proyecto.
         <br>Proyecto actual - CORTADO.</br></td>
    <td> Servidor: CORTADO </td>
  </tr>
  </table>