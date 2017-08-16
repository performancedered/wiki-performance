
#!/bin/bash
<<COMMENT
        Fecha: 10/01/2017
        Inicia el EndToEnd de Pentaho
        Parametros del rework: DDMMYYYYHH24 YYYYMMDDHH24 EJ: 2003201709 2017032010
        Si se quiere reprocesar la hora 10, tirar como parametro 1 hora mas.
        Ej: Fecha de reproceso 2003201709 Parametro 2003201710
COMMENT
export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
RUTA=$1
FECHA_PROC=$2
HORA_PROC=$3
while true; do
echo
read -p "Recuerde que los parametros del rework son: DDMMYYYYHH24 YYYYMMDDHH24+1
Si se quiere reprocesar la hora 10, tirar como parametro 1 hora mas.
Ej: Fecha de reproceso 2003201709 Parametro: 2003201709 2017032010
FECHA INGRESADA PARA CORRER EL REWORK:$FECHA_PROC $HORA_PROC Con ruta: $RUTA Confirmar?" yn
case $yn in
yes ) break;;
no ) exit;;
* ) echo "por favor responda yes o no";;
esac
done
echo "Corriendo rework para la fecha $FECHA_PROC $HORA_PROC"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Nokia3A/Rework/Nokia3AEndToEnd.kjb -param:RUTA=$RUTA -param:FECHA-PROC=$FECHA_PROC -param:HORA-PROC=$HORA_PROC
#sh /home/oracle/Pentaho/data-integration/kitchen.sh -file=/home/oracle/Nokia3A/Rework/Nokia3AEndToEnd.kjb -param:RUTA=$RUTA -param:FECHA-PROC=$FECHA_PROC -param:HORA-PROC=$HORA_PROC
