#!/bin/bash
ps cax | grep mobileum_asp.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/MobileumASP/Scripts/scpMobileum.sh
  sh /calidad/MobileumASP/Scripts/addHeader.sh '/calidad/MobileumASP'
  sh /calidad/MobileumASP/Scripts/mobileum_asp.sh
fi
exit

