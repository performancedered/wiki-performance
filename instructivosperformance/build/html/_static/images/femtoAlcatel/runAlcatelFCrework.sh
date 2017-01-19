#!/bin/bash
<<COMMENT
Parametros:
	1= FECHA_DESDE:usar formato dd.mm.yyyy 
	2= FECHA_HASTA:user formato dd.mm.yyyy 
	3= DIR_XML:nombre del directorio donde se encuentran los archivos xml, yyyMMdd .

COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

FECHA_DESDE=$1
FECHA_HASTA=$2
DIR_XML=$3

sh scpAlcatelrework.sh $DIR_XML
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/AlcatelFemtoCell/Rework/FemtoCellEndToEnd.kjb -param:FECHA_DESDE=$FECHA_DESDE -param:FECHA_HASTA=$FECHA_HASTA -param:DIR_XML=$DIR_XML
