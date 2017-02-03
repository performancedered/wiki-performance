#!/bin/bash
<<COMMENT

COMMENT
ps cax | grep ciscoPrime.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/CiscoPrime/Scripts/scpOlivera.sh
  sh /calidad/CiscoPrime/Scripts/ciscoPrime.sh
  # Limpieza de logs vacios
  sh /calidad/CiscoPrime/Scripts/deleteEmptyLogs.sh '/calidad/CiscoPrime/PentahoLogs'
  sh /calidad/CiscoPrime/Scripts/deleteEmptyLogs.sh '/calidad/CiscoPrime/exporthourly/logs'
fi
exit
