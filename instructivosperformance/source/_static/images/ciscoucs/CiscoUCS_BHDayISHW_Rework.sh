#!/bin/bash
<<COMMENT
	Fecha: 04/07/2017
	Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#

P_FECHA=$1

#
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/CiscoUCS/PentahoSourceFiles/CiscoUCS_BHDayISHW_EndToEnd.kjb -param:P_FECHA=$1
