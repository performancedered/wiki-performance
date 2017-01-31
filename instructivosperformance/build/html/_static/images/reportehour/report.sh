#!/bin/bash
echo "Comienza shell delete rc_storage.htm y xml"
cd /calidad/Reportes/ReporteTemp/

if test -f rc_storage.htm
then
	rm rc_storage.htm
	rm rc_storage.xml
else
	echo "no existe el archivo"
fi
# echo "Comienza Reporte Storage"
# sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Reportes/PentahoSourceFiles/JOBS/j_info_storage.kjb 
echo "Comienza Reporte Nivel Hour All Tec"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Reportes/PentahoSourceFiles/JOBS/j_report_allTEC.kjb 
echo "Comienza Reporte Nivel BHDay"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Reportes/PentahoSourceFiles/JOBS/reporte_bhday_alltec.kjb 
exit
