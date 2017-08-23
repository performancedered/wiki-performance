
#!/bin/bash
<<COMMENT
        Fecha: 03/08/2017
        Inicia el EndToEnd de Pentaho
COMMENT

export ORACLE_HOME=/oracle/app/oracle/product/12.1.0.2/dbhome
export ORACLE_SID=DSMART2
export ORAENV_ASK=NO

P_FECHA=$(date "+%d.%m.%Y")

sh $HOME/Pentaho61/data-integration/kitchen.sh -file=$HOME/AcSVOWIFI/PentahoSourceFiles/AcSVOWIFI_DAY_EndToEnd.kjb -param:P_FECHA="$P_FECHA"
