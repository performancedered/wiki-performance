#!/bin/bash
#cd $1/Tableros/Reportes/

#rm style*.css

echo "comienza RunAllTableros.kjb"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Tableros/PentahoSourceFiles/RunAllTableros.kjb

#rm style*.css
exit

