  CREATE TABLE UMTS_C_NSN_HSDPAW_WCEL_BHP 
   (	PERIOD_START_TIME DATE, 
	OSSRC VARCHAR2(10), 
	WCELL_GID NUMBER, 
	WBTS_GID NUMBER, 
	RNC_GID NUMBER, 
	PERIOD_DURATION NUMBER, 
	PERIOD_DURATION_SUM NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_0 NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_1 NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_2 NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_3 NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_4 NUMBER, 
	MAC_HS_PDU_RETR_DIST_CL_5 NUMBER, 
	MAC_D_PDU_DROP_BTS_OWFL NUMBER, 
	MAC_D_PDU_TOT NUMBER, 
	CQI_DIST_CL_0 NUMBER, 
	CQI_DIST_CL_1 NUMBER, 
	CQI_DIST_CL_2 NUMBER, 
	CQI_DIST_CL_3 NUMBER, 
	CQI_DIST_CL_4 NUMBER, 
	CQI_DIST_CL_5 NUMBER, 
	CQI_DIST_CL_6 NUMBER, 
	CQI_DIST_CL_7 NUMBER, 
	CQI_DIST_CL_8 NUMBER, 
	CQI_DIST_CL_9 NUMBER, 
	CQI_DIST_CL_10 NUMBER, 
	CQI_DIST_CL_11 NUMBER, 
	CQI_DIST_CL_12 NUMBER, 
	CQI_DIST_CL_13 NUMBER, 
	CQI_DIST_CL_14 NUMBER, 
	CQI_DIST_CL_15 NUMBER, 
	CQI_DIST_CL_16 NUMBER, 
	CQI_DIST_CL_17 NUMBER, 
	CQI_DIST_CL_18 NUMBER, 
	CQI_DIST_CL_19 NUMBER, 
	CQI_DIST_CL_20 NUMBER, 
	CQI_DIST_CL_21 NUMBER, 
	CQI_DIST_CL_22 NUMBER, 
	CQI_DIST_CL_23 NUMBER, 
	CQI_DIST_CL_24 NUMBER, 
	CQI_DIST_CL_25 NUMBER, 
	CQI_DIST_CL_26 NUMBER, 
	CQI_DIST_CL_27 NUMBER, 
	CQI_DIST_CL_28 NUMBER, 
	CQI_DIST_CL_29 NUMBER, 
	CQI_DIST_CL_30 NUMBER, 
	CQI_FAILED NUMBER, 
	MAC_D_PDU_656 NUMBER, 
	AVE_MAC_D_PDU_BUFF_DELAY NUMBER, 
	MIN_MAC_D_PDU_BUFF_DELAY NUMBER, 
	MAX_MAC_D_PDU_BUFF_DELAY NUMBER, 
	TTI_NOT_SCHED_DATA_IN_BUFF NUMBER, 
	TTI_NOT_SEND_DATA_FROM_BUFF NUMBER, 
	DISC_MAC_HS_PDU_T1 NUMBER, 
	DISC_MAC_HS_PDU_MAX_RETRANS NUMBER, 
	DISC_MAC_HS_PDU_OTH_REASON NUMBER, 
	ORIG_TRANS_1_CODE_QPSK NUMBER, 
	ORIG_TRANS_2_CODE_QPSK NUMBER, 
	ORIG_TRANS_3_CODE_QPSK NUMBER, 
	ORIG_TRANS_4_CODE_QPSK NUMBER, 
	ORIG_TRANS_5_CODE_QPSK NUMBER, 
	ORIG_TRANS_1_CODE_16QAM NUMBER, 
	ORIG_TRANS_2_CODE_16QAM NUMBER, 
	ORIG_TRANS_3_CODE_16QAM NUMBER, 
	ORIG_TRANS_4_CODE_16QAM NUMBER, 
	ORIG_TRANS_5_CODE_16QAM NUMBER, 
	RETRANS_1_CODE_QPSK NUMBER, 
	RETRANS_2_CODE_QPSK NUMBER, 
	RETRANS_3_CODE_QPSK NUMBER, 
	RETRANS_4_CODE_QPSK NUMBER, 
	RETRANS_5_CODE_QPSK NUMBER, 
	RETRANS_1_CODE_16QAM NUMBER, 
	RETRANS_2_CODE_16QAM NUMBER, 
	RETRANS_3_CODE_16QAM NUMBER, 
	RETRANS_4_CODE_16QAM NUMBER, 
	RETRANS_5_CODE_16QAM NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_0 NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_1 NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_2 NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_3 NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_4 NUMBER, 
	HS_SCCH_PWR_DIST_CLASS_5 NUMBER, 
	HS_SCCH_PWR_SUM NUMBER, 
	HSDPA_USERS_0_1_IN_CELLS NUMBER, 
	HSDPA_USERS_0_2_IN_CELLS NUMBER, 
	HSDPA_USERS_0_3_IN_CELLS NUMBER, 
	HSDPA_USERS_1_0_IN_CELLS NUMBER, 
	HSDPA_USERS_1_1_IN_CELLS NUMBER, 
	HSDPA_USERS_1_2_IN_CELLS NUMBER, 
	HSDPA_USERS_2_0_IN_CELLS NUMBER, 
	HSDPA_USERS_2_1_IN_CELLS NUMBER, 
	HSDPA_USERS_3_0_IN_CELLS NUMBER, 
	HSDPA_BUFF_WITH_DATA_PER_TTI NUMBER, 
	ORIG_TRANS_6_CODE_QPSK NUMBER, 
	ORIG_TRANS_7_CODE_QPSK NUMBER, 
	ORIG_TRANS_8_CODE_QPSK NUMBER, 
	ORIG_TRANS_9_CODE_QPSK NUMBER, 
	ORIG_TRANS_10_CODE_QPSK NUMBER, 
	ORIG_TRANS_11_CODE_QPSK NUMBER, 
	ORIG_TRANS_12_CODE_QPSK NUMBER, 
	ORIG_TRANS_13_CODE_QPSK NUMBER, 
	ORIG_TRANS_14_CODE_QPSK NUMBER, 
	ORIG_TRANS_15_CODE_QPSK NUMBER, 
	ORIG_TRANS_6_CODE_16QAM NUMBER, 
	ORIG_TRANS_7_CODE_16QAM NUMBER, 
	ORIG_TRANS_8_CODE_16QAM NUMBER, 
	ORIG_TRANS_9_CODE_16QAM NUMBER, 
	ORIG_TRANS_10_CODE_16QAM NUMBER, 
	ORIG_TRANS_11_CODE_16QAM NUMBER, 
	ORIG_TRANS_12_CODE_16QAM NUMBER, 
	ORIG_TRANS_13_CODE_16QAM NUMBER, 
	ORIG_TRANS_14_CODE_16QAM NUMBER, 
	ORIG_TRANS_15_CODE_16QAM NUMBER, 
	RETRANS_6_CODE_QPSK NUMBER, 
	RETRANS_7_CODE_QPSK NUMBER, 
	RETRANS_8_CODE_QPSK NUMBER, 
	RETRANS_9_CODE_QPSK NUMBER, 
	RETRANS_10_CODE_QPSK NUMBER, 
	RETRANS_11_CODE_QPSK NUMBER, 
	RETRANS_12_CODE_QPSK NUMBER, 
	RETRANS_13_CODE_QPSK NUMBER, 
	RETRANS_14_CODE_QPSK NUMBER, 
	RETRANS_15_CODE_QPSK NUMBER, 
	RETRANS_6_CODE_16QAM NUMBER, 
	RETRANS_7_CODE_16QAM NUMBER, 
	RETRANS_8_CODE_16QAM NUMBER, 
	RETRANS_9_CODE_16QAM NUMBER, 
	RETRANS_10_CODE_16QAM NUMBER, 
	RETRANS_11_CODE_16QAM NUMBER, 
	RETRANS_12_CODE_16QAM NUMBER, 
	RETRANS_13_CODE_16QAM NUMBER, 
	RETRANS_14_CODE_16QAM NUMBER, 
	RETRANS_15_CODE_16QAM NUMBER, 
	RECEIVED_HS_MACD_BITS NUMBER, 
	DISCARDED_HS_MACD_BITS NUMBER, 
	MACE_PDU_RETR_00_COUNTER NUMBER, 
	MACE_PDU_RETR_01_COUNTER NUMBER, 
	MACE_PDU_RETR_02_COUNTER NUMBER, 
	MACE_PDU_RETR_03_COUNTER NUMBER, 
	MACE_PDU_RETR_04_COUNTER NUMBER, 
	MACE_PDU_RETR_05_COUNTER NUMBER, 
	MACE_PDU_RETR_06_COUNTER NUMBER, 
	MACE_PDU_RETR_07_COUNTER NUMBER, 
	MACE_PDU_RETR_08_COUNTER NUMBER, 
	MACE_PDU_RETR_09_COUNTER NUMBER, 
	MACE_PDU_RETR_10_COUNTER NUMBER, 
	MACE_PDU_RETR_11_COUNTER NUMBER, 
	MACE_PDU_RETR_12_COUNTER NUMBER, 
	MACE_PDU_DTX_COUNTER NUMBER, 
	MACE_PDU_HARQ_FAIL_COUNTER NUMBER, 
	MACE_PDU_LOST_COUNTER NUMBER, 
	MACE_PDU_RETR_UNKNOWN_COUNTER NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_01 NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_02 NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_03 NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_04 NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_05 NUMBER, 
	HSUPA_DL_PWR_DIST_CLASS_06 NUMBER, 
	HSUPA_MIN_MACD_THR NUMBER, 
	HSUPA_MAX_MACD_THR NUMBER, 
	HSUPA_AVE_MACD_THR NUMBER, 
	HSUPA_UL_PWR_MIN NUMBER, 
	HSUPA_UL_PWR_MAX NUMBER, 
	HSUPA_UL_PWR_AVG NUMBER, 
	HSUPA_UL_PWR_SAMPLE_COUNTER NUMBER, 
	HSDPA_USERS_0_4_IN_CELLS NUMBER, 
	HSDPA_USERS_0_5_IN_CELLS NUMBER, 
	HSDPA_USERS_0_6_IN_CELLS NUMBER, 
	HSDPA_USERS_1_3_IN_CELLS NUMBER, 
	HSDPA_USERS_1_4_IN_CELLS NUMBER, 
	HSDPA_USERS_1_5_IN_CELLS NUMBER, 
	HSDPA_USERS_1_6_IN_CELLS NUMBER, 
	HSDPA_USERS_2_2_IN_CELLS NUMBER, 
	HSDPA_USERS_2_3_IN_CELLS NUMBER, 
	HSDPA_USERS_2_4_IN_CELLS NUMBER, 
	HSDPA_USERS_2_5_IN_CELLS NUMBER, 
	HSDPA_USERS_2_6_IN_CELLS NUMBER, 
	HSDPA_USERS_3_1_IN_CELLS NUMBER, 
	HSDPA_USERS_3_2_IN_CELLS NUMBER, 
	HSDPA_USERS_3_3_IN_CELLS NUMBER, 
	HSDPA_USERS_3_4_IN_CELLS NUMBER, 
	HSDPA_USERS_3_5_IN_CELLS NUMBER, 
	HSDPA_USERS_3_6_IN_CELLS NUMBER, 
	HS_DSCH_CREDIT_RDCT_DUE_DLY NUMBER, 
	HS_DSCH_CREDIT_RDCT_SVRE_DLY NUMBER, 
	HS_DSCH_CREDIT_RDCT_FRM_LOSS NUMBER, 
	HS_DSCH_CREDIT_RDCT_BUF_FULL NUMBER, 
	UPH_SERVING_00 NUMBER, 
	UPH_SERVING_01 NUMBER, 
	UPH_SERVING_02 NUMBER, 
	UPH_SERVING_03 NUMBER, 
	UPH_SERVING_04 NUMBER, 
	UPH_SERVING_05 NUMBER, 
	UPH_SERVING_06 NUMBER, 
	UPH_SERVING_07 NUMBER, 
	UPH_SERVING_08 NUMBER, 
	UPH_SERVING_09 NUMBER, 
	UPH_SERVING_10 NUMBER, 
	UPH_SERVING_11 NUMBER, 
	UPH_SERVING_12 NUMBER, 
	UPH_SERVING_13 NUMBER, 
	UPH_SERVING_14 NUMBER, 
	UPH_SERVING_15 NUMBER, 
	UPH_SERVING_16 NUMBER, 
	UPH_SERVING_17 NUMBER, 
	UPH_SERVING_18 NUMBER, 
	UPH_SERVING_19 NUMBER, 
	UPH_SERVING_20 NUMBER, 
	UPH_SERVING_21 NUMBER, 
	UPH_SERVING_22 NUMBER, 
	UPH_SERVING_23 NUMBER, 
	UPH_SERVING_24 NUMBER, 
	UPH_SERVING_25 NUMBER, 
	UPH_SERVING_26 NUMBER, 
	UPH_SERVING_27 NUMBER, 
	UPH_SERVING_28 NUMBER, 
	UPH_SERVING_29 NUMBER, 
	UPH_SERVING_30 NUMBER, 
	UPH_SERVING_31 NUMBER, 
	UPH_NON_SERVING_00 NUMBER, 
	UPH_NON_SERVING_01 NUMBER, 
	UPH_NON_SERVING_02 NUMBER, 
	UPH_NON_SERVING_03 NUMBER, 
	UPH_NON_SERVING_04 NUMBER, 
	UPH_NON_SERVING_05 NUMBER, 
	UPH_NON_SERVING_06 NUMBER, 
	UPH_NON_SERVING_07 NUMBER, 
	UPH_NON_SERVING_08 NUMBER, 
	UPH_NON_SERVING_09 NUMBER, 
	UPH_NON_SERVING_10 NUMBER, 
	UPH_NON_SERVING_11 NUMBER, 
	UPH_NON_SERVING_12 NUMBER, 
	UPH_NON_SERVING_13 NUMBER, 
	UPH_NON_SERVING_14 NUMBER, 
	UPH_NON_SERVING_15 NUMBER, 
	UPH_NON_SERVING_16 NUMBER, 
	UPH_NON_SERVING_17 NUMBER, 
	UPH_NON_SERVING_18 NUMBER, 
	UPH_NON_SERVING_19 NUMBER, 
	UPH_NON_SERVING_20 NUMBER, 
	UPH_NON_SERVING_21 NUMBER, 
	UPH_NON_SERVING_22 NUMBER, 
	UPH_NON_SERVING_23 NUMBER, 
	UPH_NON_SERVING_24 NUMBER, 
	UPH_NON_SERVING_25 NUMBER, 
	UPH_NON_SERVING_26 NUMBER, 
	UPH_NON_SERVING_27 NUMBER, 
	UPH_NON_SERVING_28 NUMBER, 
	UPH_NON_SERVING_29 NUMBER, 
	UPH_NON_SERVING_30 NUMBER, 
	UPH_NON_SERVING_31 NUMBER, 
	NON_SERVING_ERGCH_COMMANDS NUMBER, 
	FRACT_LOAD_DISTR_CLASS_00 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_01 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_02 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_03 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_04 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_05 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_06 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_07 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_08 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_09 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_10 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_11 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_12 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_13 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_14 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_15 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_16 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_17 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_18 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_19 NUMBER, 
	FRACT_LOAD_DISTR_CLASS_20 NUMBER, 
	HSUPA_NUMBER_OF_HAPPY_BITS NUMBER, 
	HSUPA_NUMBER_OF_UNHAPPY_BITS NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_01 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_02 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_03 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_04 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_05 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_06 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_07 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_08 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_09 NUMBER, 
	SAMPLE_HS_PDSCH_PWR_CLASS_10 NUMBER, 
	DROP_MAC_D_PDU_BTS_OWFL_656 NUMBER, 
	DROP_MAC_D_PDU_MAX_RETX_TOT NUMBER, 
	DROP_MAC_D_PDU_MAX_RETX_656 NUMBER, 
	DROP_MAC_D_PDU_OTH_REASON_TOT NUMBER, 
	DROP_MAC_D_PDU_OTH_REASON_656 NUMBER, 
	ORIG_TRANS_MAC_EHS_64QAM NUMBER, 
	RETRANS_MAC_EHS_64QAM NUMBER, 
	SUM_ACTIVE_CPC_USERS NUMBER, 
	MAX_ACTIVE_CPC_USERS NUMBER, 
	SUM_CPC_CONFIGURED_USERS NUMBER, 
	MAX_CPC_CONFIGURED_USERS NUMBER, 
	NUMBER_OF_NON_DTX_DPCCH_SLOTS NUMBER, 
	NUMBER_OF_DPCCH_SLOTS NUMBER, 
	HSUPA_PWR_RATIO_DISTR_CLASS_01 NUMBER, 
	HSUPA_PWR_RATIO_DISTR_CLASS_02 NUMBER, 
	HSUPA_PWR_RATIO_DISTR_CLASS_03 NUMBER, 
	HSUPA_PWR_RATIO_DISTR_CLASS_04 NUMBER, 
	HSUPA_PWR_RATIO_DISTR_CLASS_05 NUMBER, 
	AVG_HSUPA_DL_PWR_CONTR_CHN NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_00 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_01 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_02 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_03 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_04 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_05 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_06 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_07 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_08 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_09 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_10 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_11 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_12 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_13 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_14 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_15 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_16 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_17 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_18 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_19 NUMBER, 
	UNHAPPY_FRACT_LOAD_DISTR_C_20 NUMBER, 
	MACE_PDUS_2MS_TTI NUMBER, 
	MACE_PDUS_10MS_TTI NUMBER, 
	MACE_PDU_DATA_2MS_TTI NUMBER, 
	MACE_PDU_DATA_10MS_TTI NUMBER, 
	SUM_HSUPA_USERS_2MS_TTI NUMBER, 
	SUM_HSUPA_USERS_10MS_TTI NUMBER, 
	DENOM_HSUPA_USERS NUMBER, 
	DENOM_CPC_USERS NUMBER, 
	ACTIVE_DC_HSDPA_USERS_2C_SUM NUMBER, 
	ACTIVE_DC_HSDPA_USERS_1C_SUM NUMBER, 
	CAPABLE_DC_HSDPA_USERS_SUM NUMBER, 
	TTI_DC_HSDPA_USER_PRIMARY_1C NUMBER, 
	TTI_DC_HSDPA_USER_SECONDARY_1C NUMBER, 
	TTI_DC_HSDPA_USER_PRIMARY_2C NUMBER, 
	TTI_DC_HSDPA_USER_SECONDARY_2C NUMBER, 
	TTI_SCHED_MIMO_S NUMBER, 
	TTI_SCHED_MIMO_D NUMBER, 
	ORIG_TRANS_MAC_EHS_PDU_MIMO_D NUMBER, 
	RETRANS_MAC_EHS_PDU_MIMO_D NUMBER, 
	CQI_CORR_MIMO_D_CLASS0 NUMBER, 
	CQI_CORR_MIMO_D_CLASS1 NUMBER, 
	CQI_CORR_MIMO_D_CLASS2 NUMBER, 
	CQI_CORR_MIMO_D_CLASS3 NUMBER, 
	CQI_CORR_MIMO_D_CLASS4 NUMBER, 
	CQI_CORR_MIMO_D_CLASS5 NUMBER, 
	CQI_CORR_MIMO_D_CLASS6 NUMBER, 
	CQI_CORR_MIMO_D_CLASS7 NUMBER, 
	CQI_CORR_MIMO_D_CLASS8 NUMBER, 
	CQI_CORR_MIMO_D_CLASS9 NUMBER, 
	CQI_CORR_MIMO_D_CLASS10 NUMBER, 
	CQI_CORR_MIMO_D_CLASS11 NUMBER, 
	CQI_CORR_MIMO_D_CLASS12 NUMBER, 
	CQI_CORR_MIMO_D_CLASS13 NUMBER, 
	CQI_CORR_MIMO_D_CLASS14 NUMBER, 
	CQI_CORR_MIMO_D_CLASS15 NUMBER, 
	CQI_CORR_MIMO_D_CLASS16 NUMBER, 
	CQI_CORR_MIMO_D_CLASS17 NUMBER, 
	CQI_CORR_MIMO_D_CLASS18 NUMBER, 
	MIMO_D_UE_ACT_SUM NUMBER, 
	HSDPA_USERS_0_7_IN_CELLS NUMBER, 
	HSDPA_USERS_0_8_IN_CELLS NUMBER, 
	HSDPA_USERS_1_7_IN_CELLS NUMBER, 
	HSDPA_USERS_1_8_IN_CELLS NUMBER, 
	HSDPA_USERS_2_7_IN_CELLS NUMBER, 
	HSDPA_USERS_4_0_IN_CELLS NUMBER, 
	HSDPA_USERS_4_1_IN_CELLS NUMBER, 
	HSDPA_USERS_4_2_IN_CELLS NUMBER, 
	HSDPA_USERS_4_3_IN_CELLS NUMBER, 
	HSDPA_USERS_4_4_IN_CELLS NUMBER, 
	HSDPA_USERS_4_5_IN_CELLS NUMBER, 
	MC_HSDPA_DATA_RECEIVED NUMBER, 
	MC_HSDPA_DATA_DISCARDED NUMBER, 
	EDCH_16QAM_UE_ACT_SUM NUMBER, 
	MACE_PDU_RX_COR_16QAM NUMBER, 
	MACE_PDU_RX_RETR_16QAM NUMBER, 
	RES_FRACT_LOAD_CLASS_00 NUMBER, 
	RES_FRACT_LOAD_CLASS_01 NUMBER, 
	RES_FRACT_LOAD_CLASS_02 NUMBER, 
	RES_FRACT_LOAD_CLASS_03 NUMBER, 
	RES_FRACT_LOAD_CLASS_04 NUMBER, 
	RES_FRACT_LOAD_CLASS_05 NUMBER, 
	RES_FRACT_LOAD_CLASS_06 NUMBER, 
	RES_FRACT_LOAD_CLASS_07 NUMBER, 
	RES_FRACT_LOAD_CLASS_08 NUMBER, 
	RES_FRACT_LOAD_CLASS_09 NUMBER, 
	RES_FRACT_LOAD_CLASS_10 NUMBER, 
	RES_FRACT_LOAD_CLASS_11 NUMBER, 
	RES_FRACT_LOAD_CLASS_12 NUMBER, 
	RES_FRACT_LOAD_CLASS_13 NUMBER, 
	RES_FRACT_LOAD_CLASS_14 NUMBER, 
	RES_FRACT_LOAD_CLASS_15 NUMBER, 
	RES_FRACT_LOAD_CLASS_16 NUMBER, 
	RES_FRACT_LOAD_CLASS_17 NUMBER, 
	RES_FRACT_LOAD_CLASS_18 NUMBER, 
	RES_FRACT_LOAD_CLASS_19 NUMBER, 
	RES_FRACT_LOAD_CLASS_20 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_00 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_01 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_02 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_03 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_04 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_05 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_06 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_07 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_08 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_09 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_10 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_11 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_12 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_13 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_14 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_15 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_16 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_17 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_18 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_19 NUMBER, 
	UNHAPPY_RES_FRACT_LOAD_20 NUMBER, 
	HSDPA_USERS_ONE_TTI NUMBER, 
	HSDPA_USERS_TWO_TTI NUMBER, 
	HSDPA_USERS_THREE_TTI NUMBER, 
	HSDPA_USERS_FOUR_TTI NUMBER, 
	SUM_OPER_TIME_HSFACH_RX NUMBER, 
	SUM_OPER_TIME_HSFACH_DRX NUMBER, 
	EFACH_UE_SUM NUMBER, 
	MAX_EFACH_USERS NUMBER, 
	DND_CEDCH_RSRC NUMBER, 
	ACTIVE_DC_MIMO_USERS_2C_SUM NUMBER, 
	ACTIVE_DC_MIMO_USERS_1C_SUM NUMBER, 
	CAPABLE_DC_MIMO_USERS_SUM NUMBER, 
	TTI_DCMIMO_HSDPA_USER_PC_1C_D NUMBER, 
	TTI_DCMIMO_HSDPA_USER_PC_1C_S NUMBER, 
	TTI_DCMIMO_HSDPA_USER_SC_1C_D NUMBER, 
	TTI_DCMIMO_HSDPA_USER_SC_1C_S NUMBER, 
	TTI_DCMIMO_HSDPA_USER_2C_D_D NUMBER, 
	TTI_DCMIMO_HSDPA_USER_2C_D_S NUMBER, 
	TTI_DCMIMO_HSDPA_USER_2C_S_D NUMBER, 
	TTI_DCMIMO_HSDPA_USER_2C_S_S NUMBER, 
	U_DATA_FRAMES_DL_EFACH NUMBER, 
	C_DATA_FRAMES_DL_EFACH NUMBER, 
	 CONSTRAINT UMTS_C_HSDPAW_WCEL_BHP_PK PRIMARY KEY (PERIOD_START_TIME, OSSRC, WCELL_GID)
  USING INDEX TABLESPACE TBS_INDEXES_UMTS_DAIL2  LOCAL
 ) TABLESPACE TBS_UMTS_C_NSN_DAILY 
  PARTITION BY RANGE (PERIOD_START_TIME) INTERVAL (NUMTODSINTERVAL (1,'DAY'))
  SUBPARTITION BY LIST (OSSRC) 
  SUBPARTITION TEMPLATE ( 
    SUBPARTITION RC1 values ( 'OSSRC1' ), 
    SUBPARTITION RC2 values ( 'OSSRC2' ), 
    SUBPARTITION RC3 values ( 'OSSRC3' ) ) 
 (
 PARTITION UMTS_C_NSN_20150301  VALUES LESS THAN (TO_DATE(' 2015-03-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
 ); 
 