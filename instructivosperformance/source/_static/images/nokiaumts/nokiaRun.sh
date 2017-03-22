#!/bin/bash

#fecha (con formato dd.mm.yyyy)
FECHA_PROC=$(date '+%d-%m-%Y')

#FECHA PARA EL SCRIPT SQL - en la bd se calcula el valor de la semana anterior
FECHA=$(date +%d-%m-%Y)

#semana del año para el nombre del reporte
WEEK=$(date '+%U' --date='last week')

#año para los valores de la semana pasada
YEAR=$(date '+%Y' --date='last week')

echo "comienza NokiaReportEndToEnd.kjb. Fecha proc [$FECHA_PROC] Fecha para query [$FECHA] / week: $WEEK / year: $YEAR"
sh /calidad/Pentaho61/data-integration/kitchen.sh -file=/calidad/Nokia_UMTS_Uplink_Interference/PentahoSourceFiles/NokiaReportEndToEnd.kjb -param:WEEK=$WEEK -param:YEAR=$YEAR -param:FECHA=$FECHA

exit

