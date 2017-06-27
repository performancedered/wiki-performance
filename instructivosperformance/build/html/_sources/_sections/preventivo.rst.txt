PROCESO PREVENTIVO
==================

1.	OBJETIVO
------------

El objetivo es “Asegurar la disponibilidad en 24 hs de los datos horarios, diarios, semanales y mensuales en la herramienta SMART” 
 
2.	ALCANCE
-----------

Alcanza al equipo de Performance de Red, sus analistas de Datos y analistas de Performance.

3.	DEFINICIONES
----------------

*	Smart: herramienta de performance de red, donde se almacenan datos históricos de las diferentes plataformas integradas.

*	JIRA: herramienta web para registrar y dar seguimiento a tareas.

*	Focal Point: es el Analista de Performance designado durante el Sprint para controlar la ejecución del proceso preventivo y correctivo de Aseguramiento de Datos.

*	Analista de Datos: es la persona designada en el Sprint para realizar los controles preventivos y los reprocesos durante el Sprint.  

		Los controles preventivos incluyen:

			•	Accesos: GSM/UMTS/LTE (procesos Raw, Hours, Days, Week, BH, IBHW)

			•	Tableros: Diarios, Semanales y Mensuales.

			•	Otros: Core Switch, Core Datos, SVA, Enlaces IP, Proyectos alojados en el Servidor Cortado, etc


*	Sprint: período de tiempo actual, normalmente el Sprint tiene 2 semanas de duración

 
4.	MACROFLUJO DEL PROCESO
--------------------------

.. image:: ../_static/images/preventivo/pag2.bis.png
  :align: center 


5.	MICROFLUJO DEL PROCESO
--------------------------

6.	PRINCIPALES ACTIVIDADES Y RESPONSABILIDADES
-----------------------------------------------

.. _preventivos : ../_static/images/preventivo/listacontrolespreventivos.html

1.	El Analista de datos detecta un faltante de datos de alguna plataforma en Smart, debido a los Controles preventivos Definidos.

**Lista de Controles Preventivos**


**Acceso**


.. raw:: html 

  <table border="2px" width="70%">
  <tr>
    <th scope="col">Grupo</th>
    <th scope="col">Plataforma</th>
    <th scope="col">Base de Datos</th>
  </tr>
 
  <tr>
    <td rowspan="9"></br></br></br></br></br></br></br>Reporte Automaticos por correo</td>
  </tr>
 
  <tr>
    <td>Reporte File System</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Reporte Table Space</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Control XML by RC</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Reporte Nivel Raw</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Reporte Nivel Hour</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Reporte Nivel BH DAY</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Control Snapshot Diario</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Report Status Diario</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td rowspan="5"></br></br></br>Servers: Procesos, CPU y Memoria (HP Performance Manager)</td>
  </tr>
  <tr>
    <td>Perdido (Producción)</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Guerrero (Producción)</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Cortado (Producción)Reporte File System</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Falda (Desarrollo)</td>
    <td>DSmart2</td>
  </tr>
  <tr>
    <td rowspan="10"></br></br></br></br></br></br></br>Acceso</td>
  </tr>
  <tr>
    <td>Nokia LTE</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Nokia UMTS</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Nokia GSM</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Cisco HFC</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Huawei Gpon</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Alcatel LTE Uruguay</td>
    <td>DSmart2</td>
  </tr>
  <tr>
    <td>Alcatel UMTS Femtocell</td>
    <td>DSmart2</td>
  </tr>
  <tr>
    <td>Altiostar Cells</td>
    <td>DSmart2</td>
  </tr>
  <tr>
    <td>Cisco Small Cells</td>
    <td>DSmart2</td>
  </tr>
  <tr>
    <td rowspan="7"></br></br></br></br></br>Tablero</td>
  </tr>
  <tr>
    <td>Mous</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>CPCDD_OPT</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Enacom</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Nqi</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>lur</td>
    <td>Smart</td>
  </tr>
  <tr>
    <td>Umts Radar</td>
    <td>Smart</td>
  </tr>
  
  </table></br>

**Core**


.. raw:: html 

  <table border="2px" width="70%">
    <tr>
      <th scope="col">Grupo</th>
      <th scope="col">Plataforma</th>
      <th scope="col">Base de Datos</th>
    </tr>

    <tr>
      <td rowspan="6"></br></br></br></br>Core</td>
    </tr>
    <tr>
      <td>MSS / MGW / OMGW / HLR</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Oracle STP / DRA</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Tecnotree Prepago</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>IMS (AAA / BGW / CSCF / TAS / iNUM)</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>UDC (HLR / HSS / EIR / OneNDS)</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td rowspan="12"></br></br></br></br></br></br></br></br></br></br>Packet Core</td>
    </tr>
    <tr>
      <td>Cisco GGSN / PGW / SGW</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Firewall</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Nokia SGSN</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Oracle PCRF</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Alcatel MME</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Cisco EPDG / SAMOG</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Cisco NAT CGSE</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Cisco PNR PCP</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>DHCP</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>DNS Viprion / Vantio</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Nokia MME</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td rowspan="4"></br></br>Backbone IP</td>
    </tr>
    <tr>
      <td>Ehealth</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Alcatel IPRAN</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Cisco Prime</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td rowspan="14"></br></br></br></br></br></br></br></br></br></br>VA</td>
    </tr>
    <tr>
      <td>Gemalto</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>NBG</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Roamware</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>SMPLS</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Starhome</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Tecnotree</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>TMM</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>VPN</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>WAP</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>ZTE VoiceMail</td>
      <td>Smart</td>
    </tr>
    <tr>
      <td>Antispamming</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>Ring BackTones</td>
      <td>Smart2</td>
    </tr>
    <tr>
      <td>ZTE MMSC</td>
      <td>Smart2</td>
    </tr>


  </table></br>

**Table Space**


.. image:: ../_static/images/preventivo/tablespace1.png
  :align: center 

.. image:: ../_static/images/preventivo/tablespace2.png
  :align: center 



2.	El Analista de datos ingresa a JIRA y se fija que no haya una incidencia ya levantada para el faltante en cuestión.

3.	Si el evento todavía no está registrado, entonces lo registra completando la siguiente plantilla:

	*	Project: **1688-CLARO SMART – MTM (CMTM)**

	*	Issue Type: **Bug**

	*	Summary: **Faltante de datos – Plataforma NN**

	*	Priority: **Major**

	*	Due Date: **para el día siguiente**

	*	Asignee: **el analista de datos adecuado** 

	*	Sprint: asignar al sprint actual

	*	Epica: asignar a la epica REPROCESOS

	*	Tag: Preventivo

Description:

*	**Nombre Plataforma:** Ej: Huawei LTE 

*	**Síntoma de Falla:** Ej: no se observan datos hour entre el día 16/01 y el 17/01

*	**Reporte Smart / SQL:** Ej: Acceso / Huawei / Principales KPI

*	**Servidor:** Ej: cortado.claro.amx

*	**Tablas:** Ej: huawei_interface_hour

*	**Sumarización:** Ej: HOUR

*	**Fecha Inicio:** Ej: 16/01/2017

*	**Fecha Fin:** Ej: 17/01/2018

4.	El Analista de Datos asignado a la incidencia realiza el análisis de causa raíz, y da una solución al problema, agregando el siguiente comentario:

	*	**Síntoma de Falla:** ej: no se observan datos hour entre el día 16/01 y el 17/01.

	*	**Causa Raíz:** ej: falla del proceso de recolección de datos debido a una falta de espacio en file system, ya que la gente de sistemas utilizó erróneamente el mismo.

	*	**Acciones Tomadas:** ej: se dio aviso a la gente de Sistemas para que deje de escribir por error en el file system, se realizó una depuración del file system, se verificó que los archivos origen se pueden recolectar normalmente

	*	**Pendientes:** ej: crear un correo automático para la utilización del file system que sirva como alerta temprana, registrado mediante ticket jira CMTM-9875


 
5.	El Analista de Datos valida si la solución fue definitiva o paliativa; en ambos casos debe avisar al Focal Point que el tema está solucionado y asignar el ticket para validación.


6.	El Focal Point debe verificar que los datos estén completos y correctos y cerrar el ticket.  En caso que detecte algún impacto o posible impacto sobre otras funcionalidades, debe advertir al analista de datos para su revisión (Ej: algún Tablero)


7.	Si la solución fue paliativa (hay pendientes y no se solucionó la causa raíz) además se debe indicar el nuevo ticket de mejora, el cual deberá ser creado como un requerimiento de mejora:


	*	Project: **1688-CLARO SMART – MTM (CMTM)**

	*	Issue Type: **Requirement**

	*	Summary: **Requerimiento de Mejora – Plataforma NN**

	*	Priority: **Major**

	*	Asignee: **al jefe del área**

	*	Sprint: asignar al **sprint actual**

	*	Epica: asignar a la epica **MEJORAS**

	*	Description: indicar toda la información con la que se cuente para solucionar la causa raíz


8.	El tablero de comandos para este proceso es el siguiente dashboard de jira: **JIRA / Agile / Project 1688-CLARO SMART-MTM / Work.**  Donde se observan las tareas: Para Hacer (To Do), en progreso (In Progress) y Finalizadas (Done):


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
    <td> Se creo el documento del proceso preventivo detallando los pasos a seguir. </td>
    <td> -</td>
  </tr>

 </table>