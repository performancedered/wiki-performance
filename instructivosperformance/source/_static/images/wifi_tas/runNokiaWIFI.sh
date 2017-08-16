sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/NokiaWIFI/PentahoSourceFiles/NokiaEndToEnd.kjb -param:RUTA=$RUTA -param:FECHA-PROC=$FEC
HA_PROC
-bash-4.1$ ^C
-bash-4.1$ ^C
-bash-4.1$ cat runNokiaWIFI.sh
#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
COMMENT

ps cax | grep NokiaWIFIEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/NokiaWIFI/Scripts/NokiaWIFIEndToEnd.sh
#sh /calidad/NokiaWIFI/Scripts/deleteEmptyLogs.sh '/calidad/NokiaWIFI/PentahoLogs'
#sh /calidad/NokiaWIFI/Scripts/deleteEmptyLogs.sh '/calidad/NokiaWIFI/Data/logs'

fi
exit
