  CREATE TABLE UMTS_C_NSN_TRAFFIC_WCEL_DAY 
   (	PERIOD_START_TIME DATE, 
	OSSRC VARCHAR2(10), 
	WCELL_GID NUMBER, 
	WBTS_GID NUMBER, 
	RNC_GID NUMBER, 
	PERIOD_DURATION NUMBER, 
	PERIOD_DURATION_SUM NUMBER, 
	DCH_REQ_LINK_SRNC NUMBER, 
	DCH_REQ_LINK_REJ_UL_SRNC NUMBER, 
	DCH_REQ_LINK_REJ_DL_SRNC NUMBER, 
	DCH_REQ_RRC_CONN_SRNC NUMBER, 
	DCH_DHO_REQ_LINK_SRNC NUMBER, 
	DCH_DHO_REQ_LINK_REJ_SRNC NUMBER, 
	DCH_ALLO_LINK_1_7_SRNC NUMBER, 
	DCH_ALLO_LINK_3_4_SRNC NUMBER, 
	DCH_ALLO_LINK_13_6_SRNC NUMBER, 
	DCH_ALLO_DURA_LINK_1_7_SRNC NUMBER, 
	DCH_ALLO_DURA_LINK_3_4_SRNC NUMBER, 
	DCH_ALLO_DURA_LINK_13_6_SRNC NUMBER, 
	REQ_CS_VOICE_IN_SRNC NUMBER, 
	REQ_CS_VOICE_REJ_UL_SRNC NUMBER, 
	REQ_CS_VOICE_REJ_DL_SRNC NUMBER, 
	RT_DCH_INIT_VOICE_SRNC NUMBER, 
	REQ_CS_VOICE_SRNC NUMBER, 
	REQ_CS_VOICE_REJ_SRNC NUMBER, 
	ALLO_FOR_AMR_4_75_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_5_15_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_5_9_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_6_7_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_7_4_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_7_95_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_10_2_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_12_2_UL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_4_75_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_5_15_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_5_9_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_6_7_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_7_4_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_7_95_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_10_2_DL_IN_SRNC NUMBER, 
	ALLO_FOR_AMR_12_2_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_4_75_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_5_15_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_5_9_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_6_7_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_7_4_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_7_95_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_10_2_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_12_2_UL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_4_75_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_5_15_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_5_9_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_6_7_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_7_4_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_7_95_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_10_2_DL_IN_SRNC NUMBER, 
	DUR_FOR_AMR_12_2_DL_IN_SRNC NUMBER, 
	REQ_CS_DATA_CONV_SRNC NUMBER, 
	REQ_CS_STREAM_SRNC NUMBER, 
	REQ_CS_CONV_REJ_UL_SRNC NUMBER, 
	REQ_CS_CONV_REJ_DL_SRNC NUMBER, 
	REQ_CS_STREAM_REJ_UL_SRNC NUMBER, 
	REQ_CS_STREAM_REJ_DL_SRNC NUMBER, 
	INI_REQ_CS_DATA_CONV_SRNC NUMBER, 
	INI_REQ_CS_STREAM_UL_SRNC NUMBER, 
	RT_REQ_DATA_CONV_SRNC NUMBER, 
	RT_REQ_DATA_CONV_REJ_SRNC NUMBER, 
	RT_REQ_DATA_STREAM_SRNC NUMBER, 
	RT_REQ_DATA_STREAM_REJ_SRNC NUMBER, 
	ALLO_TRAN_CS_CONV_28_8_SRNC NUMBER, 
	ALLO_TRAN_CS_CONV_32_IN_SRNC NUMBER, 
	ALLO_TRAN_CS_CONV_33_6_SRNC NUMBER, 
	ALLO_TRAN_CS_CONV_64_IN_SRNC NUMBER, 
	ALLO_DUR_CS_CONV_28_8_SRNC NUMBER, 
	ALLO_DUR_CS_CONV_32_IN_SRNC NUMBER, 
	ALLO_DUR_CS_CONV_33_6_SRNC NUMBER, 
	ALLO_DUR_CS_CONV_64_IN_SRNC NUMBER, 
	ALLO_NTRANS_STREAM_14_4_UL NUMBER, 
	ALLO_NTRANS_STREAM_28_8_UL NUMBER, 
	ALLO_NTRANS_STREAM_56_7_UL NUMBER, 
	ALLO_NTRANS_STREAM_14_4_DL NUMBER, 
	ALLO_NTRANS_STREAM_28_8_DL NUMBER, 
	ALLO_NTRANS_STREAM_56_7_DL NUMBER, 
	ALLO_DUR_NTRANS_STRM_14_4_UL NUMBER, 
	ALLO_DUR_NTRANS_STRM_28_8_UL NUMBER, 
	ALLO_DUR_NTRANS_STRM_56_7_UL NUMBER, 
	ALLO_DUR_NTRANS_STRM_14_4_DL NUMBER, 
	ALLO_DUR_NTRANS_STRM_28_8_DL NUMBER, 
	ALLO_DUR_NTRANS_STRM_56_7_DL NUMBER, 
	REQ_FOR_PS_CONV_SRNC NUMBER, 
	REQ_FOR_PS_STREAM_SRNC NUMBER, 
	REQ_FOR_PS_INTERA_UL_SRNC NUMBER, 
	REQ_FOR_PS_INTERA_DL_SRNC NUMBER, 
	REQ_FOR_PS_BACKG_UL_SRNC NUMBER, 
	REQ_FOR_PS_BACKG_DL_SRNC NUMBER, 
	REQ_PS_CONV_REJ_UL_SRNC NUMBER, 
	REQ_PS_CONV_REJ_DL_SRNC NUMBER, 
	REQ_PS_STREAM_REJ_UL_SRNC NUMBER, 
	REQ_PS_STREAM_REJ_DL_SRNC NUMBER, 
	REQ_PS_INTERA_REJ_UL_SRNC NUMBER, 
	REQ_PS_INTERA_REJ_DL_SRNC NUMBER, 
	REQ_PS_BACKG_REJ_UL_SRNC NUMBER, 
	REQ_PS_BACKG_REJ_DL_SRNC NUMBER, 
	INI_REQ_PS_CONV_SRNC NUMBER, 
	INI_REQ_PS_STREAM_UL_SRNC NUMBER, 
	INI_REQ_PS_INTERA_UL_SRNC NUMBER, 
	INI_REQ_PS_INTERA_DL_SRNC NUMBER, 
	INI_REQ_PS_BACKGR_UL_SRNC NUMBER, 
	INI_REQ_PS_BACKGR_DL_SRNC NUMBER, 
	RT_REQ_PS_CONV_SRNC NUMBER, 
	RT_REQ_PS_CONV_REJ_SRNC NUMBER, 
	RT_REQ_PS_STREAM_SRNC NUMBER, 
	RT_REQ_PS_STREAM_REJ_SRNC NUMBER, 
	NRT_REQ_PS_INTERA_SRNC NUMBER, 
	NRT_REQ_PS_INTERA_REJ_SRNC NUMBER, 
	NRT_REQ_PS_BACKG_SRNC NUMBER, 
	NRT_REQ_PS_BACKG_REJ_SRNC NUMBER, 
	ALLO_PS_CONV_8_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_16_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_32_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_64_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_128_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_256_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_320_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_384_UL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_8_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_16_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_32_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_64_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_128_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_256_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_320_DL_IN_SRNC NUMBER, 
	ALLO_PS_CONV_384_DL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_8_UL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_16_UL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_32_UL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_64_UL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_128_UL_SRNC NUMBER, 
	ALLO_PS_STREAM_256_UL_SRNC NUMBER, 
	ALLO_PS_STREAM_320_UL_SRNC NUMBER, 
	ALLO_PS_STREAM_384_UL_SRNC NUMBER, 
	ALLO_PS_STREAM_8_DL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_16_DL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_32_DL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_64_DL_IN_SRNC NUMBER, 
	ALLO_PS_STREAM_128_DL_SRNC NUMBER, 
	ALLO_PS_STREAM_256_DL_SRNC NUMBER, 
	ALLO_PS_STREAM_320_DL_SRNC NUMBER, 
	ALLO_PS_STREAM_384_DL_SRNC NUMBER, 
	ALLO_PS_INTERA_8_UL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_16_UL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_32_UL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_64_UL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_128_UL_SRNC NUMBER, 
	ALLO_PS_INTERA_256_UL_SRNC NUMBER, 
	ALLO_PS_INTERA_320_UL_SRNC NUMBER, 
	ALLO_PS_INTERA_384_UL_SRNC NUMBER, 
	ALLO_PS_INTERA_8_DL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_16_DL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_32_DL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_64_DL_IN_SRNC NUMBER, 
	ALLO_PS_INTERA_128_DL_SRNC NUMBER, 
	ALLO_PS_INTERA_256_DL_SRNC NUMBER, 
	ALLO_PS_INTERA_320_DL_SRNC NUMBER, 
	ALLO_PS_INTERA_384_DL_SRNC NUMBER, 
	ALLO_PS_BACKG_8_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_16_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_32_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_64_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_128_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_256_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_320_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_384_UL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_8_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_16_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_32_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_64_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_128_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_256_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_320_DL_IN_SRNC NUMBER, 
	ALLO_PS_BACKG_384_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_8_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_16_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_32_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_64_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_128_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_256_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_320_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_384_UL_IN_SRNC NUMBER, 
	DUR_PS_CONV_8_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_16_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_32_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_64_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_128_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_256_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_320_DL_IN_SRNC NUMBER, 
	DUR_PS_CONV_384_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_8_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_16_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_32_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_64_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_128_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_256_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_320_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_384_UL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_8_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_16_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_32_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_64_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_128_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_256_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_320_DL_IN_SRNC NUMBER, 
	DUR_PS_STREAM_384_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_8_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_16_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_32_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_64_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_128_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_256_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_320_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_384_UL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_8_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_16_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_32_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_64_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_128_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_256_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_320_DL_IN_SRNC NUMBER, 
	DUR_PS_INTERA_384_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_8_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_16_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_32_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_64_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_128_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_256_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_320_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_384_UL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_8_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_16_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_32_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_64_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_128_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_256_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_320_DL_IN_SRNC NUMBER, 
	DUR_PS_BACKG_384_DL_IN_SRNC NUMBER, 
	DCH_REQ_SIG_LINK_DRNC NUMBER, 
	DCH_REQ_SIG_LINK_UL_DRNC NUMBER, 
	DCH_REQ_SIG_LINK_DL_DRNC NUMBER, 
	DCH_DHO_REQ_SIG_LINK_DRNC NUMBER, 
	DCH_REQ_SIG_LINK_REJ_DRNC NUMBER, 
	DCH_ALLO_SIG_LINK_1_7_DRNC NUMBER, 
	DCH_ALLO_SIG_LINK_3_4_DRNC NUMBER, 
	DCH_ALLO_SIG_LINK_13_6_DRNC NUMBER, 
	DCH_ALLO_DURA_LINK_1_7_DRNC NUMBER, 
	DCH_ALLO_DURA_LINK_3_4_DRNC NUMBER, 
	DCH_ALLO_DURA_LINK_13_6_DRNC NUMBER, 
	REQ_CS_VOICE_IN_DRNC NUMBER, 
	REQ_CS_VOICE_REJ_UL_IN_DRNC NUMBER, 
	REQ_CS_VOICE_REJ_DL_IN_DRNC NUMBER, 
	RT_REQ_CS_VOICE_DRNC NUMBER, 
	RT_REQ_CS_VOICE_REJ_DRNC NUMBER, 
	ALLO_FOR_AMR_4_75_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_5_15_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_5_9_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_6_7_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_7_4_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_7_95_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_10_2_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_12_2_UL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_4_75_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_5_15_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_5_9_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_6_7_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_7_4_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_7_95_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_10_2_DL_IN_DRNC NUMBER, 
	ALLO_FOR_AMR_12_2_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_4_75_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_5_15_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_5_9_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_6_7_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_7_4_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_7_95_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_10_2_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_12_2_UL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_4_75_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_5_15_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_5_9_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_6_7_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_7_4_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_7_95_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_10_2_DL_IN_DRNC NUMBER, 
	DURA_FOR_AMR_12_2_DL_IN_DRNC NUMBER, 
	REQ_DATA_IN_IN_DRNC NUMBER, 
	REQ_DATA_REJ_IN_UL_IN_DRNC NUMBER, 
	REQ_DATA_REJ_IN_DL_IN_DRNC NUMBER, 
	DCH_DHO_REQ_DATA_DRNC NUMBER, 
	DCH_DHO_REQ_DATA_REJ_DRNC NUMBER, 
	ALLO_FOR_DATA_8_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_14_4_UL_DRNC NUMBER, 
	ALLO_FOR_DATA_16_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_28_8_UL_DRNC NUMBER, 
	ALLO_FOR_DATA_32_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_33_6_UL_DRNC NUMBER, 
	ALLO_FOR_DATA_57_6_UL_DRNC NUMBER, 
	ALLO_FOR_DATA_64_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_128_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_256_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_320_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_384_UL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_8_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_14_4_DL_DRNC NUMBER, 
	ALLO_FOR_DATA_16_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_28_8_DL_DRNC NUMBER, 
	ALLO_FOR_DATA_32_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_33_6_DL_DRNC NUMBER, 
	ALLO_FOR_DATA_57_6_DL_DRNC NUMBER, 
	ALLO_FOR_DATA_64_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_128_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_256_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_320_DL_IN_DRNC NUMBER, 
	ALLO_FOR_DATA_384_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_8_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_14_4_UL_DRNC NUMBER, 
	DURA_FOR_DATA_16_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_28_8_UL_DRNC NUMBER, 
	DURA_FOR_DATA_32_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_33_6_UL_DRNC NUMBER, 
	DURA_FOR_DATA_57_6_UL_DRNC NUMBER, 
	DURA_FOR_DATA_64_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_128_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_256_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_320_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_384_UL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_8_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_14_4_DL_DRNC NUMBER, 
	DURA_FOR_DATA_16_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_28_8_DL_DRNC NUMBER, 
	DURA_FOR_DATA_32_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_33_6_DL_DRNC NUMBER, 
	DURA_FOR_DATA_57_6_DL_DRNC NUMBER, 
	DURA_FOR_DATA_64_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_128_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_256_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_320_DL_IN_DRNC NUMBER, 
	DURA_FOR_DATA_384_DL_IN_DRNC NUMBER, 
	DCH_HHO_REQ_LINK_SRNC NUMBER, 
	DCH_HHO_REQ_LINK_REJ_SRNC NUMBER, 
	REQ_CS_VOICE_HHO_SRNC NUMBER, 
	REQ_CS_VOICE_HHO_REJ_SRNC NUMBER, 
	RT_REQ_DATA_CONV_HHO_SRNC NUMBER, 
	RT_REQ_DATA_CNV_HHO_REJ_SRNC NUMBER, 
	RT_REQ_DATA_STREAM_HHO_SRNC NUMBER, 
	RT_REQ_DATA_STRM_HHO_RJ_SRNC NUMBER, 
	RT_REQ_PS_CONV_HHO_SRNC NUMBER, 
	RT_REQ_PS_CONV_HHO_REJ_SRNC NUMBER, 
	RT_REQ_PS_STREAM_HHO_SRNC NUMBER, 
	RT_REQ_PS_STRM_HHO_REJ_SRNC NUMBER, 
	NRT_REQ_PS_INTERA_HHO_SRNC NUMBER, 
	NRT_REQ_PS_INT_HHO_REJ_SRNC NUMBER, 
	NRT_REQ_PS_BACKG_HHO_SRNC NUMBER, 
	NRT_REQ_PS_BACKG_HHO_RJ_SRNC NUMBER, 
	REQ_CMOD_UL_IF_HHO_SRNC NUMBER, 
	REQ_CMOD_DL_IF_HHO_SRNC NUMBER, 
	REQ_COM_UL_INT_SYS_HHO_SRNC NUMBER, 
	REQ_COM_DL_INT_SYS_HHO_SRNC NUMBER, 
	REQ_COM_UL_REJ_FRE_HHO_SRNC NUMBER, 
	REQ_COM_DL_REJ_FRE_HHO_SRNC NUMBER, 
	REQ_COM_UL_REJ_SYS_HHO_SRNC NUMBER, 
	REQ_COM_DL_REJ_SYS_HHO_SRNC NUMBER, 
	ALLO_COM_UL_FRE_HHO_SRNC NUMBER, 
	ALLO_COM_DL_FRE_HHO_SRNC NUMBER, 
	ALLO_DUR_COM_UL_FRE_HHO_SRNC NUMBER, 
	ALLO_DUR_COM_DL_FRE_HHO_SRNC NUMBER, 
	ALLO_COM_UL_SYS_HHO_SRNC NUMBER, 
	ALLO_COM_DL_SYS_HHO_SRNC NUMBER, 
	ALLO_DUR_COM_UL_SYS_HHO_SRNC NUMBER, 
	ALLO_DUR_COM_DL_SYS_HHO_SRNC NUMBER, 
	DCH_HHO_REQ_LINK_DRNC NUMBER, 
	DCH_HHO_REQ_LINK_REJ_DRNC NUMBER, 
	REQ_CS_VOICE_HHO_DRNC NUMBER, 
	REQ_CS_VOICE_HHO_REJ_DRNC NUMBER, 
	DCH_HHO_REQ_DATA_DRNC NUMBER, 
	DCH_HHO_REQ_DATA_REJ_DRNC NUMBER, 
	REQ_CMOD_UL_DRNC NUMBER, 
	REQ_CMOD_DL_DRNC NUMBER, 
	REQ_CMOD_UL_REJ_DRNC NUMBER, 
	REQ_CMOD_DL_REJ_DRNC NUMBER, 
	ALLO_CMOD_UL_DRNC NUMBER, 
	ALLO_CMOD_DL_DRNC NUMBER, 
	ALLO_DURA_CMOD_UL_DRNC NUMBER, 
	ALLO_DURA_CMOD_DL_DRNC NUMBER, 
	ALLO_HS_DSCH_FLOW_INT NUMBER, 
	ALLO_HS_DSCH_RET_64_INT NUMBER, 
	ALLO_HS_DSCH_RET_128_INT NUMBER, 
	ALLO_HS_DSCH_RET_384_INT NUMBER, 
	ALLO_HS_DSCH_FLOW_BGR NUMBER, 
	ALLO_HS_DSCH_RET_64_BGR NUMBER, 
	ALLO_HS_DSCH_RET_128_BGR NUMBER, 
	ALLO_HS_DSCH_RET_384_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_FLOW_INT NUMBER, 
	ALLO_DUR_HS_DSCH_RET_64_INT NUMBER, 
	ALLO_DUR_HS_DSCH_RET_128_INT NUMBER, 
	ALLO_DUR_HS_DSCH_RET_384_INT NUMBER, 
	ALLO_DUR_HS_DSCH_FLOW_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_64_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_128_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_384_BGR NUMBER, 
	REJ_HS_DSCH_RET_INT NUMBER, 
	REJ_HS_DSCH_RET_BGR NUMBER, 
	REJ_HS_DSCH_AMR_BGR NUMBER, 
	SETUP_FAIL_HS_DSCH_AMR_BGR NUMBER, 
	ALLO_HS_DSCH_AMR_BGR NUMBER, 
	REL_ALLO_NORM_HSDSCH_AMR_BGR NUMBER, 
	REL_ALLO_NORM_HS_DSCH_INT NUMBER, 
	REL_ALLO_OTH_FAIL_HSDSCH_INT NUMBER, 
	REL_ALLO_HS_DSCH_MOB_DCH_INT NUMBER, 
	REL_ALLO_NORM_HS_DSCH_BGR NUMBER, 
	REL_ALLO_OTH_FAIL_HSDSCH_BGR NUMBER, 
	REL_ALLO_HS_DSCH_MOB_DCH_BGR NUMBER, 
	SETUP_FAIL_RNC_HS_DSCH_INT NUMBER, 
	SETUP_FAIL_IUB_MAC_D_INT NUMBER, 
	SETUP_FAIL_UE_HS_DSCH_INT NUMBER, 
	SETUP_FAIL_BTS_HS_DSCH_INT NUMBER, 
	SETUP_FAIL_IUB_HS_TOTAL_INT NUMBER, 
	SETUP_FAIL_64_IUB_HSDSCH_INT NUMBER, 
	SETUP_FAIL_128_IUB_HSDSCH_IN NUMBER, 
	SETUP_FAIL_384_IUB_HSDSCH_IN NUMBER, 
	SETUP_FAIL_RNC_HS_DSCH_BGR NUMBER, 
	SETUP_FAIL_IUB_MAC_D_BGR NUMBER, 
	SETUP_FAIL_UE_HS_DSCH_BGR NUMBER, 
	SETUP_FAIL_BTS_HS_DSCH_BGR NUMBER, 
	SETUP_FAIL_IUB_HS_TOTAL_BGR NUMBER, 
	SETUP_FAIL_64_IUB_HSDSCH_BGR NUMBER, 
	SETUP_FAIL_128_IUB_HSDSCH_BG NUMBER, 
	SETUP_FAIL_384_IUB_HSDSCH_BG NUMBER, 
	HS_DSCH_RET_UPGRADE_INT NUMBER, 
	HS_DSCH_RET_DOWNGRADE_INT NUMBER, 
	HS_DSCH_RET_UPGRADE_BGR NUMBER, 
	HS_DSCH_RET_DOWNGRADE_BGR NUMBER, 
	ALLO_COM_UL_SF2_SRNC NUMBER, 
	ALLO_COM_DL_SF2_SRNC NUMBER, 
	ALLO_COM_UL_HLS_SRNC NUMBER, 
	ALLO_COM_DL_HLS_SRNC NUMBER, 
	ALLO_DUR_COM_UL_SF2_SRNC NUMBER, 
	ALLO_DUR_COM_DL_SF2_SRNC NUMBER, 
	ALLO_DUR_COM_UL_HLS_SRNC NUMBER, 
	ALLO_DUR_COM_DL_HLS_SRNC NUMBER, 
	ALLO_COM_UL_SF2_DRNC NUMBER, 
	ALLO_COM_DL_SF2_DRNC NUMBER, 
	ALLO_COM_UL_HLS_DRNC NUMBER, 
	ALLO_COM_DL_HLS_DRNC NUMBER, 
	ALLO_COM_DL_PUNCT_DRNC NUMBER, 
	ALLO_DUR_COM_UL_SF2_DRNC NUMBER, 
	ALLO_DUR_COM_DL_SF2_DRNC NUMBER, 
	ALLO_DUR_COM_UL_HLS_DRNC NUMBER, 
	ALLO_DUR_COM_DL_HLS_DRNC NUMBER, 
	ALLO_DUR_COM_DL_PUNCT_DRNC NUMBER, 
	DCH_SHO_STP_VOICE_FAIL_TRANS NUMBER, 
	DCH_SHO_STP_CSCONV_F_TRANS NUMBER, 
	DCH_SHO_STP_CSSTR_F_TRANS NUMBER, 
	DCH_SHO_STP_PSSTR_F_TRANS NUMBER, 
	DCH_SHO_STP_PSINT_F_TRANS NUMBER, 
	DCH_SHO_STP_PSBACKG_F_TRANS NUMBER, 
	UL_INI_STP_FAIL_INT_IUB_AAL2 NUMBER, 
	UL_UPG_STP_FAIL_INT_IUB_AAL2 NUMBER, 
	DL_INI_STP_FAIL_INT_IUB_AAL2 NUMBER, 
	DL_UPG_STP_FAIL_INT_IUB_AAL2 NUMBER, 
	UL_INI_STP_F_BACKG_IUB_AAL2 NUMBER, 
	UL_UPG_STP_F_BACKG_IUB_AAL2 NUMBER, 
	DL_INI_STP_F_BACKG_IUB_AAL2 NUMBER, 
	DL_UPG_STP_F_BACKG_IUB_AAL2 NUMBER, 
	UL_INI_STP_FAIL_INT_IUR_AAL2 NUMBER, 
	UL_UPG_STP_FAIL_INT_IUR_AAL2 NUMBER, 
	DL_INI_STP_FAIL_INT_IUR_AAL2 NUMBER, 
	DL_UPG_STP_FAIL_INT_IUR_AAL2 NUMBER, 
	UL_INI_STP_F_BACKG_IUR_AAL2 NUMBER, 
	UL_UPG_STP_F_BACKG_IUR_AAL2 NUMBER, 
	DL_INI_STP_F_BACKG_IUR_AAL2 NUMBER, 
	DL_UPG_STP_F_BACKG_IUR_AAL2 NUMBER, 
	DCH_STP_F_AMR_DRNC_EXTTRANS NUMBER, 
	DCH_STP_F_DATA_DRNC_EXTTRANS NUMBER, 
	DCH_SEL_MAX_HSDPA_USERS_INT NUMBER, 
	DCH_SEL_MAX_HSDPA_USERS_BGR NUMBER, 
	REL_ALLO_HS_DSCH_OTH_DCH_INT NUMBER, 
	REL_ALLO_HS_DSCH_PRE_EMP_INT NUMBER, 
	REL_ALLO_RL_FAIL_HS_DSCH_INT NUMBER, 
	REL_ALLO_HS_DSCH_OTH_DCH_BGR NUMBER, 
	REL_ALLO_HS_DSCH_PRE_EMP_BGR NUMBER, 
	REL_ALLO_RL_FAIL_HS_DSCH_BGR NUMBER, 
	REJ_HS_DSCH_AMR_INT NUMBER, 
	SETUP_FAIL_HS_DSCH_AMR_INT NUMBER, 
	ALLO_HS_DSCH_AMR_INT NUMBER, 
	REL_ALLO_NORM_HSDSCH_AMR_INT NUMBER, 
	ALLO_FOR_WAMR_12_65_SRNC NUMBER, 
	ALLO_FOR_WAMR_6_6_SRNC NUMBER, 
	DURA_FOR_WAMR_12_65_SRNC NUMBER, 
	DURA_FOR_WAMR_6_6_SRNC NUMBER, 
	ALLO_FOR_WAMR_12_65_DRNC NUMBER, 
	ALLO_FOR_WAMR_8_85_DRNC NUMBER, 
	ALLO_FOR_WAMR_6_6_DRNC NUMBER, 
	DURA_FOR_WAMR_12_65_DRNC NUMBER, 
	DURA_FOR_WAMR_8_85_DRNC NUMBER, 
	DURA_FOR_WAMR_6_6_DRNC NUMBER, 
	SWI_FROM_WAMR_TO_NAMR_SRNC NUMBER, 
	SWI_FROM_NAMR_TO_WAMR_SRNC NUMBER, 
	SWI_FROM_WAMR_TO_NAMR_DRNC NUMBER, 
	SWI_FROM_NAMR_TO_WAMR_DRNC NUMBER, 
	ALLO_HS_DSCH_RET_16_INT NUMBER, 
	ALLO_HS_DSCH_RET_16_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_16_INT NUMBER, 
	ALLO_DUR_HS_DSCH_RET_16_BGR NUMBER, 
	SETUP_FAIL_16_IUB_HSDSCH_INT NUMBER, 
	SETUP_FAIL_16_IUB_HSDSCH_BGR NUMBER, 
	SWI_DCH_TO_HS_DSCH_INT NUMBER, 
	SWI_DCH_TO_HS_DSCH_BGR NUMBER, 
	DCH_ALLO_NON_HSPA_TO_HSPA NUMBER, 
	DCH_ALLO_HSPA_TO_NON_HSPA NUMBER, 
	DCH_ALLO_HSPA_TO_HSPA NUMBER, 
	FACH_DCH_NON_HSPA_TO_HSPA NUMBER, 
	FACH_DCH_HSPA_TO_NON_HSPA NUMBER, 
	FACH_DCH_HSPA_TO_HSPA NUMBER, 
	UL_DCH_SEL_MAX_HSUPA_USR_INT NUMBER, 
	UL_DCH_SEL_MAX_HSUPA_USR_BGR NUMBER, 
	UL_DCH_SEL_BTS_HW_INT NUMBER, 
	UL_DCH_SEL_BTS_HW_BGR NUMBER, 
	EDCH_ALLO_CANC_NA_AS_INT NUMBER, 
	EDCH_ALLO_CANC_NA_AS_BGR NUMBER, 
	DL_DCH_SEL_HSDPA_POWER_INT NUMBER, 
	DL_DCH_SEL_HSDPA_POWER_BGR NUMBER, 
	SETUP_FAIL_EDCH_UE_INT NUMBER, 
	SETUP_FAIL_EDCH_UE_BGR NUMBER, 
	SETUP_FAIL_EDCH_BTS_INT NUMBER, 
	SETUP_FAIL_EDCH_BTS_BGR NUMBER, 
	SETUP_FAIL_EDCH_TRANS_INT NUMBER, 
	SETUP_FAIL_EDCH_TRANS_BGR NUMBER, 
	SETUP_FAIL_EDCH_OTHER_INT NUMBER, 
	SETUP_FAIL_EDCH_OTHER_BGR NUMBER, 
	ALLO_SUCCESS_EDCH_INT NUMBER, 
	ALLO_SUCCESS_EDCH_BGR NUMBER, 
	ALLO_DUR_EDCH_INT NUMBER, 
	ALLO_DUR_EDCH_BGR NUMBER, 
	REL_EDCH_NORM_INT NUMBER, 
	REL_EDCH_NORM_BGR NUMBER, 
	REL_EDCH_HSDSCH_SCC_INT NUMBER, 
	REL_EDCH_HSDSCH_SCC_BGR NUMBER, 
	REL_EDCH_RL_FAIL_INT NUMBER, 
	REL_EDCH_RL_FAIL_BGR NUMBER, 
	REL_EDCH_OTHER_FAIL_INT NUMBER, 
	REL_EDCH_OTHER_FAIL_BGR NUMBER, 
	AMR_EDCH_ALLO NUMBER, 
	AMR_EDCH_NORMAL_REL NUMBER, 
	ALLO_HS_INTER_RNC_HHO_INT NUMBER, 
	ALLO_HS_INTER_RNC_HHO_BGR NUMBER, 
	STP_F_HS_INTER_RNC_HHO_INT NUMBER, 
	STP_F_HS_INTER_RNC_HHO_BGR NUMBER, 
	ALLO_ED_INTER_RNC_HHO_INT NUMBER, 
	ALLO_ED_INTER_RNC_HHO_BGR NUMBER, 
	STP_F_ED_INTER_RNC_HHO_INT NUMBER, 
	STP_F_ED_INTER_RNC_HHO_BGR NUMBER, 
	REJ_DCH_DUE_CODES_INT_DL NUMBER, 
	REJ_DCH_DUE_CODES_BGR_DL NUMBER, 
	REJ_DCH_DUE_POWER_INT_DL NUMBER, 
	REJ_DCH_DUE_POWER_BGR_DL NUMBER, 
	REJ_DCH_REC_DUE_CODES_INT_DL NUMBER, 
	REJ_DCH_REC_DUE_CODES_BGR_DL NUMBER, 
	REJ_DCH_REC_DUE_PWR_INT_DL NUMBER, 
	REJ_DCH_REC_DUE_PWR_BGR_DL NUMBER, 
	AMR_LOWER_CODEC_SF128_INC NUMBER, 
	AMR_LOWER_CODEC_SF256_INC NUMBER, 
	LOAD_AMR_DGR_SF128_SUCCESS NUMBER, 
	LOAD_AMR_DGR_SF256_SUCCESS NUMBER, 
	LOAD_AMR_UPGRADE_SUCCESS NUMBER, 
	AMR_CODEC_CHANGE_FAIL_ICSU NUMBER, 
	AMR_CODEC_CHANGE_FAIL_OTHER NUMBER, 
	SWI_DCH_TO_HS_DSCH_STR NUMBER, 
	ALLO_HS_DSCH_FLOW_STR NUMBER, 
	ALLO_HS_DSCH_RET_16_STR NUMBER, 
	ALLO_HS_DSCH_RET_64_STR NUMBER, 
	ALLO_HS_DSCH_RET_128_STR NUMBER, 
	ALLO_DUR_HS_DSCH_FLOW_STR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_16_STR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_64_STR NUMBER, 
	ALLO_DUR_HS_DSCH_RET_128_STR NUMBER, 
	REJ_HS_DSCH_RET_STR NUMBER, 
	REL_ALLO_NORM_HS_DSCH_STR NUMBER, 
	REL_ALLO_OTH_FAIL_HSDSCH_STR NUMBER, 
	REL_ALLO_HS_DSCH_MOB_DCH_STR NUMBER, 
	SETUP_FAIL_RNC_HS_DSCH_STR NUMBER, 
	SETUP_FAIL_IUB_MAC_D_STR NUMBER, 
	SETUP_FAIL_UE_HS_DSCH_STR NUMBER, 
	SETUP_FAIL_BTS_HS_DSCH_STR NUMBER, 
	SETUP_FAIL_IUB_HS_TOTAL_STR NUMBER, 
	SETUP_FAIL_16_IUB_HSDSCH_STR NUMBER, 
	SETUP_FAIL_64_IUB_HSDSCH_STR NUMBER, 
	SETUP_FAIL_128_IUB_HSDSCH_ST NUMBER, 
	HS_DSCH_RET_UPGRADE_STR NUMBER, 
	HS_DSCH_RET_DOWNGRADE_STR NUMBER, 
	DCH_SEL_MAX_HSDPA_USERS_STR NUMBER, 
	REL_ALLO_HS_DSCH_OTH_DCH_STR NUMBER, 
	REL_ALLO_HS_DSCH_PRE_EMP_STR NUMBER, 
	REL_ALLO_RL_FAIL_HS_DSCH_STR NUMBER, 
	REJ_HS_DSCH_AMR_STR NUMBER, 
	SETUP_FAIL_HS_DSCH_AMR_STR NUMBER, 
	ALLO_HS_DSCH_AMR_STR NUMBER, 
	REL_ALLO_NORM_HSDSCH_AMR_STR NUMBER, 
	UL_DCH_SEL_MAX_HSUPA_USR_STR NUMBER, 
	UL_DCH_SEL_BTS_HW_STR NUMBER, 
	EDCH_ALLO_CANC_NA_AS_STR NUMBER, 
	DL_DCH_SEL_HSDPA_POWER_STR NUMBER, 
	SETUP_FAIL_EDCH_UE_STR NUMBER, 
	SETUP_FAIL_EDCH_BTS_STR NUMBER, 
	SETUP_FAIL_EDCH_TRANS_STR NUMBER, 
	SETUP_FAIL_EDCH_OTHER_STR NUMBER, 
	ALLO_SUCCESS_EDCH_STR NUMBER, 
	ALLO_DUR_EDCH_STR NUMBER, 
	REL_EDCH_NORM_STR NUMBER, 
	REL_EDCH_HSDSCH_SCC_STR NUMBER, 
	REL_EDCH_RL_FAIL_STR NUMBER, 
	REL_EDCH_OTHER_FAIL_STR NUMBER, 
	ALLO_HS_INTER_RNC_HHO_STR NUMBER, 
	STP_F_HS_INTER_RNC_HHO_STR NUMBER, 
	ALLO_ED_INTER_RNC_HHO_STR NUMBER, 
	STP_F_ED_INTER_RNC_HHO_STR NUMBER, 
	ALLO_AMR_MULTINRT_HSPA NUMBER, 
	ALLO_MULTINRT_HSPA NUMBER, 
	ALLO_AMR_RT_NRT_HSPA NUMBER, 
	ALLO_AMR_RT_MULTINRT_HSPA NUMBER, 
	ALLO_RT_NRT_HSPA NUMBER, 
	ALLO_RT_MULTINRT_HSPA NUMBER, 
	ALLO_CM_HSDPA_IFHO NUMBER, 
	ALLO_DURA_CM_HSDPA_IFHO NUMBER, 
	REJ_CM_HSDPA_IFHO NUMBER, 
	REJ_DCH_DUE_POWER_INT_UL NUMBER, 
	REJ_DCH_DUE_POWER_BGR_UL NUMBER, 
	REJ_DCH_REC_DUE_PWR_INT_UL NUMBER, 
	REJ_DCH_REC_DUE_PWR_BGR_UL NUMBER, 
	ATT_HS_DSCH_DRNC NUMBER, 
	ALLO_HS_DSCH_DRNC NUMBER, 
	ALLO_DUR_HS_DSCH_DRNC NUMBER, 
	ATT_EDCH_DRNC NUMBER, 
	ALLO_EDCH_DRNC NUMBER, 
	ALLO_DUR_EDCH_DRNC NUMBER, 
	SETUP_FAIL_BTS_HS_DSCH_AMR NUMBER, 
	SETUP_FAIL_UE_HS_DSCH_AMR NUMBER, 
	SETUP_FAIL_TRANS_HS_DSCH_AMR NUMBER, 
	SETUP_FAIL_OTHER_HS_DSCH_AMR NUMBER, 
	SETUP_FAIL_BTS_EDCH_AMR NUMBER, 
	SETUP_FAIL_UE_EDCH_AMR NUMBER, 
	SETUP_FAIL_TRANS_EDCH_AMR NUMBER, 
	SETUP_FAIL_OTHER_EDCH_AMR NUMBER, 
	REL_ALLO_NORM_HS_DSCH_AMR NUMBER, 
	REL_ALLO_RL_FAIL_HS_DSCH_AMR NUMBER, 
	REL_ALLO_OTH_FAIL_HSDSCH_AMR NUMBER, 
	REL_ALLO_NORM_EDCH_AMR NUMBER, 
	REL_ALLO_RL_FAIL_EDCH_AMR NUMBER, 
	REL_ALLO_OTH_FAIL_EDCH_AMR NUMBER, 
	SWI_R99_TO_HSPA_CS_VOICE NUMBER, 
	SWI_HSPA_TO_R99_CS_AMR NUMBER, 
	ALLO_HS_DSCH_5_9_AMR NUMBER, 
	ALLO_HS_DSCH_12_2_AMR NUMBER, 
	ALLO_HS_DSCH_12_65_AMR NUMBER, 
	ALLO_DUR_HS_DSCH_5_9_AMR NUMBER, 
	ALLO_DUR_HS_DSCH_12_2_AMR NUMBER, 
	ALLO_DUR_HS_DSCH_12_65_AMR NUMBER, 
	ALLO_SUCCESS_EDCH_AMR_5_9 NUMBER, 
	ALLO_SUCCESS_EDCH_AMR_12_2 NUMBER, 
	ALLO_SUCCESS_EDCH_AMR_12_65 NUMBER, 
	ALLO_DUR_EDCH_5_9_AMR NUMBER, 
	ALLO_DUR_EDCH_12_2_AMR NUMBER, 
	ALLO_DUR_EDCH_12_65_AMR NUMBER, 
	ALLO_EDCH_SRB_SRNC NUMBER, 
	ALLO_EDCH_SRB_DRNC NUMBER, 
	ALLO_HS_DSCH_SRB_SRNC NUMBER, 
	ALLO_HS_DSCH_SRB_DRNC NUMBER, 
	ALLO_DUR_HS_DSCH_INACTIV_BGR NUMBER, 
	ALLO_DUR_HS_DSCH_INACTIV_INT NUMBER, 
	ALLO_DUR_EDCH_INACTIV_BGR NUMBER, 
	ALLO_DUR_EDCH_INACTIV_INT NUMBER, 
	ATT_HSPA_DIREAL_BGR NUMBER, 
	ATT_HSPA_DIREAL_INT NUMBER, 
	ALLO_SUCC_HSPA_DIREAL_BGR NUMBER, 
	ALLO_SUCC_HSPA_DIREAL_INT NUMBER, 
	ALLO_CM_HSUPA_IFHO NUMBER, 
	ALLO_DURA_CM_HSUPA_IFHO NUMBER, 
	REJ_CM_HSUPA_IFHO NUMBER, 
	TRAFFIC_SPARE_1 NUMBER, 
	TRAFFIC_SPARE_2 NUMBER, 
	SETUP_REJ_EDCH_AC_INT NUMBER, 
	SETUP_REJ_EDCH_AC_BGR NUMBER, 
	ALLO_HS_DSCH_FLOW_PTT NUMBER, 
	ALLO_SUCCESS_EDCH_PTT NUMBER, 
	MEH_ADMIT_CS_VOICE NUMBER, 
	MEH_REJECT_2MS_EDCH_TTI NUMBER, 
	MEH_REJECT_EDCH NUMBER, 
	MEH_REJECT_HSDSCH NUMBER, 
	MEH_RESTR_R99_UL_DCH NUMBER, 
	 CONSTRAINT UMTS_C_TRAFFIC_WCEL_DAY_PK PRIMARY KEY (PERIOD_START_TIME, OSSRC, WCELL_GID)
  USING INDEX TABLESPACE TBS_INDEXES_UMTS_DAIL2  LOCAL
 ) TABLESPACE TBS_UMTS_C_NSN_DAILY 
  PARTITION BY RANGE (PERIOD_START_TIME) INTERVAL (NUMTODSINTERVAL (1,'DAY'))
  SUBPARTITION BY LIST (OSSRC) 
  SUBPARTITION TEMPLATE ( 
    SUBPARTITION RC1 values ( 'OSSRC1' ), 
    SUBPARTITION RC2 values ( 'OSSRC2' ), 
    SUBPARTITION RC3 values ( 'OSSRC3' ) ) 
 (
 PARTITION UMTS_C_NSN_20150201  VALUES LESS THAN (TO_DATE(' 2015-02-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
 );
 