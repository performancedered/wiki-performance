#!/bin/bash
<<COMMENT
Copia los archivos a ser procesados
COMMENT
# scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/CPU.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
# scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/MEMORY.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/INTERFACE.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/INTERFACE_AVAIL.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/INTERFACE_ERRORS.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/CGN_STATS.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/CPU_DEVICE_AVG.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/MEMORY_DEVICE_AVERAGE.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
# scp calidad@olivera.claro.amx:/opt/CSCOppm-gw/reports/exporthourly/CPU_LOADAVG.$(date --date=''yesterday'' +%Y-%m-%d)* /calidad/CiscoPrime/exporthourly
#
# Archivo de Inventario y links (vinculos)
scp calidad@10.92.50.222:/export/home/netcraker/output/ALL_ANA_BQL_NEs_Netcracker_Preliminar_Links.xml calidad@10.92.56.198:/calidad/CiscoPrime/exporthourly/ALL_ANA_BQL_NEs_Netcracker_Preliminar_Links.csv
scp calidad@10.92.50.222:/export/home/netcraker/output/ANA_BQL_NEs_Netcracker_Preliminar_PHYSICAL_IP.xml calidad@10.92.56.198:/calidad/CiscoPrime/exporthourly
#
exit
