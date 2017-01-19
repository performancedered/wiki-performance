#!/bin/bash
#CARPETA=$(date --date=''yesterday'' +%Y%m%d)

scp -r smart@10.105.109.31:/home/smart/performance/$1/  /calidad/AlcatelFemtoCell/Data/$1

exit
