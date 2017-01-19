#!/bin/bash
<<COMMENT
	Fecha:15/1/2016
COMMENT
FECHA=$(date --date=''yesterday'' +%Y%m%d)
scp smart@10.105.109.28:/opt/nortel/data/cmXML/scheduledExport/*$FECHA*.xml.zip  /calidad/AlcatelFemtoCell/Data/
cd /calidad/AlcatelFemtoCell/Data/

unzip *$FECHA*.xml.zip -d /calidad/AlcatelFemtoCell/Data/
rm UTRAN-SNAP*.xml.zip
