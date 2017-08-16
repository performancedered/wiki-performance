#!/bin/bash
# echo $(date)
FECHA_PROC=$(date +'%Y%m%d')
echo "Copiando archivos origen --> destino"
rsync -avzu calidad@perdido.claro.amx:/calidad/data/nsn/storage/xml/rc1/cm/$FECHA_PROC/plmnrc6_Nokia3g /home/oracle/NokiaWIFI/Data/XML/plmnrc6_Nokia3g
#echo "Juntando archivos en carpeta con nombre XML"
#find /home/oracle/NokiaWIFI/Data/XML/ -type f -name plmnrc6_Nokia3g -exec mv {} /home/oracle/NokiaWIFI/Data/XML \;
#echo "Descomprimiendo archivos"
#cd /home/oracle/NokiaWIFI/Data/XML
#gzip -d /home/oracle/NokiaWIFI/Data/XML/*.gz
#rm -r /home/oracle/NokiaWIFI/Data/XML/$FECHA_PROC
