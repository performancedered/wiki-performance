#!/bin/bash
<<COMMENT
	Fecha:20/10/2016
	Realiza la copia y descompresion de archivos .tgz.

	Mod:25/10/2016: Se agrego un bucle for para tratar los .tgz corruptos y enviarlos a un directorio.
COMMENT
CARPETA=$(date --date=''yesterday'' +%Y%m%d)
CARPETA_OLD=$(date -d"-3 days" +%Y%m%d)
rm -r /calidad/AlcatelFemtoCell/Data/$CARPETA_OLD
scp -r smart@10.105.109.31:/home/smart/performance/$CARPETA/  /calidad/AlcatelFemtoCell/Data/$CARPETA
cd /calidad/AlcatelFemtoCell/Data/$CARPETA
for file in *.tgz
do
     tar -xf $file && rm $file
done;
for corrupted in *.tgz
do
	mv $corrupted /calidad/AlcatelFemtoCell/Data/CorruptedFiles/
done;
exit
