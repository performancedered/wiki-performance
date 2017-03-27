#!/bin/bash

FECHA_EXEC=$(date +"%Y%m%d_%H")

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/RanSharing/PentahoSourceFiles/RanSharing_EndToEnd.kjb -param:FECHA_EXEC=$FECHA_EXEC
exit
