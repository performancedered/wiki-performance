#!/bin/bash
ps cax | grep tableroAMXLoad.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/TableroAMXLoadLTE/Scripts/tableroAMXLoad.sh
fi
exit
