#!/bin/bash
<<COMMENT
	Fecha:15/12/2016
	Inicia el ObjectEndToEnd de Pentaho	
COMMENT


export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
FECHA=$(date --date=''yesterday'' +%Y%m%d)

sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/AlcatelFemtoCell/PentahoSourceFiles/ObjetoFemtoCellEndtoEnd.kjb -param:FECHA=$FECHA
exit

