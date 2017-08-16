
#!/bin/bash
<<COMMENT
Este script se usa para generar un unico CSV con los datos de todos los archivos parseados
COMMENT
cd $1
fileZero="*TAS_*_0.csv"
if test `ls $fileZero`
then
        cat $fileZero > nokiaWifiAll_$(date +'%Y%m%d%H' -d "1 hour ago").csv

        rm $fileZero
        for i in `find . -name '*TAS*'`
        do
                sed 1d $i >> nokiaWifiAll_$(date +'%Y%m%d%H' -d "1 hour ago").csv
                rm $i
        done;
        echo "csv unico generado con exito!!!"
else
        echo "error"
        #cat *TAS_*_0.csv > nokiaWifiAll_$(date +'%Y%m%d%H' -d "1 hour ago").csv
fi;
