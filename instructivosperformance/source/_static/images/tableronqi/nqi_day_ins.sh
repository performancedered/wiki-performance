#!/usr/bin/ksh

# Declaracion de Funciones
. /calidad/control/include.sh
. /calidad/control/variables.sh
. /calidad/control/f_tablero.sh

# Variables de entorno Oracle
export ORACLE_HOME=$oracleHome
export ORACLE_SID=$oracleSid
export ORACLE_TERM=$oracleTerm
export PATH=$path

# Comentarios
# Script Recoleccion y Carga de datos para tablero NQI
# Autor: Monica Pellegrini - 14.07.2016

# Declaracion de Variables
FECHA_DESDE=`f_fecha $ventanaNqiDiasDesde`
FECHA_HASTA=`f_fecha $ventanaNqiDiasHasta`
LOG=nqi_day_ins.log

cd ${WorkDirNqiDaily}

:> $LOG

f_Tablero_Nqi_Day  $FECHA_DESDE $FECHA_HASTA $LOG

