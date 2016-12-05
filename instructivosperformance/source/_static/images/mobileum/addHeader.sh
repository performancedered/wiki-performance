#!/bin/bash
FILES=$1/hourly_stats/*.csv
for f in $FILES
do
  # take action on each file. $f store current file name
  sed -i '1iFECHA,CNT_LLAMADAS,CNT_POLITICA_RESTRICCION,CNT_BOLQ_REL_TIPO_GEST,CNT_BLOQ_RAN_REL,CNT_PERMITIERON_CONTINUAR,CNT_CONECTADAS_VOICE_MAIL,CNT_CONECTADA_ANUNCIO_SWITCH' $f
done
