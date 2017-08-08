#!/usr/bin/ksh

# Declaracion de Funciones
. /calidad/control/include.sh
. /calidad/control/variables.sh
. /calidad/control/f_msc_cgr.sh

# Variables de entorno Oracle
export ORACLE_HOME=$oracleHome
export ORACLE_SID=$oracleSid
export ORACLE_TERM=$oracleTerm
export PATH=$path

# Creacion Monica pellegrini.

# Declaracion de Variables
FECHA_DESDE="$1 $2"
FECHA_HASTA="$3 $4"

LOG=cgr_hourly.log

cd ${WorkDirMscCgrHourly}

:> $LOG

f_log 'Start Main Cgr Hour' $LOG

  f_Msc_Cgr_Group_Hourly $FECHA_DESDE $FECHA_HASTA $LOG

 f_log 'Finish Main Cgr Hour' $LOG
