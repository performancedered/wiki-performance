
#!/bin/bash
# echo $(date)
RUTA=$1
FECHA_PROC=$(date +'%Y%m%d%H' -d "1 hour ago")
echo "Copiando archivos origen --> destino"
rsync -avzu calidad@10.105.39.140:/d/oss/global/var/mediation/north/pm/export/$FECHA_PROC/*_AAA* $RUTA/Data/XML/$FECHA_PROC
echo "Juntando archivos en carpeta con nombre XML"
find $RUTA/Data/XML/$FECHA_PROC -type f -name *$FECHA_PROC*.gz -exec mv {} $RUTA/Data/XML \;
echo "Descomprimiendo archivos"
cd $RUTA/Data/XML
gzip -d $RUTA/Data/XML/*.gz
rm -r $RUTA/Data/XML/$FECHA_PROC
