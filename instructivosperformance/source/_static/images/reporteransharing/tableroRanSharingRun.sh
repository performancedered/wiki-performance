#!/bin/bash
ps cax | grep tableroRanSharing.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/RanSharing/Scripts/tableroRanSharing.sh
fi
exit
