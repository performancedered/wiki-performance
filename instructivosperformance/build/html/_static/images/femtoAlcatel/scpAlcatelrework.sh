#!/bin/bash
<<COMMENT
	Fecha:22/11/2016
	Realiza la copia y descompresion de archivos .tgz para reprocesos.-
COMMENT
#CARPETA=$(date --date=''yesterday'' +%Y%m%d)

scp -r smart@10.105.109.31:/home/smart/performance/$1/  /calidad/AlcatelFemtoCell/Data/$1
cd /calidad/AlcatelFemtoCell/Data/$1
for file in *.tgz
do
     tar -xf $file && rm $file
done;
for corrupted in *.tgz
do
	mv $corrupted /calidad/AlcatelFemtoCell/Data/CorruptedFiles/
done;
exit
