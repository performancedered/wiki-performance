#!/bin/bash

FECHA_PROC=$(date +"%d%m%Y_%H:%M")
echo "FECHA_PROC=$FECHA_PROC"
#
echo "Borrado de *.html y *.txt anteriores"
#
for i in /calidad/Informes/Data/*.txt
do
	if [ -e $i ]
	then
		echo "Borrando $i"
		rm $i
	fi
done
#
if test -f /calidad/Informes/Data/espacio.html
then 
	echo "Borrando espacio.html"
	rm /calidad/Informes/Data/espacio.html
fi
#
echo "Comienza Reporte Storage"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Informes/PentahoSourceFiles/InfoStorageEndToEnd.kjb -param:FECHA-PROC=$FECHA_PROC
#
echo "Borrando logs vacios...."
sh /calidad/Informes/Scripts/deleteEmptyLogs.sh '/calidad/Informes/PentahoLogs'
exit
