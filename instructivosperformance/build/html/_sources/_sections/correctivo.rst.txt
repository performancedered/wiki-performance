PROCESO CORRECTIVO
==================

1.	OBJETIVO
------------

El objetivo es “Asegurar la disponibilidad en 24 hs de los datos horarios, diarios, semanales y mensuales en la herramienta SMART”.
 
2.	ALCANCE
-----------
Alcanza al equipo de Performance de Red, sus analistas de Datos y analistas de Performance.

3.	DEFINICIONES
----------------

+	Smart: herramienta de performance de red, donde se almacenan datos históricos de las diferentes plataformas integradas.

+	JIRA: herramienta web para registrar y dar seguimiento a tareas.

+	Focal Point: es el Analista de Performance designado durante el Sprint para controlar la ejecución del proceso preventivo y correctivo de Aseguramiento de Datos.

+	Analista de Datos: es la persona designada para realizar los reprocesos durante el Sprint

+	Sprint: período de tiempo actual, normalmente el Sprint tiene 2 semanas de duración

 
4.	MACROFLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/correctivo/pag2.png
  :align: center 

5.	MICROFLUJO DEL PROCESO
--------------------------

6.	PRINCIPALES ACTIVIDADES Y RESPONSABILIDADES
------------------------------------------------

1.  Un Analista de Performance detecta un faltante de datos de alguna plataforma en Smart, ya sea por un reclamo de un usuario final vía telefónica/correo, o durante la construcción de un reporte.

2.  El Analista de Performance  ingresa a JIRA y se fija que no haya una incidencia ya levantada mediante el proceso preventivo de aseguramiento de datos.

3.	Si el evento todavía no está registrado, entonces lo registra completando la siguiente plantilla:

	*	Project: **1688-CLARO SMART – MTM (CMTM)**

	*	Issue Type: **Bug**

	*	Summary: **Faltante de datos – Plataforma NN**

	*	Priority: **Major**

	*	Due Date: **para el día siguiente**

	*	Asignee: **el Focal Point**

Description:

	*	**Nombre Plataforma:** Huawei LTE 

	*	**Síntoma de Falla:** no se observan datos hour entre el día 16/01 y el 17/01

	*	**Reporte Smart / SQL:** Acceso / Huawei / Principales KPI

	*	**Servidor:** cortado.claro.amx

	*	**Tablas:** huawei_interface_hour

	*	**Sumarización:** HOUR

	*	**Fecha Inicio:** 16/01/2017

	*	**Fecha Fin:** 17/01/2018

	*	**Sprint:** asignar al sprint actual

	*	**Epica:** asignar a la epica REPROCESOS


4.  El Focal Point lo revisa y asigna el ticket a un Analista de Datos.

5.	El Analista de Datos realiza el análisis de causa raíz, y da una solución al problema, agregando el siguiente comentario:

	*	**Síntoma de Falla:** ej: no se observan datos hour entre el día 16/01 y el 17/01

	*	**Causa Raíz:** ej: falla del proceso de recolección de datos debido a una falta de espacio en file system, ya que la gente de sistemas utilizó erróneamente el mismo.

	*	**Acciones Tomadas:** ej: se dio aviso a la gente de Sistemas para que deje de escribir por error en el file system, se realizó una depuración del file system, se verificó que los archivos origen se pueden recolectar normalmente

	*	**Pendientes:** ej: crear un correo automático para la utilización del file system que sirva como alerta temprana, registrado mediante ticket jira CMTM-9875

6.  El Analista de Datos asigna el ticket al Focal Point para validación.

7.	El Focal Point valida si la solución fue definitiva o paliativa; en ambos casos debe avisar al cliente final que el tema está solucionado.  Luego debe cerrar el ticket.

 
8.	Si la solución fue paliativa (hay pendientes y no se solucionó la causa raíz) además se debe indicar el nuevo ticket de mejora, el cual deberá ser creado como un requerimiento de mejora:

	*	Project: **1688-CLARO SMART – MTM (CMTM)**

	*	Issue Type: **Requirement**

	*	Summary: **Requerimiento de Mejora – Plataforma NN**

	*	Priority: **Major**

	*	Asignee: **al jefe del área**

	*	Sprint: asignar al **sprint actual**

	*	Epica: asignar a la epica **MEJORAS**

	*	Description: indicar toda la información con la que se cuente para solucionar la causa raíz


9.	El tablero de comandos para este proceso es el siguiente dashboard de jira: **JIRA / Agile / Project 1688-CLARO SMART-MTM / Work.** Donde se observan las tareas: Para Hacer (To Do), en progreso (In Progress) y Finalizadas (Done):

.. image:: ../_static/images/correctivo/pag4.png
  :align: center 

7.	INDICADORES 
---------------

Se utiliza el indicador “Avg. Resolution Time” para controlar el tiempo promedio de resolución de cada tarea.  El objetivo es resolver cada tarea en el plazo de 1 día.

.. image:: ../_static/images/correctivo/pag5.png
  :align: center 

.. image:: ../_static/images/correctivo/pag5.2.png
  :align: center 

.. image:: ../_static/images/correctivo/pag5.3.png
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
    <td> 31/01/2017 </td>
    <td> Marcela Medrano, Matias Stuyck </td>
    <td> - </td>
    <td> Se creo el documento del proceso correctivo detallando los pasos a seguir. versión 1 </td>
    <td> -</td>
  </tr>
  <tr>
    <td> 08/02/2017 </td>
    <td> Matias Stuyck </td>
    <td> - </td>
    <td> Se creo el documento del proceso correctivo detallando los pasos a seguir. versión 2 </td>
    <td> -</td>
  </tr>

 </table>