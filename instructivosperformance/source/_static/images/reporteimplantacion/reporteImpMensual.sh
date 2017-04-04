#!/bin/bash
<<COMMENT

COMMENT
ps cax | grep reporteImp.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/ReporteImp/Scripts/reporteImp.sh
fi
exit
