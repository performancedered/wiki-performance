#!/bin/bash
<<COMMENT
	Fecha: 03/05/2017
	Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#

P_FECHA_DESDE=$1
P_FECHA_HASTA=$2

#
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/CiscoUCS/PentahoSourceFiles/CiscoUCS_Hour_EndToEnd.kjb -param:P_FECHA_DESDE=$1 -param:P_FECHA_HASTA=$2
