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
# Autor: Monica Pellegrini fecha: 23.09.2016

# Declaracion de Variables
VENTANA_DIAS_DESDE=0
VENTANA_HORAS_DESDE=-12

VENTANA_DIAS_HASTA=0
VENTANA_HORAS_HASTA=-1

FECHA_DESDE=`f_fecha_hora $VENTANA_DIAS_DESDE $VENTANA_HORAS_DESDE`
FECHA_HASTA=`f_fecha_hora $VENTANA_DIAS_HASTA $VENTANA_HORAS_HASTA`

LOG=nqi_hourly_ins.log

cd $WorkDirNqiHourly

:> $LOG

f_Tablero_Nqi_Hourly $FECHA_DESDE $FECHA_HASTA $LOG
