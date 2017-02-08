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
# Actualizacion: Monica Pellegrini. Fecha: 01.02.2017. Motivo: Se crea el reproceso el cual se debe ingresar fecha_desde fecha_hasta.

# Declaracion de Variables
FECHA_DESDE="$1"
FECHA_HASTA="$2"

LOG=ocudr_tekelec_day.log

cd ${WorkDirOcudrDaily}

:> $LOG

f_Tekelec_Ocudr_Day  $FECHA_DESDE $FECHA_HASTA $LOG
