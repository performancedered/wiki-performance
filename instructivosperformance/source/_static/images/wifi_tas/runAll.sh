
#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
        Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#
FECHA_PROC=$(date +'%Y%m%d%H' -d "1 hour ago")
#echo "$FECHA_PROC"
#
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/NokiaWIFI/PentahoSourceFiles/NokiaEndToEnd.kjb -param:FECHA-PROC=$FECHA_PROC

-bash-4.1$ ^C
-bash-4.1$ ^C
-bash-4.1$ cat runa
cat: runa: No such file or directory
-bash-4.1$ cat runAll.sh

sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/NokiaWIFI/PentahoSourceFiles/NokiaEndToEnd.kjb -param:RUTA=$RUTA -param:FECHA-PROC=$FEC
HA_PROC
