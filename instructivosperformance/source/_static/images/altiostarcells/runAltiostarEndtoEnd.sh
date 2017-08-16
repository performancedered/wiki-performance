#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
COMMENT

ps cax | grep runAltiostarEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/Altiostar/Scripts/runAltiostarEndToEnd.sh
fi
exit

-bash-4.1$ ^C
-bash-4.1$ cat runAltiostarEndToEnd.sh
#!/bin/bash
# echo $(date)
FECHA_PARAM=$(date +'%Y%m%d.%H' -d "1 hour ago")
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Altiostar/PentahoSourceFiles/AltiostarEndToEnd.kjb -param:FECHA-PROC=$FECHA_PARAM
