-- Open | Fetch | Close

OPEN CUR_NSN_NE_HOUR  (P_FECHA_DESDE, P_FECHA_HASTA, P_OSSRC);

LOOP

FETCH CUR_NSN_NE_HOUR BULK COLLECT INTO NSN_NQI_VOZ_HOUR LIMIT C_LIMIT;

FOR I IN 1 .. NSN_NQI_VOZ_HOUR.COUNT LOOP

  PCNT := PCNT + 1;

  UMTS_NSN_NQI_VOZ_HOU2(I).FECHA                           := NSN_NQI_VOZ_HOUR(I).FECHA                         ;
  UMTS_NSN_NQI_VOZ_HOU2(I).OSSRC                           := NSN_NQI_VOZ_HOUR(I).OSSRC                         ;
  UMTS_NSN_NQI_VOZ_HOU2(I).WCELL_GID                       := NSN_NQI_VOZ_HOUR(I).WCELL_GID                     ;
  --UMTS_NSN_NQI_VOZ_HOU2(I).WBTS_ID                         := NSN_NQI_VOZ_HOUR(I).WBTS_ID                       ;
  --UMTS_NSN_NQI_VOZ_HOU2(I).RNC_ID                          := NSN_NQI_VOZ_HOUR(I).RNC_ID                        ;

  UMTS_NSN_NQI_VOZ_HOU2(I).PEAKRTWP                        := NSN_NQI_VOZ_HOUR(I).PEAKRTWP                      ;
  UMTS_NSN_NQI_VOZ_HOU2(I).RTWP90HOUR                      := NSN_NQI_VOZ_HOUR(I).RTWP90HOUR                    ;
  UMTS_NSN_NQI_VOZ_HOU2(I).AVGRTWP                         := NSN_NQI_VOZ_HOUR(I).AVGRTWP                       ;
  UMTS_NSN_NQI_VOZ_HOU2(I).MINRTWP                         := NSN_NQI_VOZ_HOUR(I).MINRTWP                       ;
  UMTS_NSN_NQI_VOZ_HOU2(I).TOTALHOURSRTWP                  := NSN_NQI_VOZ_HOUR(I).TOTALHOURSRTWP                ;
  UMTS_NSN_NQI_VOZ_HOU2(I).RTWPGREATERTHAN90               := NSN_NQI_VOZ_HOUR(I).RTWPGREATERTHAN90             ;

  UMTS_NSN_NQI_VOZ_HOU2(I).LOAD_CELL                       := NSN_NQI_VOZ_HOUR(I).LOAD_CELL                     ;
  UMTS_NSN_NQI_VOZ_HOU2(I).ERL_EQUIV                       := NSN_NQI_VOZ_HOUR(I).ERL_EQUIV                     ;
  UMTS_NSN_NQI_VOZ_HOU2(I).DL_CELL_SECTOR_THRO_MBPS        := NSN_NQI_VOZ_HOUR(I).DL_CELL_SECTOR_THRO_MBPS      ;
  UMTS_NSN_NQI_VOZ_HOU2(I).ERL_EQUIV_MEH                   := NSN_NQI_VOZ_HOUR(I).ERL_EQUIV_MEH                 ;
  UMTS_NSN_NQI_VOZ_HOU2(I).LOAD_CELL_MEH                   := NSN_NQI_VOZ_HOUR(I).LOAD_CELL_MEH                 ;
  UMTS_NSN_NQI_VOZ_HOU2(I).VOICE_12_2                      := NSN_NQI_VOZ_HOUR(I).VOICE_12_2                    ;
  UMTS_NSN_NQI_VOZ_HOU2(I).VOICE_5_9                       := NSN_NQI_VOZ_HOUR(I).VOICE_5_9                     ;
  UMTS_NSN_NQI_VOZ_HOU2(I).HS_A_DCH                        := NSN_NQI_VOZ_HOUR(I).HS_A_DCH                      ;
  UMTS_NSN_NQI_VOZ_HOU2(I).HS_A_DCH_MEH                    := NSN_NQI_VOZ_HOUR(I).HS_A_DCH_MEH                  ;
  UMTS_NSN_NQI_VOZ_HOU2(I).SRB_STANDALONE                  := NSN_NQI_VOZ_HOUR(I).SRB_STANDALONE                ;
  UMTS_NSN_NQI_VOZ_HOU2(I).DL_PS_R99                       := NSN_NQI_VOZ_HOUR(I).DL_PS_R99                     ;

END LOOP;

IF CUR_NSN_NE_HOUR%NOTFOUND THEN

   FORALL I IN UMTS_NSN_NQI_VOZ_HOU2.FIRST .. PCNT
   INSERT INTO CLDD_RADAR_AUX_HOUR VALUES UMTS_NSN_NQI_VOZ_HOU2(I);

   EXIT;

ELSE

   FORALL I IN UMTS_NSN_NQI_VOZ_HOU2.FIRST .. UMTS_NSN_NQI_VOZ_HOU2.LAST
   INSERT INTO CLDD_RADAR_AUX_HOUR VALUES UMTS_NSN_NQI_VOZ_HOU2(I);

END IF;

PCNT := 0;

END LOOP;

COMMIT;

END P_RADAR_TLOAD_NQI_HOUR_INS;
