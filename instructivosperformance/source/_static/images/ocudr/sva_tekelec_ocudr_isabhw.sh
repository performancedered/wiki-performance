
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

# Autor : Monica Pellegrioni. Fecha: 29.11.2016.


# Declaracion de Variables
FECHA_DESDE=`f_primer_dia_semana`
FECHA_HASTA=`f_ultimo_dia_semana`

logFile=tekelecocudrweek.log

cd ${WorkDirOcudrSummary}

:> $logFile

f_Tekelec_Ocudr_Week $FECHA_DESDE $FECHA_HASTA $logFile
