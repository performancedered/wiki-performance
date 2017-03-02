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
# Autor: Monica Pellegrini. Fecha: 10.02.2015


# Declaracion de Variables
SEMANAS_ATRAS=1

fechaSemana=`f_primer_dia_semana $SEMANAS_ATRAS`

logFile=tablero_iur.log

cd $workDirTableroIur

> $logFile

f_Tablero_Iur_Umts_Isabhw $fechaSemana $logFile
