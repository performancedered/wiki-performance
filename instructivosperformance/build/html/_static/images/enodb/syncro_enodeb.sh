#!/bin/bash
# echo $(date)
RUTA=$1
FECHA_PROC=$(date +'%Y%m%d') #FECHA HORA (YYYYMMDD)
HORA_PROC=$(date +'%Y%m%d.%H' -d "1 hour ago")
echo "Copiando archivos origen --> destino"
rsync -avzu samadmin@10.111.102.62:/opt/5620sam/lte/stats/$FECHA_PROC/eNodeB/ $RUTA/Data/XML/$FECHA_PROC
echo "Juntando archivos en carpeta con nombre XML"
find $RUTA/Data/XML/$FECHA_PROC -type f -name *$HORA_PROC*.gz -exec mv {} $RUTA/Data/XML \;
echo "Descomprimiendo archivos"
cd $RUTA/Data/XML
gzip -d $RUTA/Data/XML/*.gz
echo "Borrando archivos .gz"
rm $RUTA/Data/XML/*.gz
echo "Borrando carpetas inecesarias"
rm -r $RUTA/Data/XML/$FECHA_PROC


