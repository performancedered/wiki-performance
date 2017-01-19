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
# Script Recoleccion y Carga de datos para tablero NQI
# Autor: Monica Pellegrini - 14.07.2016

# Declaracion de Variables
FECHA_DESDE=`f_fecha $ventanaDiasDesde`
FECHA_HASTA=`f_fecha $ventanaDiasHasta`

LOG=ocudr_tekelec_day.log

cd ${WorkDirOcudrDaily}

:> $LOG

f_Tekelec_Ocudr_Day  $FECHA_DESDE $FECHA_HASTA $LOG
