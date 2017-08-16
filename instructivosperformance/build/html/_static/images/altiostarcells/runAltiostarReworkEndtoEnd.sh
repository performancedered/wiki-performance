#!/bin/bash
# echo $(date)
FECHA_PARAM=$1
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Altiostar/Rework/AltiostarEndToEnd.kjb -param:FECHA-PROC=$FECHA_PARAM
-bash-4.1$ ^C
-bash-4.1$ cat runParserAltiostar.sh
java -jar $1 $2 $3
-bash-4.1$ cat runAltiostarReworkEndToEnd.sh
#!/bin/bash
# echo $(date)
FECHA_PARAM=$1
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Altiostar/Rework/AltiostarEndToEnd.kjb -param:FECHA-PROC=$FECHA_PARAM
