#!/bin/bash
<<COMMENT
	Fecha: 10/01/2017
COMMENT

ps cax | grep ENodeBEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/ENodeB/Scripts/ENodeBEndToEnd.sh
#sh /calidad/ENodeB/Scripts/deleteEmptyLogs.sh '/calidad/ENodeB/PentahoLogs'
#sh /calidad/ENodeB/Scripts/deleteEmptyLogs.sh '/calidad/ENodeB/Data/logs'
  
fi
exit


