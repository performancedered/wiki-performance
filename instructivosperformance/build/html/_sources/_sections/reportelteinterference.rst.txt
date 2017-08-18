Reporte LTE Interference
========================

OBJETIVO 
--------

-	Tener un listado de las celdas con problema de interferencia y mantener un histórico de la evolución de las mismas semana a semana 

ALCANCE
--------

-	Celdas lte en comercial
-	Datos ISABW
-	Áreas involucradas: Performance de Red – Gerencia  

DEFINICIONES
--------------

•	Celda Interferida: Una celda está interferida cuando sus valores de SINR y RSSI cumplen la siguiente condición: RSSI PUCCH < -95dBm y SINR PUCCH < 5
•	SINR (Signal to noise ratio): Relación señal Ruido, se define como la proporción existente entre la potencia de la señal que se transmite y la potencia del ruido que la corrompe.
•	RSSI (Received Signal Strength Indication): es una escala de referencia (en relación a 1 mW) para medir el nivel de potencia de la señal recibida

DESCRIPCIÓN GENERAL
------------------

Este tablero mantiene un histórico de las celdas y su estado ante interferencias
Para identificar si una celda esta interferida se toma de la medición de nokia LTE M8005 los valores de RSSI y SINR y se evalúa la condición RSSI  > -95dBm y SINR  < 5 (buen nivel de señal y alta taza de ruido).
El tablero muestra celda por celda su valor de interferencia semanal (Isabw) con el objetivo de analizar su evolución ante ajustes realizados. Los datos se presentaran en Smart indicando por un lado cantidad de Sitios con interferencia y por otro lado la apertura indicando que sectores específicamente están con interferencia.  

 
ORIGEN DE DATOS
---------------

Tabla de datos **LTE_NSN_PAQ_NE_IBHW** en DB Smart2 de cortado.claro.amx

Tabla de objetos **OBJECTS_SP_LTE** en DB Smart2 de cortado.claro.amx

Tabla parámetros físicos de los objetos **OBJECTS_NSN_LNCEL_AUX** en DB Willy de perido.claro.amx

ESTRUCTURA DEL TABLERO
---------------------
 	
El tablero se almacena en la tabla TABLERO_LTE_INTERFERENCE 


============  ==================  ==============  ==============
Name   		  Type                Nullable		   Comments
============  ==================  ==============  ==============
FECHA  DATE   DATE 								  Fecha ISABW 
LNCEL_NAME    VARCHAR2(300)    					  Nombre de celda
LNCEL_NAME    VARCHAR2(10)						  Nombre del Sitio
LNCEL_ID      NUMBER							  id de celda
LNBTS_ID	  NUMBER							  id de sitio
OSSRC         VARCHAR2(10 CHAR)					  Regional Clúster
BANDA         VARCHAR2(60)        Y 			  Banda de Frecuencia
PAIS          VARCHAR2(10)        Y 			  País
RSSIPUSCHAVG  NUMBER              Y 			  Potencia de Señal
SINRPUSCHAVG  NUMBER              Y 			  Relacion Señal Ruido
INTERFERIDO   NUMBER              Y 			  1 - Interferido / 0 - No interferido
RANSHARIN     VARCHAR2(5)         Y 			  Propietario de la Portadora
============  ==================  ==============  ==============

.. _CrearTablero.sql: ../_static/images/reportelteinterference/CrearTablero.sql

• CrearTablero.sql_

CONSULTAS SQL
------------

**Procedimiento de Carga del tablero**

PROCEDURE p_lte_interferencia(FECHA_DESDE in char,FECHA_HASTA in char)

Parametros de entrada

-	FECHA_DESDE: “DD.MM.YYYY”
-	FECHA_HASTA: “DD.MM.YYYY”

**Paquete**

.. _G_LTE_INTERFERENCE.spc: ../_static/images/reportelteinterference/G_LTE_INTERFERENCE.spc

• G_LTE_INTERFERENCE.spc_

.. _G_LTE_INTERFERENCE.bdy: ../_static/images/reportelteinterference/G_LTE_INTERFERENCE.bdy

• G_LTE_INTERFERENCE.bdy_

**Consulta Reporte**

Histograma cantidad de sitios interferidas

::

	SELECT DISTINCT FECHA, BANDA, PAIS, LNBTS_NAME, RSSIPUSCHAVG, SINRPUSCHAVG,         RANSHARING PORTADORA 
		FROM   Tablero_LTE_interference
		WHERE  interferido=1
		AND FECHA BETWEEN trunc(add_months(to_date('&fecha1', 'DD.MM.YYYY'),-14),'D') and to_date('&fecha2', 'DD.MM.YYYY')
		ORDER BY 1


Apertura celdas última semana

::

	SELECT FECHA, LNCEL_NAME, LNBTS_NAME, RSSIPUSCHAVG, SINRPUSCHAVG FROM  Tablero_LTE_interference 
		WHERE  interferido=1
		AND Fecha=Trunc(to_date('&fecha1', 'DD.MM.YYYY'),'D')
		ORDER BY 1

PROCESO PENTAHO 
--------------

+ Estructura del proyecto

.. image:: ../_static/images/reportelteinterference/image2.png
  :align: center

Carga de datos al tablero

Variable HOME: 

Parámetros de entrada: FECHA (DD.MM.YYYY)

+ Pentaho LTEInterferenceEntToEnd

.. image:: ../_static/images/reportelteinterference/image1.png
  :align: center

+ Pentaho SetPropeties

.. image:: ../_static/images/reportelteinterference/image3.png
  :align: center

+ Pentaho CrearInforme

.. image:: ../_static/images/reportelteinterference/image4.png
  :align: center

+ Pentaho SelectFile Log

.. image:: ../_static/images/reportelteinterference/image5.png
  :align: center

+ Pentaho Seleccionar Archivo

.. image:: ../_static/images/reportelteinterference/image6.png
  :align: center

+ Pentaho cargaDeDatosTableroEndToEnd

.. image:: ../_static/images/reportelteinterference/image7.png
  :align: center


Reporte LTE Interference Wnn

Variable HOME: 

Parámetros de entrada: FECHA (DD.MM.YYYY)

   FECHA_REPORTE (YYYY-MM-DD)

PRESENTACION
------------

Se envía por Email y se consulta desde Smart
El Reporte LTE Interference se envía los lunes a las 9 am a performancedered@claro.com.ar pvirgolini@claro.com.ar 

Adjunto: 

.. _ReporteLTEInterferenceW32_2017: ../_static/images/reportelteinterference/ReporteLTEInterferenceW32_2017.xlsx

• ReporteLTEInterferenceW32_2017_
