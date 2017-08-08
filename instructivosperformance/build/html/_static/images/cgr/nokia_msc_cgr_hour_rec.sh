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

# Comentarios
# Autor: Mario Heredia - 04/10/2007
# Actualizacion: Mario Heredia - 04/03/2008

# Declaracion de Variables
FECHA_DESD2="$1 $2"
FECHA_HAST2="$3 $4"

LOG=cgr_hourly.log

cd ${WorkDirMscCgrHourly}

:> $LOG

f_Main_Msc_Cgr_Hourly $FECHA_DESD2 $FECHA_HAST2 $LOG
