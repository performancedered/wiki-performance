#!/bin/bash
ps cax | grep nokiaRun.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/Nokia_UMTS_Uplink_Interference/Scripts/nokiaRun.sh
fi
exit


