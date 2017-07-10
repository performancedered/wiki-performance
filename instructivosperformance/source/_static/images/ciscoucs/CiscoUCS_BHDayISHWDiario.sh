#!/bin/bash
ps cax | grep CiscoUCS_BHDayISHW_EndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/CiscoUCS/Scripts/cleanUpFiles.sh '/calidad/CiscoUCS'
  sh /calidad/CiscoUCS/Scripts/CiscoUCS_BHDayISHW_EndToEnd.sh
fi
exit
