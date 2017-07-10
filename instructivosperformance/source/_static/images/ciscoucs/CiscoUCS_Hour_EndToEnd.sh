#!/bin/bash
<<COMMENT
	Fecha: 03/07/2017
	Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

P_FECHA_DESDE=$(date --date=yesterday "+%d.%m.%Y 00")
P_FECHA_HASTA=$(date --date=yesterday "+%d.%m.%Y 23")

echo "desde $P_FECHA_DESDE -- hasta $P_FECHA_HASTA"

sh $HOME/Pentaho/data-integration/kitchen.sh -file=$HOME/CiscoUCS/PentahoSourceFiles/CiscoUCS_Hour_EndToEnd.kjb -param:P_FECHA_DESDE="$P_FECHA_DESDE" -param:P_FECHA_HASTA="$P_FECHA_HASTA"
