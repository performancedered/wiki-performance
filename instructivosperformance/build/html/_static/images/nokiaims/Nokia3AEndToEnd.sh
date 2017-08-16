#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
        Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#
FECHA_PROC=$(date +'%Y%m%d%H' -d "1 hour ago")
#echo "$FECHA_PROC"
#
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Nokia3A/PentahoSourceFiles/Nokia3AEndToEnd.kjb -param:FECHA-PROC=$FECHA_PROC
