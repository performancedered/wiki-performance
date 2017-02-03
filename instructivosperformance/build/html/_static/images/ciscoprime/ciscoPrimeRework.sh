#!/bin/bash
<<COMMENT
Script para ejecutar el reproceso de un dia en particular
Params:	fecha a reprocesar 'YYYY-MM-DD'
COMMENT

ps cax | grep ciscoRework.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/CiscoPrime/Scripts/scpOliveraDate.sh $1
  sh /calidad/CiscoPrime/Scripts/ciscoRework.sh $1
  # Limpieza de logs vacios
  sh /calidad/CiscoPrime/Scripts/deleteEmptyLogs.sh '/calidad/CiscoPrime/PentahoLogs'
  sh /calidad/CiscoPrime/Scripts/deleteEmptyLogs.sh '/calidad/CiscoPrime/exporthourly/logs'
fi
exit
