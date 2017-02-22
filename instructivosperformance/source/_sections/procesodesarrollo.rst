
PROCESO DE DESARROLLO
=====================

El proceso de desarrollo debe tener el siguiente formato:

.. raw:: html

	<table width="972">
	<tbody>
	<tr>
	<td width="255">EPICA</td>
	<td width="451">Crear Proyecto en Jira y generar los requerimientos definidos en el apartado 2</td>
	<td width="135">Jefe Area, Manager Desa.</td>
	<td width="615">El Proceso de Desarrollo inicia con la creacion de la epica y de todas las actividades en estado abierto.&nbsp;</td>
	</table>
	<br><br><br> 

.. raw:: html 

	<style type="text/css">
    table {
       border:2px solid grey;
       border-collapse:separate;
       font-size:small;
       }
    th, td {
       border:1px solid grey;
       padding:10px;
       }
  	</style>

	<table width="972">
	<tbody>
	<tr>
	<td width="255"><h4><strong>Epica</strong></h></td>
	<td width="451"><h4><strong>Nombre de las actividad dentro de la EPICA (PROYECTO)</strong></h4></td>
	<td width="135"><h4><strong>Referente</strong></h4></td>
	<td width="615"><h4><strong>Detalle</strong></h4></td>
	<td width="255"><h4><strong>Estandar</strong></h></td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>&nbsp;Nombre de Proyecto + Crear documento requerimientos</td>
	<td>Analista</td>
	<td width="615">Se debera completar el template de requerimientos definido con los datos del proyecto. Debera incluir la definicion de la tabla Objetos y los graficos que se deben Implementar en SMART.</td>
	<td>Link al template de Requerimientos</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>&nbsp;Nombre de Proyecto +Parsear y llenar tabla RAW&nbsp;</td>
	<td>Desarrollador</td>
	<td width="615">Se debera implementar el Parseador JAVA con la estructura definida. <br /> Puede ocurrir que los datos de origen sean a nivel horario en cuyo caso no se debera realizar Parser. La tarea debera ser finalizada, agregando el detalle correspondiente.</td>
	<td>Link al Metodo Generico.</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>Nombre de Proyecto + Crear Sumarizaciones</td>
	<td>Desarrollador</td>
	<td width="615">Las particularidades a tener en cuenta para las sumarizaciones deben estar especificadas en el documento de requerimientos, como por ejemplo, para el calculo de la BH, que columna/s, se deben tomar en cuenta para esto.<br /> La IBHW es el promedio de los tres picos de la BH. (la fecha corresponde al 1er dia de la semana involucrada - domingo)</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>&nbsp;Nombre de Proyecto + Crear tabla objetos</td>
	<td>Desarrollador</td>
	<td width="615">El desarrollador debera ejecutar esta tarea siempre que el requerimiento est&eacute; especificado en el documento de requerimientos.<br /> Si el requerimiento no esta especificado por el analista, el desarrollador debera cancelar esta tarea con la descripcion correspondiente.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>&nbsp;Nombre de Proyecto + Implementar actividades de limpieza de Datos Ad-hoc</td>
	<td>Desarrollador</td>
	<td width="615">El desarrollador debera Verificar si la politica general de limpieza de datos implementada cubre las necesidades del proyecto.<br /> El desarrollador debera Verificar que toda la configuracion necesaria para la inclusion del proyecto en la politica general esta completa y funcionando adecuadamente.<br /> Solo debera implementarse este requerimiento en caso que, por las caracteristicas del proyecto (volumnen de datos, etc.), se requiera un borrado ad-hoc. <br /> En caso de no ser necesario un proceso Ad-hoc, se debe cancelar la tarea, con la descripcion correspondiente.</td>
	<td width="255">&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td width="451">&nbsp;Nombre de Proyecto + Implementar&nbsp; Controles Basicos (RAW-HOUR-BH - DAY -IBHW)<br /> &nbsp;* Sub-task: Actualizar el Tablero de Performance de red.</td>
	<td>Desarrollador</td>
	<td width="615">En este apartado se deberan crear los procesos de control basicos del Proyecto. Por el momento se definen como niveles basicos los siguientes:<br /> - Raw: El sistema actualmente utiliza la tabla File para controlar que el total de filas por archivo a copiar sea igual a la cantidad de filas insertadas.<br /> Existe una columna Status que puede tener valor&nbsp; 0 (Ok), 1 (Error) , o 5 (listo para porcesar). <br /> El control a realizar, es: Verificar para cada archivo del proyecto que los valores sean = 0. <br /> Si el valor es distinto de 0, indica que hay un error.<br /> - HOUR:&nbsp; Valor referencia: cantidad de objetos ACTIVOS en la tabla Objects, por hora.<br /> El control a realizar consiste en: verificar que la cantidad de objetos que tengo en la tabla Hour por hora coincide con el valor de referencia, con un margen del +/- 10%. (salvo que se defina lo contrario por el Negocio)<br /> - BH: La BH se controla siempre a dia vencido. Metrica: Pico o valor mas alto que muestra un objeto determinado para el dia de referencia.<br /> La BH debe tener tantas filas como equipos ACTIVOS tengo en la Objects para el dia en cuestion.<br /> - DAY: Debo tener tantas filas como objetos ACTIVOS en la tabla Objects existan para el dia en cuestion.<br /> - IBHW: Debo tener tantas filas como objetos ACTIVOS en la tabla Objects existan para la semana en cuestion.<br /> <br /> RESULTADO:<br /> ** RAW: Debera mostrar el valor "ERROR -AA:MM:DD:HH:MM" y guardarlo en un historico durante 3 meses, y ademas debera permitir ver el detalle de la falla.<br /> ** HOUR:&nbsp; Debera mostrar el valor "ERROR -AA:MM:DD:HH:MM" y guardarlo en un historico durante 3 meses, y ademas debera permitir ver el detalle de la falla.<br /> ** BH:&nbsp; Debera mostrar el valor "ERROR -AA:MM:DD:HH:MM" y guardarlo en un historico durante 3 meses, y ademas debera permitir ver el detalle de la falla.<br /> ** DAY:&nbsp; Debera mostrar el valor "ERROR -AA:MM:DD:HH:MM" y guardarlo en un historico durante 3 meses, y ademas debera permitir ver el detalle de la falla.<br /> ** IBHW:&nbsp; Debera mostrar el valor "ERROR -AA:MM:DD:HH:MM" y guardarlo en un historico durante 3 meses, y ademas debera permitir ver el detalle de la falla.<br /> <br /> SUB-TASK: Tablero Performance de red.<br /> El desarrollador debera actualizar la aplicacion "Tablero Performance de Red" con los cotroles correspondientes al nuevo proyecto.<br /> </td>
	<td width="255">Esta info podra ser mostrada en el TABLERO PERFORMANCE DE RED.</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td width="451">&nbsp;Nombre de Proyecto + Definir e Implementar&nbsp; de Controles Ad-hoc<br /> *&nbsp; Sub-task: Actualizar el Tablero de Performance de red</td>
	<td>Analista/Desarrollador</td>
	<td width="615">Para implementar controles Ad-hoc en los proyectos, el analista debera identificar los elementos a controlar, como asi tambien los umbrales. Esta definicion debe ser agregada en el documento de requerimientos y luego el desarrollador debera implementarlas.<br /> <br /> SUB-TASK: Tablero Performance de red.<br /> El desarrollador debera actualizar la aplicacion "Tablero Performance de Red" con los cotroles correspondientes al nuevo proyecto.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td width="451">&nbsp;Nombre de Proyecto + Crear proceso recupero de datos (Reproceso):<br /> &nbsp;* Sub-task: Actualizar el Tablero de Performance de red.</td>
	<td>Desarrollador</td>
	<td width="615">En todos los casos, el desarrollador debera desarrollar, implementar y especificar cual es el metodo de reproceso o recupero de datos para el caso de fallas del proceso original y/&uacute; otras fallas que impliquen que los datos origen ya sean crudos o de sumarizaciones no se encuentren completos.<br /> <br /> SUB-TASK: Tablero Performance de red.<br /> El desarrollador debera actualizar la aplicacion "Tablero Performance de Red" con los cotroles correspondientes al nuevo proyecto.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>Nombre de Proyecto + Graficos en Smart</td>
	<td>Desarrollador SMART</td>
	<td width="615">Los graficos de Smart se desarrollan en el unico entorno web actual. Se apuntan a Falda para la etapa de validacion y luego cuando el proyecto se deploya en Produccion, se deberan apuntar los graficos al entorno productivo.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>Nombre de Proyecto + Validación KPIs</td>
	<td>Analista</td>
	<td width="615">El referente de Performance de red sera el responsable de validar los valores&nbsp; mostrados en SMART y/o la herramienta de visualizacion correspondiente.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>Nombre de Proyecto + Armar paquete de Instalación</td>
	<td>Desarrollador</td>
	<td width="615">El responsable de desarrollo debera armar el paquete de instalacion de acuerdo a la template definida.<br /> Debera ademas colocar un backup en el directorio publico: \\corpsaba-usr\SHARE\Engineer\ProyectosBackup, creando una carpeta conel nombre del proyecto.<br /> Dentro de esta carpeta se creara otra con la fecha del armado del paquete y se colocara el mismo.</td>
	<td>Link al template del paquete de instalacion.</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>Nombre de Proyecto + Validaci&oacute;n de Negocio</td>
	<td>Tecnico Referente</td>
	<td width="615">El referente designado debera correr el checklist y verificar su completitud.<br /> El check list verificado debe ser adjuntado en el ticket.<br /> El referente tecnico debera asignar la epica al referente de produccion para su pasaje en estado "FALDA"</td>
	<td width="255">Link al template de Validacion</td>
	</tr>
	<tr>
	<td>REQ</h></td>
	<td>&nbsp;Nombre de Proyecto + Implementar en Produccion</td>
	<td>Referente de Produccion</td>
	<td width="615">El responsable del pasaje a Producci&oacute;n deber&aacute; realizar el pasaje a Producci&oacute;n previo correr el check list de validacion de Pasaje a Produccion:<br /> Una vez finalizado el mismo, deber&aacute;:<br /> a. Realizar el pasaje a Produccion. <br /> b. Adjuntar el check-list de validaci&oacute;n completo a la &eacute;pica.<br /> b. Agregar detalle del resultado del Proceso en el campo comentarios de la &Eacute;pica.<br /> c. Notificar al Documentador la finalizaci&oacute;n del pasaje a Producci&oacute;n.<br /> d. Asignar la &Eacute;pica al Analista referente y colocar la &Eacute;pica en estado &ldquo;CORTADO&rdquo;.</td>
	<td width="255">Link al template de validacion de Pasaje a Produccion</td>
	</tr>
	<tr>
	<td>DOC</h></td>
	<td>Nombre de Proyecto + Documentacion en Wiki</td>
	<td>Analista Documentador</td>
	<td width="615">Cada Proyecto debe ser documentado en la wiki, en la seccion PROYECTOS, y debe contar con los siguientes apartados:<br /> &nbsp;&nbsp;&nbsp; 1. OBJETIVO<br /> &nbsp;&nbsp;&nbsp; 2. ALCANCE<br /> &nbsp;&nbsp;&nbsp; 3. DEFINICIONES<br /> &nbsp;&nbsp;&nbsp; 4. DESCRIPCION GENERAL<br /> &nbsp;&nbsp;&nbsp; 5. MACRO FLUJO DEL PROCESO<br /> &nbsp;&nbsp;&nbsp; 6. DESCRIPCION DETALLADA<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.1. Datos Origen<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.2. Datos Destino<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.3. Shell Copiar Archivos Origen a Destino y limpieza de los mismos<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.4. Listado de Tablas Utilizadas<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.5. Pentaho<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.6. Controles (aqui especificar detalle de los controles que se realizan)<br /> &nbsp;&nbsp;&nbsp; 7. REPROCESO MANUAL<br /> &nbsp;&nbsp;&nbsp; 8. SMART<br /> &nbsp;&nbsp;&nbsp; 9. CONTROL DE CAMBIOS<br /> Una vez puesto e Produccion, se debera crear el link a la seccion de la Wiki que corresponde: Ej Accesos, Tablero, etc.</td>
	<td width="255"><a href="http://10.111.249.17/wiki-performance/instructivosperformance/build/html/proyectos.html">Wiki Performance</a></td>
	</tr>
	</tbody>
	</table>
	

Los tickets tipor requerimiento poseen el siguiente FLOW:

.. image:: ../_static/images/procesodedesarrollo/workflow1.png
  :align: center

Los tickets tipo Documentacion poseen el siguiente FLOW:

.. image:: ../_static/images/procesodedesarrollo/workflow2.png
  :align: center

Los tickets tipo Epica tienen el siguiente FLOW:

.. image:: ../_static/images/procesodedesarrollo/workflow3.png
  :align: center

ANEXO II-Desarrollo de Proyectos
--------------------------------

Los proyectos de desarrollo deberan ser implementados acorde a lo definido en el siguiente apartado:

.. raw:: html

	<table width="972">
	<tbody>
	<tr>
	<td width="37">1</td>
	<td width="694">El desarrollo se debera realizar en entorno local con las versiones de SO, Software y BD: &hellip;. (definir que..)<br /> * Sistema Operativo: Linux...<br /> * Java:&hellip;.<br /> * Pentaho: &hellip;..<br /> * Base de Datos Oracle 12</td>
	<td width="241">LA VM se podra bajar del siguiente Link</td>
	</tr>
	<tr>
	<td>2</td>
	<td width="694">El parser debera ser desarrollado en tecnologia JAVA, utilizado como base el parser generico adaptado a los requerimientos del Proyecto, salvo que exista alguna razon que justifique un desarrollo completo nuevo.</td>
	<td>Link al parser generico.</td>
	</tr>
	<tr>
	<td>3</td>
	<td width="694">El "end to end" de Pentaho deber&aacute; tener la siguiete estructura como base, salvo que las caracteridsticas del Proyecto justifiquen un cambio radical en el mismo, en cualquier otro caso se respetara la estructura y se adaptara a las necesidades del proyecto en desarrollo.</td>
	<td>Link al end to end generico.</td>
	</tr>
	<tr>
	<td>4</td>
	<td>Los procesos de la BD deberan ser organizados en paquetes con la siguiente logica/estructura.</td>
	<td>Link a los citerios de armado de paquetes</td>
	</tr>
	<tr>
	<td>5</td>
	<td>Cada Proyecto debera tener la siguiente estructura de directorio.</td>
	<td>Link al script de generacion de directorio</td>
	</tr>
	<tr>
	<td>6</td>
	<td>Los datos de los proyectos (XML/CSV, etc) deberan ser almacenados la ruta &hellip;&hellip;&hellip;. del directorio del proyecto.</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>7</td>
	<td width="694">Los archivos de Logs. de los proyectos) deberan ser almacenados la ruta &hellip;&hellip;&hellip;. del directorio del proyecto y deberan tener la extension&hellip;&hellip;</td>
	<td>&nbsp;</td>
	</tr>
	</tbody>
	</table>

ANEXO III -Desarrollo de Tableros
---------------------------------

Los tableros deberan ser implementados acorde a lo definido en el siguiente apartado:

.. raw:: html

	<table width="972">
	<tbody>
	<tr>
	<td width="37">1</td>
	<td width="694">El desarrollo se debera realizar en entorno local con las versiones de SO, Software y BD: &hellip;. (definir cuales..)<br /> * Sistema Operativo: Linux...<br /> * Java:&hellip;.<br /> * Pentaho: &hellip;..<br /> * Base de Datos Oracle 12</td>
	<td width="241">LA VM se podra bajar del siguiente Link</td>
	</tr>
	<tr>
	<td>2</td>
	<td>Se debera crear la estructura de directorio definida. Para ello se debera ejecutar el script: proMkdirs.sh</td>
	<td>Link al script de generacion de directorio</td>
	</tr>
	<tr>
	<td>3</td>
	<td width="694">De ser factible no se deberan crear tablas fisicas, sino queries que se ejecutan en el momento de calculo del tablero.<br /> - Si se crean tablas, deberan:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) Crearse los procesos de recupero de datos.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) Crearse el proceso de control basico.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) Incorporarse en el "Tablero Performance de Red"</td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td>4</td>
	<td width="694">El "end to end" de Pentaho se creara con la ejecucion del scrip proMkdirs.sh</td>
	<td>Link al script de generacion de directorio</td>
	</tr>
	<tr>
	<td>5</td>
	<td width="694">Los procesos de la BD deberan ser organizados en paquetes con la siguiente logica/estructura.</td>
	<td>Link a los citerios de armado de paquetes</td>
	</tr>
	<tr>
	<td>8</td>
	<td width="694">Los archivos de Logs. de los proyectos/tableros deberan ser almacenados la ruta &hellip;&hellip;&hellip;. del directorio del proyecto y deberan tener la extension &hellip;&hellip;&hellip;.. (cuando existan)</td>
	<td>&nbsp;</td>
	</tr>
	</tbody>
	</table>