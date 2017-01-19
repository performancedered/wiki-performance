#!/bin/bash
<<COMMENT
	Fecha:15/12/2016
COMMENT

ps cax | grep objectFC.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/AlcatelFemtoCell/Scripts/scpObjectAlcatelFC.sh
  sh /calidad/AlcatelFemtoCell/Scripts/objectFC.sh
  sh /calidad/AlcatelFemtoCell/Scripts/deleteEmptyLogs.sh '/calidad/AlcatelFemtoCell/PentahoLogs'
  sh /calidad/AlcatelFemtoCell/Scripts/deleteEmptyLogs.sh '/calidad/AlcatelFemtoCell/Data/logs'
fi
exit
