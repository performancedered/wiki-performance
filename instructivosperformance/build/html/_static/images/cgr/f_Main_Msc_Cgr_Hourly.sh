
f_Main_Msc_Cgr_Hourly () {

  FECHA_DESDE="$1 $2"
  FECHA_HASTA="$3 $4"
  LOG=$5

  f_log 'Start Main Cgr Hour' $LOG

  f_Msc_Cgr_Hourly $FECHA_DESDE $FECHA_HASTA $LOG

  f_Msc_Cgr_Group_Hourly $FECHA_DESDE $FECHA_HASTA $LOG

  f_log 'Finish Main Cgr Hour' $LOG
}
