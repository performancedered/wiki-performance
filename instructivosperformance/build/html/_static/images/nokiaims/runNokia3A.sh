#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
COMMENT

ps cax | grep Nokia3AEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/Nokia3A/Scripts/Nokia3AEndToEnd.sh
#sh /calidad/Nokia3A/Scripts/deleteEmptyLogs.sh '/calidad/Nokia3A/PentahoLogs'
#sh /calidad/Nokia3A/Scripts/deleteEmptyLogs.sh '/calidad/Nokia3A/Data/logs'

fi
exit

