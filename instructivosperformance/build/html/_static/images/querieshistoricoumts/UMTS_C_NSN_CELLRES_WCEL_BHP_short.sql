  CREATE TABLE UMTS_C_NSN_CELLRES_WCEL_BHP 
   (	PERIOD_START_TIME DATE, 
	OSSRC VARCHAR2(10), 
	WCELL_GID NUMBER, 
	WBTS_GID NUMBER, 
	RNC_GID NUMBER, 
	AMR_CODE_LOAD_BELOW_TARGET NUMBER, 
	AMR_CODE_LOAD_OVERLOAD NUMBER, 
	AMR_CODE_LOAD_OVER_TARGET NUMBER, 
	AMR_CODE_LOAD_UNDERLOAD NUMBER, 
	AMR_TRANSM_LOAD_BELOW_TARGET NUMBER, 
	AMR_TRANSM_LOAD_OVERLOAD NUMBER, 
	AMR_TRANSM_LOAD_OVER_TARGET NUMBER, 
	AMR_TRANSM_LOAD_UNDERLOAD NUMBER, 
	AMR_TXPOW_LOAD_BELOW_TARGET NUMBER, 
	AMR_TXPOW_LOAD_OVERLOAD NUMBER, 
	AMR_TXPOW_LOAD_OVER_TARGET NUMBER, 
	AMR_TXPOW_LOAD_UNDERLOAD NUMBER, 
	AVAIL_WCELL_BLOCKED_BY_USER NUMBER, 
	AVAIL_WCELL_EXISTS_IN_RNW_DB NUMBER, 
	AVAIL_WCELL_IN_POWER_SAVING NUMBER, 
	AVAIL_WCELL_IN_WO_STATE NUMBER, 
	AVE_AVAIL_PERC_POOL_CAPA_DL NUMBER, 
	AVE_AVAIL_PERC_POOL_CAPA_UL NUMBER, 
	AVE_AVAIL_POOL_CAPA_DL NUMBER, 
	AVE_AVAIL_POOL_CAPA_UL NUMBER, 
	AVE_CE_USED_AMR NUMBER, 
	AVE_CE_USED_CS_CONV_64 NUMBER, 
	AVE_CE_USED_CS_STR_14_4 NUMBER, 
	AVE_CE_USED_CS_STR_57_6 NUMBER, 
	AVE_CE_USED_PS_BGR_8_DL NUMBER, 
	AVE_CE_USED_PS_BGR_16_DL NUMBER, 
	AVE_CE_USED_PS_BGR_32_DL NUMBER, 
	AVE_CE_USED_PS_BGR_64_DL NUMBER, 
	AVE_CE_USED_PS_BGR_128_DL NUMBER, 
	AVE_CE_USED_PS_BGR_256_DL NUMBER, 
	AVE_CE_USED_PS_BGR_384_DL NUMBER, 
	AVE_CE_USED_PS_BGR_8_UL NUMBER, 
	AVE_CE_USED_PS_BGR_16_UL NUMBER, 
	AVE_CE_USED_PS_BGR_32_UL NUMBER, 
	AVE_CE_USED_PS_BGR_64_UL NUMBER, 
	AVE_CE_USED_PS_BGR_128_UL NUMBER, 
	AVE_CE_USED_PS_BGR_256_UL NUMBER, 
	AVE_CE_USED_PS_BGR_384_UL NUMBER, 
	AVE_CE_USED_PS_INT_8_DL NUMBER, 
	AVE_CE_USED_PS_INT_16_DL NUMBER, 
	AVE_CE_USED_PS_INT_32_DL NUMBER, 
	AVE_CE_USED_PS_INT_64_DL NUMBER, 
	AVE_CE_USED_PS_INT_128_DL NUMBER, 
	AVE_CE_USED_PS_INT_256_DL NUMBER, 
	AVE_CE_USED_PS_INT_384_DL NUMBER, 
	AVE_CE_USED_PS_INT_8_UL NUMBER, 
	AVE_CE_USED_PS_INT_16_UL NUMBER, 
	AVE_CE_USED_PS_INT_32_UL NUMBER, 
	AVE_CE_USED_PS_INT_64_UL NUMBER, 
	AVE_CE_USED_PS_INT_128_UL NUMBER, 
	AVE_CE_USED_PS_INT_256_UL NUMBER, 
	AVE_CE_USED_PS_INT_384_UL NUMBER, 
	AVE_CE_USED_PS_STR_8_DL NUMBER, 
	AVE_CE_USED_PS_STR_16_DL NUMBER, 
	AVE_CE_USED_PS_STR_32_DL NUMBER, 
	AVE_CE_USED_PS_STR_64_DL NUMBER, 
	AVE_CE_USED_PS_STR_128_DL NUMBER, 
	AVE_CE_USED_PS_STR_256_DL NUMBER, 
	AVE_CE_USED_PS_STR_384_DL NUMBER, 
	AVE_CE_USED_PS_STR_8_UL NUMBER, 
	AVE_CE_USED_PS_STR_16_UL NUMBER, 
	AVE_CE_USED_PS_STR_32_UL NUMBER, 
	AVE_CE_USED_PS_STR_64_UL NUMBER, 
	AVE_CE_USED_PS_STR_128_UL NUMBER, 
	AVE_FACH_UDATA_TP_SCCPCH NUMBER, 
	AVE_FACH_UDATA_TP_SCCPCH_PCH NUMBER, 
	AVE_FACH_USER_TOT_TPUT NUMBER, 
	AVE_FACH_U_TOT_TPUT_SCCP_PCH NUMBER, 
	AVE_HSPA_DL_POWER NUMBER, 
	AVE_LNRT_CLASS_0 NUMBER, 
	AVE_LNRT_CLASS_1 NUMBER, 
	AVE_LNRT_CLASS_2 NUMBER, 
	AVE_LNRT_CLASS_3 NUMBER, 
	AVE_LNRT_CLASS_4 NUMBER, 
	AVE_LRT_CLASS_0 NUMBER, 
	AVE_LRT_CLASS_1 NUMBER, 
	AVE_LRT_CLASS_2 NUMBER, 
	AVE_LRT_CLASS_3 NUMBER, 
	AVE_LRT_CLASS_4 NUMBER, 
	AVE_PCH_THROUGHPUT NUMBER, 
	AVE_PRXTOT_CLASS_0 NUMBER, 
	AVE_PRXTOT_CLASS_1 NUMBER, 
	AVE_PRXTOT_CLASS_2 NUMBER, 
	AVE_PRXTOT_CLASS_3 NUMBER, 
	AVE_PRXTOT_CLASS_4 NUMBER, 
	AVE_PRX_NOISE NUMBER, 
	AVE_PTXTOT_CLASS_0 NUMBER, 
	AVE_PTXTOT_CLASS_1 NUMBER, 
	AVE_PTXTOT_CLASS_2 NUMBER, 
	AVE_PTXTOT_CLASS_3 NUMBER, 
	AVE_PTXTOT_CLASS_4 NUMBER, 
	AVE_PTX_NRT_CLASS_0 NUMBER, 
	AVE_PTX_NRT_CLASS_1 NUMBER, 
	AVE_PTX_NRT_CLASS_2 NUMBER, 
	AVE_PTX_NRT_CLASS_3 NUMBER, 
	AVE_PTX_NRT_CLASS_4 NUMBER, 
	AVE_PTX_RT_CLASS_0 NUMBER, 
	AVE_PTX_RT_CLASS_1 NUMBER, 
	AVE_PTX_RT_CLASS_2 NUMBER, 
	AVE_PTX_RT_CLASS_3 NUMBER, 
	AVE_PTX_RT_CLASS_4 NUMBER, 
	AVE_PTX_TARGET_PS NUMBER, 
	AVE_RACH_DATA_THROUGHPUT NUMBER, 
	AVE_RACH_DECOD_MSGS NUMBER, 
	AVE_RACH_LOAD NUMBER, 
	AVE_RACH_THROUGHPUT NUMBER, 
	AVE_RESID_UL_POWER NUMBER, 
	AVE_SCCPCH_INC_PCH_LOAD NUMBER, 
	AVE_SCCPCH_LOAD NUMBER, 
	AVE_SUCC_DECOD_MSGS NUMBER, 
	AVE_TRX_FOR_RL_IN_CELL NUMBER, 
	AVG_ACTIVE_NON_HSDPA_PWR NUMBER, 
	AVG_ACT_NON_HSDPA_PWR_DENOM NUMBER, 
	AVG_NON_HSDPA_PWR NUMBER, 
	AVG_NON_HSDPA_PWR_DENOM NUMBER, 
	BTS_HSUPA_HW_LIMITED_DUR NUMBER, 
	BTS_HSUPA_HW_NOT_LIMITED_DUR NUMBER, 
	BTS_HSUPA_NO_HW_CAPA_DUR NUMBER, 
	CELL_RESOURCE_SPARE_1 NUMBER, 
	CELL_RESOURCE_SPARE_2 NUMBER, 
	CELL_RESOURCE_SPARE_3 NUMBER, 
	CELL_RESOURCE_SPARE_4 NUMBER, 
	CELL_RESOURCE_SPARE_5 NUMBER, 
	CELL_RESOURCE_SPARE_6 NUMBER, 
	CE_SAMPLE_AMOUNT NUMBER, 
	CHAN_CODE_SF4_REQUEST NUMBER, 
	CHAN_CODE_SF8_REQUEST NUMBER, 
	CHAN_CODE_SF16_REQUEST NUMBER, 
	CHAN_CODE_SF32_REQUEST NUMBER, 
	CHAN_CODE_SF64_REQUEST NUMBER, 
	CHAN_CODE_SF128_REQUEST NUMBER, 
	CHAN_CODE_SF256_REQUEST NUMBER, 
	CH_CODE_DOWNG_NRT_DCH NUMBER, 
	CH_CODE_DOWNG_RT NUMBER, 
	CODE_CAPACITY NUMBER, 
	DENOM_CODE_CAPACITY NUMBER, 
	DENOM_EDCH_MACD_BGR NUMBER, 
	DENOM_EDCH_MACD_INTERA NUMBER, 
	DENOM_EDCH_MACD_STREA NUMBER, 
	DENOM_HSDPA_USERS_PER_CELL NUMBER, 
	DENOM_HSDSCH_MACD_BGR NUMBER, 
	DENOM_HSDSCH_MACD_INTERA NUMBER, 
	DENOM_HSDSCH_MACD_STREA NUMBER, 
	DENOM_HSUPA_USERS_PER_CELL NUMBER, 
	DENOM_RACH_ACK_PREAMBLES NUMBER, 
	DURA_HSDPA_5_CODE NUMBER, 
	DURA_HSDPA_6_CODE NUMBER, 
	DURA_HSDPA_7_CODE NUMBER, 
	DURA_HSDPA_8_CODE NUMBER, 
	DURA_HSDPA_9_CODE NUMBER, 
	DURA_HSDPA_10_CODE NUMBER, 
	DURA_HSDPA_11_CODE NUMBER, 
	DURA_HSDPA_12_CODE NUMBER, 
	DURA_HSDPA_13_CODE NUMBER, 
	DURA_HSDPA_14_CODE NUMBER, 
	DURA_HSDPA_15_CODE NUMBER, 
	DURA_HSDPA_USERS_1 NUMBER, 
	DURA_HSDPA_USERS_113_OR_MORE NUMBER, 
	DURA_HSDPA_USERS_17_OR_18 NUMBER, 
	DURA_HSDPA_USERS_17_TO_20 NUMBER, 
	DURA_HSDPA_USERS_21_TO_24 NUMBER, 
	DURA_HSDPA_USERS_25_TO_28 NUMBER, 
	DURA_HSDPA_USERS_29_TO_32 NUMBER, 
	DURA_HSDPA_USERS_3 NUMBER, 
	DURA_HSDPA_USERS_33_TO_36 NUMBER, 
	DURA_HSDPA_USERS_37_TO_40 NUMBER, 
	DURA_HSDPA_USERS_41_TO_44 NUMBER, 
	DURA_HSDPA_USERS_45_TO_48 NUMBER, 
	DURA_HSDPA_USERS_49_TO_52 NUMBER, 
	DURA_HSDPA_USERS_53_TO_56 NUMBER, 
	DURA_HSDPA_USERS_57_TO_60 NUMBER, 
	DURA_HSDPA_USERS_61_TO_64 NUMBER, 
	DURA_HSDPA_USERS_65_TO_72 NUMBER, 
	DURA_HSDPA_USERS_73_TO_80 NUMBER, 
	DURA_HSDPA_USERS_81_TO_96 NUMBER, 
	DURA_HSDPA_USERS_97_TO_112 NUMBER, 
	DURA_HSUPA_USERS_113_OR_MORE NUMBER, 
	DURA_HSUPA_USERS_21_TO_24 NUMBER, 
	DURA_HSUPA_USERS_25_TO_28 NUMBER, 
	DURA_HSUPA_USERS_29_TO_32 NUMBER, 
	DURA_HSUPA_USERS_33_TO_36 NUMBER, 
	DURA_HSUPA_USERS_37_TO_40 NUMBER, 
	DURA_HSUPA_USERS_41_TO_44 NUMBER, 
	DURA_HSUPA_USERS_45_TO_48 NUMBER, 
	DURA_HSUPA_USERS_49_TO_52 NUMBER, 
	DURA_HSUPA_USERS_53_TO_56 NUMBER, 
	DURA_HSUPA_USERS_57_TO_60 NUMBER, 
	DURA_HSUPA_USERS_61_TO_64 NUMBER, 
	DURA_HSUPA_USERS_65_TO_72 NUMBER, 
	DURA_HSUPA_USERS_73_TO_80 NUMBER, 
	DURA_HSUPA_USERS_81_TO_96 NUMBER, 
	DURA_HSUPA_USERS_97_TO_112 NUMBER, 
	DUR_HSDPA_NO_USERS NUMBER, 
	DUR_HSDPA_USERS_11_OR_12 NUMBER, 
	DUR_HSDPA_USERS_13_OR_14 NUMBER, 
	DUR_HSDPA_USERS_15_OR_16 NUMBER, 
	DUR_HSDPA_USERS_1_OR_2 NUMBER, 
	DUR_HSDPA_USERS_3_OR_4 NUMBER, 
	DUR_HSDPA_USERS_5_OR_6 NUMBER, 
	DUR_HSDPA_USERS_7_OR_8 NUMBER, 
	DUR_HSDPA_USERS_9_OR_10 NUMBER, 
	DUR_HSUPA_NO_USERS NUMBER, 
	DUR_HSUPA_USERS_1 NUMBER, 
	DUR_HSUPA_USERS_11_OR_12 NUMBER, 
	DUR_HSUPA_USERS_13_OR_14 NUMBER, 
	DUR_HSUPA_USERS_15_OR_16 NUMBER, 
	DUR_HSUPA_USERS_17_OR_18 NUMBER, 
	DUR_HSUPA_USERS_19_OR_20 NUMBER, 
	DUR_HSUPA_USERS_1_OR_2 NUMBER, 
	DUR_HSUPA_USERS_3 NUMBER, 
	DUR_HSUPA_USERS_3_OR_4 NUMBER, 
	DUR_HSUPA_USERS_5_OR_6 NUMBER, 
	DUR_HSUPA_USERS_7_OR_8 NUMBER, 
	DUR_HSUPA_USERS_9_OR_10 NUMBER, 
	FACH_THRPUT_SAB_USER NUMBER, 
	FACH_THRPUT_SAB_USER_DEN NUMBER, 
	FACH_THRPUT_SAB_USER_SIGN NUMBER, 
	FACH_THRPUT_SAB_USER_SIG_DEN NUMBER, 
	FACH_USER_TOT_TPUT_DENOM_0 NUMBER, 
	FACH_USER_TOT_TPUT_DENOM_1 NUMBER, 
	FACH_U_DATA_TPUT_DENOM_0 NUMBER, 
	FACH_U_DATA_TPUT_DENOM_1 NUMBER, 
	HSPA_DL_POWER_SAMPLES NUMBER, 
	LNRT_DENOM_0 NUMBER, 
	LNRT_DENOM_1 NUMBER, 
	LNRT_DENOM_2 NUMBER, 
	LNRT_DENOM_3 NUMBER, 
	LNRT_DENOM_4 NUMBER, 
	LRT_DENOM_0 NUMBER, 
	LRT_DENOM_1 NUMBER, 
	LRT_DENOM_2 NUMBER, 
	LRT_DENOM_3 NUMBER, 
	LRT_DENOM_4 NUMBER, 
	MAXIMUM_PRXTOTAL NUMBER, 
	MAXIMUM_PTXTOTAL NUMBER, 
	MAX_AVAIL_R99_DL_CODE NUMBER, 
	MAX_CODE_OCCUPANCE_PERCENT NUMBER, 
	MAX_HSDPA_USERS_IN_CELL NUMBER, 
	MAX_HSPA_DL_POWER NUMBER, 
	MAX_HSUPA_USERS_IN_CELL NUMBER, 
	MAX_HSUPA_USERS_IN_SERV_CELL NUMBER, 
	MAX_PRX_NOISE_VALUE NUMBER, 
	MAX_PTX_TARGET_PS NUMBER, 
	MINIMUM_PRXTOTAL NUMBER, 
	MINIMUM_PTXTOTAL NUMBER, 
	MIN_CODE_OCCUPANCY_PERCENT NUMBER, 
	MIN_HSPA_DL_POWER NUMBER, 
	MIN_PRX_NOISE_VALUE NUMBER, 
	MIN_PTX_TARGET_PS NUMBER, 
	NBR_OF_BTS_HW_CAPA_ALLOC_DL NUMBER, 
	NBR_OF_BTS_HW_CAPA_ALLOC_UL NUMBER, 
	NBR_OF_CELLS NUMBER, 
	NBR_OF_POOL_REP_DL NUMBER, 
	NBR_OF_POOL_REP_UL NUMBER, 
	NBR_OF_RLS NUMBER, 
	NBR_OF_RL_MEAS_REPS NUMBER, 
	NBR_SUCC_CODE_TREE_ALLO NUMBER, 
	NO_CODES_AVAILABLE_SF128 NUMBER, 
	NO_CODES_AVAILABLE_SF16 NUMBER, 
	NO_CODES_AVAILABLE_SF256 NUMBER, 
	NO_CODES_AVAILABLE_SF32 NUMBER, 
	NO_CODES_AVAILABLE_SF4 NUMBER, 
	NO_CODES_AVAILABLE_SF64 NUMBER, 
	NO_CODES_AVAILABLE_SF8 NUMBER, 
	PCH_THROUGHPUT_DENOM_0 NUMBER, 
	PERIOD_DURATION NUMBER, 
	PERIOD_DURATION_SUM NUMBER, 
	PRXTOT_DENOM_0 NUMBER, 
	PRXTOT_DENOM_1 NUMBER, 
	PRXTOT_DENOM_2 NUMBER, 
	PRXTOT_DENOM_3 NUMBER, 
	PRXTOT_DENOM_4 NUMBER, 
	PRX_NOISE_DENOM_1 NUMBER, 
	PTXTOT_DENOM_0 NUMBER, 
	PTXTOT_DENOM_1 NUMBER, 
	PTXTOT_DENOM_2 NUMBER, 
	PTXTOT_DENOM_3 NUMBER, 
	PTXTOT_DENOM_4 NUMBER, 
	PTX_NRT_DENOM_0 NUMBER, 
	PTX_NRT_DENOM_1 NUMBER, 
	PTX_NRT_DENOM_2 NUMBER, 
	PTX_NRT_DENOM_3 NUMBER, 
	PTX_NRT_DENOM_4 NUMBER, 
	PTX_RT_DENOM_0 NUMBER, 
	PTX_RT_DENOM_1 NUMBER, 
	PTX_RT_DENOM_2 NUMBER, 
	PTX_RT_DENOM_3 NUMBER, 
	PTX_RT_DENOM_4 NUMBER, 
	PTX_TARGET_PS_DENOM NUMBER, 
	RACH_DENOM_0 NUMBER, 
	RACH_DENOM_1 NUMBER, 
	RACH_DENOM_2 NUMBER, 
	RACH_DENOM_3 NUMBER, 
	RACH_DENOM_4 NUMBER, 
	RB_DOWNGR_DUE_DYLO_RL_POWER NUMBER, 
	RB_DOWNGR_DUE_OLC_RL_RECONF NUMBER, 
	RB_DOWNGR_DUE_OLC_TFC_SUBS NUMBER, 
	RB_DOWNGR_DUE_PBS_AAL2 NUMBER, 
	RB_DOWNGR_DUE_PBS_BTS NUMBER, 
	RB_DOWNGR_DUE_PBS_INTERF NUMBER, 
	RB_DOWNGR_DUE_PBS_INTERF_UL NUMBER, 
	RB_DOWNGR_DUE_PBS_SPREAD NUMBER, 
	RB_DOWNGR_DUE_PRE_EMP_AAL2 NUMBER, 
	RB_DOWNGR_DUE_PRE_EMP_BTS NUMBER, 
	RB_DOWNGR_DUE_PRE_EMP_INTERF NUMBER, 
	RB_DOWNGR_DUE_PRE_EMP_SPREAD NUMBER, 
	RB_DOWNGR_DUE_THRPOPT NUMBER, 
	RB_RELEASE_DUE_DYLO_RL_POWER NUMBER, 
	RB_RELEASE_DUE_OLC_RL_RECONF NUMBER, 
	RB_RELEASE_DUE_PBS_AAL2 NUMBER, 
	RB_RELEASE_DUE_PBS_BTS NUMBER, 
	RB_RELEASE_DUE_PBS_INTERF NUMBER, 
	RB_RELEASE_DUE_PBS_INTERF_UL NUMBER, 
	RB_RELEASE_DUE_PBS_SPREAD NUMBER, 
	RB_RELEASE_DUE_PRE_EMP_AAL2 NUMBER, 
	RB_RELEASE_DUE_PRE_EMP_BTS NUMBER, 
	RB_RELEASE_DUE_PRE_EMP_INTF NUMBER, 
	RB_RELEASE_DUE_PRE_EMP_SPREA NUMBER, 
	RB_RELEASE_DUE_THRPOPT NUMBER, 
	RB_REL_DUE_PRE_EMP_INTF_UL NUMBER, 
	RESID_UL_POWER_SAMPLES NUMBER, 
	RTWP_CLASS_0 NUMBER, 
	RTWP_CLASS_1 NUMBER, 
	RTWP_CLASS_10 NUMBER, 
	RTWP_CLASS_11 NUMBER, 
	RTWP_CLASS_12 NUMBER, 
	RTWP_CLASS_13 NUMBER, 
	RTWP_CLASS_14 NUMBER, 
	RTWP_CLASS_15 NUMBER, 
	RTWP_CLASS_16 NUMBER, 
	RTWP_CLASS_17 NUMBER, 
	RTWP_CLASS_18 NUMBER, 
	RTWP_CLASS_19 NUMBER, 
	RTWP_CLASS_2 NUMBER, 
	RTWP_CLASS_20 NUMBER, 
	RTWP_CLASS_21 NUMBER, 
	RTWP_CLASS_3 NUMBER, 
	RTWP_CLASS_4 NUMBER, 
	RTWP_CLASS_5 NUMBER, 
	RTWP_CLASS_6 NUMBER, 
	RTWP_CLASS_7 NUMBER, 
	RTWP_CLASS_8 NUMBER, 
	RTWP_CLASS_9 NUMBER, 
	SCCPCH_LOAD_DENOM_0 NUMBER, 
	SCCPCH_LOAD_DENOM_1 NUMBER, 
	SUM_EDCH_MACD_BGR NUMBER, 
	SUM_EDCH_MACD_INTERA NUMBER, 
	SUM_EDCH_MACD_STREA NUMBER, 
	SUM_HSDPA_USERS_IN_CELL NUMBER, 
	SUM_HSDSCH_MACD_BGR NUMBER, 
	SUM_HSDSCH_MACD_INTERA NUMBER, 
	SUM_HSDSCH_MACD_STREA NUMBER, 
	SUM_HSUPA_USERS_IN_CELL NUMBER, 
	SUM_HSUPA_USERS_IN_SERV_CELL NUMBER, 
	SUM_RACH_ACK_PREAMBLES NUMBER, 
	SUM_SQR_FOR_RL_IN_CELL NUMBER, 
	TX_CODE_PWR_CLASS_0 NUMBER, 
	TX_CODE_PWR_CLASS_1 NUMBER, 
	TX_CODE_PWR_CLASS_2 NUMBER, 
	TX_CODE_PWR_CLASS_3 NUMBER, 
	TX_CODE_PWR_CLASS_4 NUMBER, 
	TX_CODE_PWR_CLASS_5 NUMBER, 
	TX_CODE_PWR_CLASS_6 NUMBER, 
	TX_CODE_PWR_CLASS_7 NUMBER, 
	TX_CODE_PWR_CLASS_8 NUMBER, 
	TX_CODE_PWR_CLASS_9 NUMBER, 
	TX_CR_PWR_CLASS_0 NUMBER, 
	TX_CR_PWR_CLASS_1 NUMBER, 
	TX_CR_PWR_CLASS_10 NUMBER, 
	TX_CR_PWR_CLASS_2 NUMBER, 
	TX_CR_PWR_CLASS_3 NUMBER, 
	TX_CR_PWR_CLASS_4 NUMBER, 
	TX_CR_PWR_CLASS_5 NUMBER, 
	TX_CR_PWR_CLASS_6 NUMBER, 
	TX_CR_PWR_CLASS_7 NUMBER, 
	TX_CR_PWR_CLASS_8 NUMBER, 
	TX_CR_PWR_CLASS_9 NUMBER, 
	WBTS_RESET_DUE_BTS NUMBER, 
	WBTS_RESET_DUE_RNC NUMBER, 
	WBTS_RESET_DUE_USER_ACTION NUMBER, 
	WBTS_RESET_SIGN_UNIT_FAIL NUMBER, 
	WCELL_BLO_TO_WO_SUCCESS NUMBER, 
	WCELL_POWER_SAVING_MODE_ACT NUMBER, 
	WCELL_TO_BLO_BY_BTS NUMBER, 
	WCELL_TO_BLO_BY_BTS_BLOCK NUMBER, 
	WCELL_TO_BLO_BY_LINK_FAIL NUMBER, 
	WCELL_TO_BLO_BY_MEAS_FAIL NUMBER, 
	WCELL_TO_BLO_BY_SHUT_DOWN NUMBER, 
	WCELL_TO_BLO_BY_SYS_FAIL NUMBER, 
	WCELL_TO_BLO_BY_USER NUMBER, 
	WCELL_TO_BLO_IN_INIT NUMBER, 
	WCELL_TO_WO_UNSUCC_BTS NUMBER, 
	WCELL_TO_WO_UNSUCC_BTS_BLOCK NUMBER, 
	WCELL_TO_WO_UNSUCC_INIT NUMBER, 
	WCELL_TO_WO_UNSUCC_LINK_FAIL NUMBER, 
	WCELL_TO_WO_UNSUCC_MEAS_FAIL NUMBER, 
	WCELL_TO_WO_UNSUCC_SHUT_DOWN NUMBER, 
	WCELL_TO_WO_UNSUCC_SYS_FAIL NUMBER, 
	WCELL_TO_WO_UNSUCC_USER NUMBER, 
	ACCESS_CLASSES_BLOCKED NUMBER, 
	ACCESS_RESTR_ACTIVE_SAMPLES NUMBER, 
	BMC_DATA_CONFIRMATION NUMBER, 
	BMC_DATA_INDICATION NUMBER, 
	BMC_DATA_REQUEST NUMBER, 
	CHAN_CODE_SF16_HS_REQUEST NUMBER, 
	CTCH_BLK_FACH_DISCARD NUMBER, 
	CTCH_BLK_SCHEDULED NUMBER, 
	MEH_ACTIVATIONS NUMBER, 
	MEH_ACTIVE_DURATION NUMBER, 
	RTWP_TOO_LOW NUMBER, 
	 CONSTRAINT UMTS_C_CELLRES_WCEL_BHP_PK PRIMARY KEY (PERIOD_START_TIME, OSSRC, WCELL_GID)
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
 