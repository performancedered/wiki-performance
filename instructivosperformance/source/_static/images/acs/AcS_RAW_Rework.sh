<<COMMENT
        Fecha: 03/08/2017
        Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO
#

FECHA=$1
#FORMATO YYYYMMDD

#
sh $HOME/Pentaho61/data-integration/kitchen.sh -file=$HOME/AcSVOWIFI/PentahoSourceFiles/AcSVOWIFI_RAW_EndToEnd.kjb -param:FECHA_PROC=$FECHA
