INSTRUCTIVO DASHBOARD MICROSTRATEGY
===================================

1.	OBJETIVO
------------

El presente documento busca explicar detalladamente la utilización de la herramienta microstrategy para crear un documento. 

2.	DEFINICIONES 
----------------
+	Dashboard: Es un reporte, presentado en excel cada 15 días a las diferentes áreas de la empresa (BBIP, IPRAN, PACO, RF, etc), mostrando a cada una, los desvíos y datos referidos a cada una de sus plataformas.

3.	INSTRUCCIONES OPERATIVAS
----------------------------

Para realizar el instructivo de MircroStrategy se necesita tener acceso a la siguiente URL: http://microstrategy.claro.amx:5003/MicroStrategy

Al ingresar a la URL se debe ingresar el usuario y contraseña: 

.. image:: ../_static/images/instructivo-micro/pag3.png
  :align: center

Se debe hacer clic en “Claro Ingeniería”: 

.. image:: ../_static/images/instructivo-micro/pag4.png
  :align: center

Se debe hacer clic en el botón “Continuar”:

.. image:: ../_static/images/instructivo-micro/pag4.2.png
  :align: center

a. Organización de carpetas 
...........................

.. image:: ../_static/images/instructivo-micro/pag4bis.png
  :align: center

Dentro de cada jefatura se encuentran: 

• Queries

• Dashboard

• Informes

.. image:: ../_static/images/instructivo-micro/pag5bis1.png
  :align: center


.. image:: ../_static/images/instructivo-micro/pag5bis2.png
  :align: center

.. image:: ../_static/images/instructivo-micro/pag5bis3.png
  :align: center


4.	CREACIÓN DEL DOCUMENTO
--------------------------

a.	Importación de datos 
........................

Se debe hacer clic en “Importar Datos": 

.. image:: ../_static/images/instructivo-micro/pag4.3.png
  :align: center

Se debe elegir la opción “Definido por el usuario” : 

.. image:: ../_static/images/instructivo-micro/pag5.png
  :align: center

Se debe seleccionar el Servidor en el cual se ejecutara la querie: 


.. image:: ../_static/images/instructivo-micro/pag5.2.png
  :align: center

Al seleccionar el servidor, se debe crear la querie: 


.. image:: ../_static/images/instructivo-micro/pag6.png
  :align: center

Al crear la querie y seleccionar el servidor que va a utilizar, se debe hacer clic en el botón  “Continuar”:


.. image:: ../_static/images/instructivo-micro/pag6.2.png
  :align: center

Luego se debe ingresar el nombre y la ubicación con la cual se guardara la querie, haciendo clic en el botón “Aceptar”:  

.. image:: ../_static/images/instructivo-micro/pag7.png
  :align: center

Cuando la querie fue guardada con éxito, muestra el siguiente mensaje: 

.. image:: ../_static/images/instructivo-micro/pag7.2.png
  :align: center

b.	Crear Dashboard
...................

Se debe hacer clic en “Nuevo Documento”: 

.. image:: ../_static/images/instructivo-micro/pag8.png
  :align: center

Para crear un nuevo documento, hacemos clic en “Nuevo Documento”: 

.. image:: ../_static/images/instructivo-micro/pag8.2.png
  :align: center

Al crear el nuevo documento, nos muestra el formato en que se creara el reporte: 

.. image:: ../_static/images/instructivo-micro/pag9.png
  :align: center


Al agregar datos, el reporte toma la siguiente forma:

•	Documento en “Modo Diseño”, se utiliza para armar el reporte con las filas y columnas que se van a utilizar.

.. image:: ../_static/images/instructivo-micro/pag9.2.png
  :align: center

•	Documento en “Modo interactivo”, nos muestra el reporte con su diseño pero no permite ser editado.

.. image:: ../_static/images/instructivo-micro/pag10.png
  :align: center


•	Documento en “Modo editable”, nos muestra el reporte diseñado, se pueden editar los datos 

.. image:: ../_static/images/instructivo-micro/pag10.2.png
  :align: center

Una vez armado el reporte se hace clic sobre el botón “Guardar”: 

.. image:: ../_static/images/instructivo-micro/pag11.png
  :align: center


Luego se debe ingresar el nombre del documento y la ubicación con la cual se guardara el documento, hacer clic en el botón “Aceptar”: 

.. image:: ../_static/images/instructivo-micro/pag11.2.png
  :align: center

El documento fue guardado con éxito, mostrando el siguiente mensaje: 

.. image:: ../_static/images/instructivo-micro/pag12.png
  :align: center

c.	Modificación de querie
..........................

En caso de modificar una querie que ya ha sido creada, se deben seguir los siguientes pasos: 
Ingresar a la carpeta “Informes Compartidos”:


.. image:: ../_static/images/instructivo-micro/pag12.2.png
  :align: center

A modo de ejemplo, tomamos la querie “ZTE”

.. image:: ../_static/images/instructivo-micro/pag13.png
  :align: center

Sobre la querie se debe hacer clic derecho --> Modificar

.. image:: ../_static/images/instructivo-micro/pag13.3.png
  :align: center

Nos muestra la querie que deseamos modificar: 

.. image:: ../_static/images/instructivo-micro/pag14.png
  :align: center

Modificamos la querie y luego hacer clic sobre el botón “play” para que  muestre el resultado que ha cambiado:

.. image:: ../_static/images/instructivo-micro/pag14.2.png
  :align: center

Hacer clic sobre el botón “Continuar”: 

.. image:: ../_static/images/instructivo-micro/pag15.png
  :align: center


En pantalla nos muestra: 

.. image:: ../_static/images/instructivo-micro/pag15.2.png
  :align: center

.. image:: ../_static/images/instructivo-micro/pag16.png
  :align: center

La querie fue actualizada con éxito, mostrando el siguiente mensaje: 

.. image:: ../_static/images/instructivo-micro/pag16.2.png
  :align: center

d. Ejecución de la querie
.........................

Para que el reporte dashboard sea actualizado cada semana, se realiza de la siguiente manera:  

Ingresar a la carpeta “Informes Compartidos”

.. image:: ../_static/images/instructivo-micro/pag19.png
  :align: center

Ingresar a la carpeta “Dashboard Acceso”

.. image:: ../_static/images/instructivo-micro/pag19.2.png
  :align: center

A modo de ejemplo, tomamos la querie “BSC_APERTURA CPU LOAD”

.. image:: ../_static/images/instructivo-micro/pag20.png
  :align: center

Sobre la querie se debe hacer clic derecho --> Publicar Nuevamente

.. image:: ../_static/images/instructivo-micro/pag20.2.png
  :align: center

.. image:: ../_static/images/instructivo-micro/pag21.png
  :align: center

Cuando la solicitud fue actualizada con éxito, muestra el siguiente mensaje: 

.. image:: ../_static/images/instructivo-micro/pag21.2.png
  :align: center

e. Ejecución Automática de la querie 
...................................

Para que el reporte dashboard sea ejecutado automáticamente, se realiza de la siguiente manera: 

Debe ingresar a la carpeta donde se encuentran los dashboard, como por ejemplo  DASHBOARD IPRAN 

.. image:: ../_static/images/instructivo-micro/pag22.png
  :align: center

Luego ingresar a las carpeta de las consultas,  por ejemplo  --> CONSULTAS IPRAN

.. image:: ../_static/images/instructivo-micro/pag22.2.png
  :align: center

Luego elegimos la querie que necesitamos actualizar automáticamente, por ejemplo --> IPRAN-CABECERO LAGS

.. image:: ../_static/images/instructivo-micro/pag23.png
  :align: center

Luego se debe hacer clic en --> Agregar suscripción de listas de historiales 

.. image:: ../_static/images/instructivo-micro/pag23.2.png
  :align: center

En pantalla nos muestran los siguientes datos: 

.. image:: ../_static/images/instructivo-micro/pag23.3.png
  :align: center

Se debe modificar la planificación, seleccionando --> 950- Ingeniería 

.. image:: ../_static/images/instructivo-micro/pag24.png
  :align: center

Luego de seleccionar la opción del paso anterior se debe hacer clic en el botón –> Aceptar

.. image:: ../_static/images/instructivo-micro/pag24.2.png
  :align: center

En pantalla nos muestra el siguiente mensaje de confirmación: 

.. image:: ../_static/images/instructivo-micro/pag24.3.png
  :align: center

Se debe hacer clic en el botón –>“Aceptar” 
En pantalla nos muestra que la consulta será ejecutada automáticamente todos los días: 

.. image:: ../_static/images/instructivo-micro/pag25.png
  :align: center