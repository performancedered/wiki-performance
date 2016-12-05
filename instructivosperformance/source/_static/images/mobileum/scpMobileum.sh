#!/bin/bash
FECHA=$(date --date="yesterday" +"%Y%m%d")

ssh roamware@10.104.28.59 'scp logs/hourly_stats/ARG-'$FECHA'.csv logs/hourly_stats/PRY-'$FECHA'.csv logs/hourly_stats/URY-'$FECHA'.csv calidad@10.92.56.198:/calidad/MobileumASP/hourly_stats'
exit
