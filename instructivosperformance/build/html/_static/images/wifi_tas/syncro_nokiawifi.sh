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

-bash-4.1$ ^C
-bash-4.1$ cat runParserNokiaWIFI.sh
java -jar $1 $2 $3
-bash-4.1$ ^C
-bash-4.1$ cat syncro_nokiawifi.sh
#!/bin/bash
# echo $(date)
RUTA=$1
FECHA_PROC=$(date +'%Y%m%d%H' -d "1 hour ago")
echo "Copiando archivos origen --> destino"
rsync -avzu calidad@10.105.39.140:/d/oss/global/var/mediation/north/pm/export/$FECHA_PROC/*_TAS* $RUTA/Data/XML/$FECHA_PROC/
echo "Descomprimiendo archivos"
cd $RUTA/Data/XML/$FECHA_PROC
gzip -d $RUTA/Data/XML/$FECHA_PROC/*.gz
#rm -r $RUTA/Data/XML/$FECHA_PROC
