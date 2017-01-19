#!/bin/bash
<<COMMENT
	Fecha:28/10/2016
COMMENT

ps cax | grep alcatelFC.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/AlcatelFemtoCell/Scripts/scpAlcatel.sh
  sh /calidad/AlcatelFemtoCell/Scripts/alcatelFC.sh
  sh /calidad/AlcatelFemtoCell/Scripts/deleteEmptyLogs.sh '/calidad/AlcatelFemtoCell/PentahoLogs'
  sh /calidad/AlcatelFemtoCell/Scripts/deleteEmptyLogs.sh '/calidad/AlcatelFemtoCell/Data/logs'
fi
exit
