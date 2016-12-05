#!/bin/bash
<<COMMENT
Copia los archivos que coinciden con la fecha pasada como parametro.
Se utiliza para copiar en forma manual los archivos que no existian al momento del proceso
Usage: scpMobileumDate.sh 'YYYYMMDD'
COMMENT

ssh roamware@10.104.28.59 'scp logs/hourly_stats/ARG-'$1'.csv logs/hourly_stats/PRY-'$1'.csv logs/hourly_stats/URY-'$1'.csv calidad@10.92.56.198:/calidad/MobileumASP/hourly_stats'
exit
