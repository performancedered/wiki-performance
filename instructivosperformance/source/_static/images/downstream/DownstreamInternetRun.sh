#!/bin/bash
ps cax | grep DownstreamInternet.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/DownstreamInternet/Scripts/DownstreamInternet.sh
fi
exit
