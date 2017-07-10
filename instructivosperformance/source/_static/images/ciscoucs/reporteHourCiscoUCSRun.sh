#!/bin/bash
ps cax | grep reporteNivelHourCiscoUCS.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/CiscoUCS/Scripts/reporteNivelHourCiscoUCS.sh
fi
exit
