
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
VENTANA_DIAS_DESDE=$ventanaHorariaMscDiasDesde
VENTANA_HORA_DESDE=$ventanaHorariaMscHoraDesde

VENTANA_DIAS_HASTA=$ventanaHorariaMscDiasHasta
VENTANA_HORA_HASTA=$ventanaHorariaMscHoraHasta

FECHA_DESDE=`f_fecha_hora $VENTANA_DIAS_DESDE $VENTANA_HORA_DESDE`
FECHA_HASTA=`f_fecha_hora $VENTANA_DIAS_HASTA $VENTANA_HORA_HASTA`

LOG=cgr_hourly.log

cd ${WorkDirMscCgrHourly}

:> $LOG

f_Main_Msc_Cgr_Hourly $FECHA_DESDE $FECHA_HASTA $LOG

