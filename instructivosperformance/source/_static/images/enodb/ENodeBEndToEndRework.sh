#!/bin/bash
<<COMMENT
	Fecha: 10/01/2017
	Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
RUTA=$1
FECHA_PROC_PE=$2
HORA_PROC=$3
FECHA_PROC=$4
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/ENodeB/Rework/RunEnodeB.kjb -param:RUTA=$RUTA -param:FECHA-PROC-PE=$FECHA_PROC_PE -param:HORA-PROC=$HORA_PROC -param:FECHA-PROC=$FECHA_PROC
exit 

