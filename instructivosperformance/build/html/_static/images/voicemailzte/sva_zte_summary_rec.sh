#!/usr/bin/ksh

# Declaracion de Funciones
. /calidad/control/include.sh
. /calidad/control/variables.sh

# Variables de entorno Oracle
export ORACLE_HOME=$oracleHome
export ORACLE_SID=$oracleSid
export ORACLE_TERM=$oracleTerm
export PATH=$path

# Comentarios
# Autor:  Monica Pellegrini. Fecha: 23.11.2016.
# Actualizacion: Alejandro Lazarte. Fecha: 31.01.2016. Motivo: Crear script recuperacion.
#                Uso: sva_zte_summary_rec.sh <Semana atras>

# Declaracion de Variables
SEMANA_UNO="$1"
FECHA_DESDE=`f_primer_dia_semana $SEMANA_UNO`
FECHA_HASTA=`f_ultimo_dia_semana $SEMANA_UNO`

cd $workDirSvaZteSummary

LOG=sva_zte_isabhw.log

:>$LOG

f_log "Start Sva Zte Isabh Week" $LOG

sqlplus -S / @ sva_zte_weekly.sql $FECHA_DESDE $FECHA_HASTA  

f_log "Finish Sva Zte Isabh Week" $LOG
