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
# -- Script Recoleccion y Carga de datos para tablero MOUS Integral
# -- Autor: Mario Heredia - 13/07/2007
# -- Actualizacion. Autor: Mario Heredia - 17.10.2008

# Declaracion de Variables
FECHA_DESDE="$1"
FECHA_HASTA="$2"
LOG=tablero_minutos_recovery.log

cd ${wdirTableroMinutos}

:> $LOG

f_Tablero_Minutos_Day_Recovery $FECHA_DESDE $FECHA_HASTA $LOG

