#!/bin/bash

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/ReporteImp/PentahoSourceFiles/ReporteImpEndToEnd.kjb
exit
