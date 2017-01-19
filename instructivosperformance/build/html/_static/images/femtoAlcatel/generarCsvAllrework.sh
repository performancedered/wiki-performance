#!/bin/bash
<<COMMENT
Este script se usa para generar un unico CSV con los datos de todos los archivos parseados
Rework:parametro 2 es yyyymmdd
COMMENT
cd $1
fileZero="femto_file0.csv"
if test `ls $fileZero`
then
	cat $fileZero > femtoCellAll_$2.csv
	
	rm $fileZero
	for i in `find . -name 'femto_file*'`
        do
                sed 1d $i >> femtoCellAll_$2.csv
                rm $i
        done;
        echo "csv unico generado con exito!!!"
else
	 cat femto_file.csv > femtoCellAll_$2.csv
fi;


