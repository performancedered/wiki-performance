#!/bin/bash
<<COMMENT
	Fecha: 10/01/2017
	Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#
FECHA_PROC=$(date +'%d%m%Y%H' -d "1 hour ago")
echo "$FECHA_PROC"
#
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/ENodeB/PentahoSourceFiles/RunEnodeB.kjb -param:FECHA-PROC=$FECHA_PROC
