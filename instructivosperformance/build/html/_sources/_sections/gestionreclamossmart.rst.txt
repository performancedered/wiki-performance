
GESTION DE RECLAMOS - SMART
=============================

1.	OBJETIVO
------------

El presente documento buscar explicar y detallar el proceso que generan  las novedades de reclamos.

2.	DOCUMENTACIO INTERFAZ WEB DE ABM RECLAMOS 
----------------------------------------------

.. image:: ../_static/images/gestionreclamossmart/image1.png
  :align: center

Menú Inicio, sólo esta implementado el link Tickets.

.. image:: ../_static/images/gestionreclamossmart/image2.png
  :align: center

Bandeja de Entrada Tickets. Los tickets asignados al grupo son los que aún no fueron asignados a un usuario para su procesamiento y que además se encuentran abiertos. Luego de que son asignados por el administrador, pasan a la bandeja de tickets en proceso. Los usuarios pueden reasignar los tickets a otro usuario (queda guardado el log)

.. image:: ../_static/images/gestionreclamossmart/image3.png
  :align: center

Asignación de tickets a los responsables. Sólo los administradores podrán utilizar esta funcionalidad.

.. image:: ../_static/images/gestionreclamossmart/image4.png
  :align: center

Edición de un ticket. Modificación e inserción de información a los tickets. Mediante el número de cuenta que se encuentra en el detalle del problema (precondición necesaria), se prosigue buscando al cliente asociado, si éste no existe se lo puede cargar (y luego también modificar). También se pueden agregar comentarios y agregar datos de cierre.


3. CONTROL DE CAMBIOS
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
    <td> 31/05/2017 </td>
    <td> Marcelo Olivera </td>
    <td> <p><a href="http://jira.harriague.com.ar/jira/browse/CL-607"> CL-607 </a></p>  </td>
    <td> Creacion de documentación de Proyecto existente.
         <br>Proyecto actual - Cortado.</br></td>
    <td> Servidor: CORTADO </td>
  </tr>
  </table>