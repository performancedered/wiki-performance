
#!/bin/bash
ps cax | grep AcS_DAY_EndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  #sh /calidad/AcSVOWIFI/Scripts/cleanupLogs.sh '/calidad/AcSVOWIFI'
  sh /calidad/AcSVOWIFI/Scripts/AcS_DAY_EndToEnd.sh
fi
exit
