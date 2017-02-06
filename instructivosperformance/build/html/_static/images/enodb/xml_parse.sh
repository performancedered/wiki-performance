#!/bin/bash

<<COMMENT
	Backup de XML, CSV
COMMENT


RUTA=$1
RUTA_BKP_XML=$(date +'%Y%m%d.%H' -d "1 hour ago")
RUTA_BKP_CSV=$(date +'%Y%m%d.%H' -d "1 hour ago")
#BACKUP XML
mkdir $RUTA/Data/XML_PARSE/$RUTA_BKP_XML
mv -f $RUTA/Data/XML/* $RUTA/Data/XML_PARSE/$RUTA_BKP_XML
tar -czf $RUTA/Data/XML_PARSE/bkp_enodeb_$RUTA_BKP_XML.gz $RUTA/Data/XML_PARSE/
rm -r $RUTA/Data/XML_PARSE/$RUTA_BKP_XML
#BACKUP CSV
mkdir $RUTA/Data/CSV_PARSE/$RUTA_BKP_CSV
mv -f $RUTA/Data/CSV/* $RUTA/Data/CSV_PARSE/$RUTA_BKP_CSV
tar -czf $RUTA/Data/CSV_PARSE/bkp_enodeb_$RUTA_BKP_CSV.gz $RUTA/Data/CSV_PARSE/
rm -r $RUTA/Data/CSV_PARSE/$RUTA_BKP_CSV
#BORRADO DE ARCHIVOS BACKUP (2 días)
find $RUTA/Data/XML_PARSE/*.gz -mtime +2 -exec rm {} \;
find $RUTA/Data/CSV_PARSE/*.gz -mtime +2 -exec rm {} \;

exit 



