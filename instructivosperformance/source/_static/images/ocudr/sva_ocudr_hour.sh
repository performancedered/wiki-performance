#!/usr/bin/ksh

# Declaracion de Funciones
. /calidad/control/include.sh
. /calidad/control/variables.sh
. /calidad/control/f_sva.sh

# Variables de entorno Oracle
export ORACLE_HOME=$oracleHome
export ORACLE_SID=$oracleSid
export ORACLE_TERM=$oracleTerm
export PATH=$path

# Comentarios
# Autor: Mauro Arraigada. Fecha: 29.10.2014

# Declaracion de Variables
DIA_DESDE=1
DIA_HASTA=0

FECHA_DESDE=`f_fecha $DIA_DESDE`
FECHA_HASTA=`f_fecha $DIA_HASTA`

LOG=sva_ocudr_hour.log
LOG1=tekelec_ocudr_hour.log
cd $WorkDirOcudrHourly

:> $LOG
:> $LOG1

f_Main_Ocudr_Hourly $FECHA_DESDE $FECHA_HASTA $LOG

f_Tekelec_Ocudr_Hourly $FECHA_DESDE $FECHA_HASTA $LOG1
