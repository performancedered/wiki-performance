  CREATE TABLE UMTSC_NSN_HO_WCEL_DAY 
   (	FECHA DATE, 
	BUSY_HOUR VARCHAR2(2), 
	INT_ID NUMBER, 
	CELL_ADD_FAIL_ON_SHO_FOR_NRT NUMBER, 
	CELL_ADD_FAIL_ON_SHO_FOR_RT NUMBER, 
	CELL_ADD_REQ_ON_SHO_FOR_NRT NUMBER, 
	CELL_ADD_REQ_ON_SHO_FOR_RT NUMBER, 
	CELL_DEL_REQ_ON_SHO_FOR_NRT NUMBER, 
	CELL_DEL_REQ_ON_SHO_FOR_RT NUMBER, 
	CELL_REPL_FAIL_ON_SHO_FOR_RT NUMBER, 
	CELL_REPL_FAIL_ON_SHO_NRT NUMBER, 
	CELL_REPL_REQ_ON_SHO_FOR_NRT NUMBER, 
	CELL_REPL_REQ_ON_SHO_FOR_RT NUMBER, 
	CON_DRPS_IS_HHO_DL_DPCH_NRT NUMBER, 
	CON_DRPS_IS_HHO_DL_DPCH_RT NUMBER, 
	CON_DRPS_IS_HHO_ECNO_NRT NUMBER, 
	CON_DRPS_IS_HHO_ECNO_RT NUMBER, 
	CON_DRPS_IS_HHO_EMERG_CALL NUMBER, 
	CON_DRPS_IS_HHO_IM_IMS_NRT NUMBER, 
	CON_DRPS_IS_HHO_IM_IMS_RT NUMBER, 
	CON_DRPS_IS_HHO_RSCP_NRT NUMBER, 
	CON_DRPS_IS_HHO_RSCP_RT NUMBER, 
	CON_DRPS_IS_HHO_TRX_PWR_NRT NUMBER, 
	CON_DRPS_IS_HHO_UE_PWR_RT NUMBER, 
	CON_DRPS_IS_HHO_UL_DCH_Q_NRT NUMBER, 
	CON_DRPS_IS_HHO_UL_DCH_Q_RT NUMBER, 
	INTER_HHO_ATT_RT NUMBER, 
	INTRA_INTER_HHO_ATT_RT NUMBER, 
	INTRA_INTRA_HHO_ATT_RT NUMBER, 
	IS_COM_MOD_STA_NOT_POS_NRT NUMBER, 
	IS_COM_MOD_STA_NOT_POS_RT NUMBER, 
	IS_HHO_ATT_CPICH_ECNO_NRT NUMBER, 
	IS_HHO_ATT_CPICH_ECNO_RT NUMBER, 
	IS_HHO_ATT_CPICH_RSCP_NRT NUMBER, 
	IS_HHO_ATT_CPICH_RSCP_RT NUMBER, 
	IS_HHO_ATT_DL_DPCH_PWR_NRT NUMBER, 
	IS_HHO_ATT_DPCH_PWR_RT NUMBER, 
	IS_HHO_ATT_EMERG_CALL NUMBER, 
	IS_HHO_ATT_IM_IMS_NRT NUMBER, 
	IS_HHO_ATT_IM_IMS_RT NUMBER, 
	IS_HHO_ATT_UE_TRX_PWR_NRT NUMBER, 
	IS_HHO_ATT_UE_TRX_PWR_RT NUMBER, 
	IS_HHO_ATT_UL_DCH_Q_NRT NUMBER, 
	IS_HHO_ATT_UL_DCH_Q_RT NUMBER, 
	IS_HHO_NOCELL_CPICH_ECNO_NRT NUMBER, 
	IS_HHO_NOCELL_CPICH_RSCP_NRT NUMBER, 
	IS_HHO_NO_CELL_CPICH_ECNO_RT NUMBER, 
	IS_HHO_NO_CELL_CPICH_RSCP_RT NUMBER, 
	IS_HHO_NO_CELL_DL_DPCH_NRT NUMBER, 
	IS_HHO_NO_CELL_DL_DPCH_RT NUMBER, 
	IS_HHO_NO_CELL_EMERG_CALL NUMBER, 
	IS_HHO_NO_CELL_IM_IMS_NRT NUMBER, 
	IS_HHO_NO_CELL_IM_IMS_RT NUMBER, 
	IS_HHO_NO_CELL_UE_TRX_PWR_RT NUMBER, 
	IS_HHO_NO_CELL_UE_TX_PWR_NRT NUMBER, 
	IS_HHO_NO_CELL_UL_DCH_Q_NRT NUMBER, 
	IS_HHO_NO_CELL_UL_DCH_Q_RT NUMBER, 
	IS_HHO_WOCMOD_CPICH_ECNO_NRT NUMBER, 
	IS_HHO_WO_CMOD_CPICH_ECNO_RT NUMBER, 
	IS_HHO_WO_CMOD_DL_DPCH_NRT NUMBER, 
	IS_HHO_WO_CMOD_DL_DPCH_RT NUMBER, 
	IS_HHO_WO_CMOD_EMERG_CALL NUMBER, 
	IS_HHO_WO_CMOD_IM_IMS_NRT NUMBER, 
	IS_HHO_WO_CMOD_IM_IMS_RT NUMBER, 
	IS_HHO_WO_CMOD_RSCP_NRT NUMBER, 
	IS_HHO_WO_CMOD_RSCP_RT NUMBER, 
	IS_HHO_WO_CMOD_UE_TX_NRT NUMBER, 
	IS_HHO_WO_CMOD_UE_TX_PWR_RT NUMBER, 
	IS_HHO_WO_CMOD_UL_DCH_Q_NRT NUMBER, 
	IS_HHO_WO_CMOD_UL_DCH_Q_RT NUMBER, 
	IS_HHO_W_CMOD_CPICH_ECNO_NRT NUMBER, 
	IS_HHO_W_CMOD_CPICH_ECNO_RT NUMBER, 
	IS_HHO_W_CMOD_CPICH_RSCP_NRT NUMBER, 
	IS_HHO_W_CMOD_CPICH_RSCP_RT NUMBER, 
	IS_HHO_W_CMOD_DL_DPCH_NRT NUMBER, 
	IS_HHO_W_CMOD_DL_DPCH_RT NUMBER, 
	IS_HHO_W_CMOD_EMERG_CALL NUMBER, 
	IS_HHO_W_CMOD_IM_IMS_NRT NUMBER, 
	IS_HHO_W_CMOD_IM_IMS_RT NUMBER, 
	IS_HHO_W_CMOD_UE_TX_PWR_NRT NUMBER, 
	IS_HHO_W_CMOD_UE_TX_PWR_RT NUMBER, 
	IS_HHO_W_CMOD_UL_DCH_Q_NRT NUMBER, 
	IS_HHO_W_CMOD_UL_DCH_Q_RT NUMBER, 
	ONE_CELL_IN_ACT_SET_FOR_NRT NUMBER, 
	ONE_CELL_IN_ACT_SET_FOR_RT NUMBER, 
	SUCC_INTER_HHO_ATT_RT NUMBER, 
	SUCC_INTRA_INTER_HHO_ATT_RT NUMBER, 
	SUCC_INTRA_INTRA_HHO_ATT_RT NUMBER, 
	SUCC_IS_HHO_CPICH_ECNO_NRT NUMBER, 
	SUCC_IS_HHO_CPICH_ECNO_RT NUMBER, 
	SUCC_IS_HHO_CPICH_RSCP_NRT NUMBER, 
	SUCC_IS_HHO_CPICH_RSCP_RT NUMBER, 
	SUCC_IS_HHO_DL_DPCH_PWR_NRT NUMBER, 
	SUCC_IS_HHO_DL_DPCH_PWR_RT NUMBER, 
	SUCC_IS_HHO_EMERG_CALL NUMBER, 
	SUCC_IS_HHO_IM_IMS_NRT NUMBER, 
	SUCC_IS_HHO_IM_IMS_RT NUMBER, 
	SUCC_IS_HHO_UE_TRX_PWR_NRT NUMBER, 
	SUCC_IS_HHO_UE_TRX_PWR_RT NUMBER, 
	SUCC_IS_HHO_UL_DCH_Q_NRT NUMBER, 
	SUCC_IS_HHO_UL_DCH_Q_RT NUMBER, 
	SUCC_UPDATES_ON_SHO_FOR_NRT NUMBER, 
	SUCC_UPDATES_ON_SHO_FOR_RT NUMBER, 
	THREE_CELLS_IN_ACT_SET_NRT NUMBER, 
	THREE_CELLS_IN_ACT_SET_RT NUMBER, 
	TWO_CELLS_IN_ACT_SET_FOR_NRT NUMBER, 
	TWO_CELLS_IN_ACT_SET_FOR_RT NUMBER, 
	UE_NOT_ABLE_EXEC_ISHHO_NRT NUMBER, 
	UE_NOT_ABLE_EXEC_ISHHO_RT NUMBER, 
	UNSUCC_IS_HHO_CPICH_ECNO_NRT NUMBER, 
	UNSUCC_IS_HHO_CPICH_ECNO_RT NUMBER, 
	UNSUCC_IS_HHO_CPICH_RSCP_NRT NUMBER, 
	UNSUCC_IS_HHO_CPICH_RSCP_RT NUMBER, 
	UNSUCC_IS_HHO_DL_DPCH_PWR_RT NUMBER, 
	UNSUCC_IS_HHO_EMERG_CALL NUMBER, 
	UNSUCC_IS_HHO_IM_IMS_NRT NUMBER, 
	UNSUCC_IS_HHO_IM_IMS_RT NUMBER, 
	UNSUCC_IS_HHO_UE_TRX_PWR_RT NUMBER, 
	UNSUCC_IS_HHO_UL_DCH_Q_NRT NUMBER, 
	UNSUCC_IS_HHO_UL_DCH_Q_RT NUMBER, 
	UNSUCC_UPDATES_ON_SHO_FOR_RT NUMBER, 
	UNSUCC_UPDATES_ON_SHO_NRT NUMBER, 
	UNSUC_IS_HHO_DL_DPCH_PWR_NRT NUMBER, 
	UNSUC_IS_HHO_UE_TRX_PWR_NRT NUMBER, 
	UTRAN_NOT_ABLE_EXC_ISHHO_NRT NUMBER, 
	UTRAN_NOT_ABLE_EXEC_ISHHO_RT NUMBER, 
	CANTIDAD_HORAS NUMBER, 
	HHO_ATT_CAUSED_SHO_INCAP_NRT NUMBER, 
	HHO_ATT_CAUSED_SHO_INCAP_RT NUMBER, 
	IMMED_HHO_CSD_SHO_INCAP_NRT NUMBER, 
	IMMED_HHO_CSD_SHO_INCAP_RT NUMBER, 
	INTER_HHO_ATT_NRT NUMBER, 
	INTRA_INTER_HHO_ATT_NRT NUMBER, 
	INTRA_INTRA_HHO_ATT_NRT NUMBER, 
	SUCC_HHO_CAUSED_SHO_INCAP_RT NUMBER, 
	SUCC_HHO_SHO_INCAP_NRT NUMBER, 
	SUCC_INTER_HHO_ATT_NRT NUMBER, 
	SUCC_INTRA_INTER_HHO_ATT_NRT NUMBER, 
	SUCC_INTRA_INTRA_HHO_ATT_NRT NUMBER, 
	CON_DRPS_HHO_UL_DCH_Q_RT NUMBER, 
	CON_DRPS_IF_HHO_DL_DPCH_NRT NUMBER, 
	CON_DRPS_IF_HHO_DL_DPCH_RT NUMBER, 
	CON_DRPS_IF_HHO_ECNO_NRT NUMBER, 
	CON_DRPS_IF_HHO_ECNO_RT NUMBER, 
	CON_DRPS_IF_HHO_RSCP_NRT NUMBER, 
	CON_DRPS_IF_HHO_RSCP_RT NUMBER, 
	CON_DRPS_IF_HHO_UE_PWR_NRT NUMBER, 
	CON_DRPS_IF_HHO_UE_TRX_RT NUMBER, 
	CON_DRPS_IF_HHO_UL_DCH_Q_NRT NUMBER, 
	IF_COM_MOD_STA_NOT_POS_NRT NUMBER, 
	IF_COM_MOD_STA_NOT_POS_RT NUMBER, 
	IF_HHO_NOCELL_CPICH_ECNO_NRT NUMBER, 
	IF_HHO_NOCELL_CPICH_RSCP_NRT NUMBER, 
	IF_HHO_NO_CELL_CPICH_ECNO_RT NUMBER, 
	IF_HHO_NO_CELL_CPICH_RCSP_RT NUMBER, 
	IF_HHO_NO_CELL_DL_DCPCH_NRT NUMBER, 
	IF_HHO_NO_CELL_DL_DPCH_RT NUMBER, 
	IF_HHO_NO_CELL_UE_TRX_PWR_RT NUMBER, 
	IF_HHO_NO_CELL_UE_TX_PWR_NRT NUMBER, 
	IF_HHO_NO_CELL_UL_DCH_Q_NRT NUMBER, 
	IF_HHO_NO_CELL_UL_DCH_Q_RT NUMBER, 
	IF_HHO_WO_CMOD_CPICH_ECNO_RT NUMBER, 
	IF_HHO_WO_CMOD_DL_CPCH_NRT NUMBER, 
	IF_HHO_WO_CMOD_DL_DPCH_RT NUMBER, 
	IF_HHO_WO_CMOD_ECNO_NRT NUMBER, 
	IF_HHO_WO_CMOD_RSCP_NRT NUMBER, 
	IF_HHO_WO_CMOD_RSCP_RT NUMBER, 
	IF_HHO_WO_CMOD_UE_TRX_RT NUMBER, 
	IF_HHO_WO_CMOD_UE_TX_NRT NUMBER, 
	IF_HHO_WO_CMOD_UL_DCH_Q_NRT NUMBER, 
	IF_HHO_WO_CMOD_UL_DCH_Q_RT NUMBER, 
	IF_HHO_W_CMOD_CPICH_ECNO_NRT NUMBER, 
	IF_HHO_W_CMOD_CPICH_ECNO_RT NUMBER, 
	IF_HHO_W_CMOD_CPICH_RSCP_NRT NUMBER, 
	IF_HHO_W_CMOD_DL_DPCH_NRT NUMBER, 
	IF_HHO_W_CMOD_DL_DPCH_RT NUMBER, 
	IF_HHO_W_CMOD_RSCP_RT NUMBER, 
	IF_HHO_W_CMOD_UE_TX_PWR_NRT NUMBER, 
	IF_HHO_W_CMOD_UE_TX_PWR_RT NUMBER, 
	IF_HHO_W_CMOD_UL_DCH_Q_NRT NUMBER, 
	IF_HHO_W_CMOD_UL_DCH_Q_RT NUMBER, 
	UE_NOT_ABLE_EXEC_HHO_NRT NUMBER, 
	UE_NOT_ABLE_EXEC_HHO_RT NUMBER, 
	UNSUCC_IF_HHO_CPICH_ECNO_NRT NUMBER, 
	UNSUCC_IF_HHO_CPICH_ECNO_RT NUMBER, 
	UNSUCC_IF_HHO_CPICH_RSCP_NRT NUMBER, 
	UNSUCC_IF_HHO_CPICH_RSCP_RT NUMBER, 
	UNSUCC_IF_HHO_DL_DPCH_PWR_RT NUMBER, 
	UNSUCC_IF_HHO_UE_TRX_PWR_NRT NUMBER, 
	UNSUCC_IF_HHO_UE_TRX_PWR_RT NUMBER, 
	UNSUCC_IF_HHO_UL_DCH_Q_NRT NUMBER, 
	UNSUCC_IF_HHO_UL_DCH_Q_RT NUMBER, 
	UNSUC_IF_HHO_DL_DPCH_PWR_NRT NUMBER, 
	UTRAN_NOT_ABLE_EXEC_HHO_NRT NUMBER, 
	UTRAN_NOT_ABLE_EXEC_HHO_RT NUMBER, 
	 CONSTRAINT UMTSC_NSN_HO_WCEL_DAY_PK PRIMARY KEY (FECHA, INT_ID)
  USING INDEX TABLESPACE TBS_INDEXES_UMTS_DAILY  LOCAL
) TABLESPACE TBS_UMTS_C_NSN_DAILY 
  PARTITION BY RANGE (FECHA) INTERVAL (NUMTODSINTERVAL (1,'DAY'))
 (
 PARTITION UMTSC_NSN_HO_20071001  VALUES LESS THAN (TO_DATE(' 2007-10-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
 ); 
 