#!/bin/bash
# echo $(date)
#Ejecucion de éste script=sh syncro_enodeb_rework.sh /calidad/ENodeB 20170124 20170124.00
RUTA=$1
#FECHA_PROC=$2
FECHA_PROC_PE=$2
HORA_PROC=$3
FECHA_PROC=$4
echo "Copiando archivos origen --> destino"
rsync -avzu samadmin@10.111.102.62:/opt/5620sam/lte/stats/$FECHA_PROC_PE/eNodeB/*/*$HORA_PROC*.gz $RUTA/Data/XML/$FECHA_PROC_PE
echo "Juntando archivos en carpeta con nombre XML"
find $RUTA/Data/XML/$FECHA_PROC_PE -type f -name *$HORA_PROC*.gz -exec mv {} $RUTA/Data/XML \;
echo "Descomprimiendo archivos..."
cd $RUTA/Data/XML
gzip -d $RUTA/Data/XML/*.gz
echo "Borrando archivos..."
rm $RUTA/Data/XML/*.gz
echo "Borrando carpetas vacias..."
rm -r $RUTA/Data/XML/$FECHA_PROC_PE

