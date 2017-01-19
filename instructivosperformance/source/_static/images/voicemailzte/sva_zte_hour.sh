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
# Autor: Mauro Arraigada. Fecha: 29.04.2014

# Declaracion de Variables
VENTANA_DIAS_DESDE=0
FECHA=`f_fecha $VENTANA_DIAS_DESDE`

LOG=sva_zte_hour.log

cd $WorkDirZteHourly
rm *.txt

:> $LOG

f_Main_Zte_Hourly $FECHA $LOG

