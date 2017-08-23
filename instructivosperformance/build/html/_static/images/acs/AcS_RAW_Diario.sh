
#!/bin/bash
ps cax | grep AcS_RAW_EndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  #sh /calidad/AcSVOWIFI/Scripts/cleanupLogs.sh '/calidad/AcSVOWIFI'
  sh /calidad/AcSVOWIFI/Scripts/AcS_RAW_EndToEnd.sh
fi
exit
