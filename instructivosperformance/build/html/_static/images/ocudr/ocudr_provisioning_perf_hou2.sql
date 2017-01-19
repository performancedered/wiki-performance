
-- Autor: Monica Pellegrini. Fecha:07.04.2016. Motivo: Se hacen calculos en los contadores se los divide 3600
MERGE INTO TEKELEC_OCUDR_PROVISION_HOUR A
 USING(SELECT  FECHA,
               ALCANCE_TYPE,
               ALCANCE,
               SERVER,
               ROUND((PROV_TXN_COMMITTED/3600),0)               TPS_PROV_TXN_COMMITTED			,
               ROUND((RX_PROV_EXPORT_CMDS/3600),0)              TPS_RX_PROV_EXPORT_CMDS			,
               ROUND((RX_PROV_EXPORTS_REQUESTED/3600),0)        TPS_RX_PROV_EXPORTS_REQ  		,
               ROUND((RX_PROV_EXPORTS_SFUL/3600),0)             TPS_RX_PROV_EXPORTS_SFUL		,
               ROUND((RX_PROV_IMPORT_CMDS_SFUL/3600),0)         TPS_RX_PROV_IMPORT_CMDS_SFUL	,
               ROUND((RX_PROV_IMPORT_FILES_RECEIVED/3600),0)    TPS_RX_PROV_IMPORT_FILES_REC  	,
               ROUND((RX_PROV_IMPORT_FILES_SFUL/3600),0)        TPS_RX_PROV_IMPORT_FILES_SFUL	,
               ROUND((RX_RAS_PROV_CON_ACCEPTED/3600),0)         TPS_RX_RAS_PROV_CON_ACCEPTED	,
               ROUND((RX_RAS_PROV_CON_ATTEMPTED/3600),0)        TPS_RX_RAS_PROV_CON_ATTEMPTED	,
               ROUND((RX_RAS_PROV_MSGS_RECEIVED/3600),0)        TPS_RX_RAS_PROV_MSGS_RECEIVED	,
               ROUND((RX_RAS_PROV_MSGS_SENT/3600),0)            TPS_RX_RAS_PROV_MSGS_SENT		,
               ROUND((RX_RAS_PROV_MSGS_SFUL/3600),0)            TPS_RX_RAS_PROV_MSGS_SFUL		,
               ROUND((RX_XSAS_PROV_CON_ACCEPTED/3600),0)        TPS_RX_XSAS_PROV_CON_ACCEPT		,
               ROUND((RX_XSAS_PROV_CON_ATTEMPTED/3600),0)       TPS_RX_XSAS_PROV_CON_ATTEMPT	,
               ROUND((RX_XSAS_PROV_MSGS_RECEIVED/3600),0)       TPS_RX_XSAS_PROV_MSGS_RECEIV	,
               ROUND((RX_XSAS_PROV_MSGS_SENT/3600),0)           TPS_RX_XSAS_PROV_MSGS_SENT		,
               ROUND((RX_XSAS_PROV_MSGS_SFUL/3600),0)           TPS_RX_XSAS_PROV_MSGS_SFUL		,
               ROUND((RX_XSAS_PROV_TXN_TOTAL/3600),0)           TPS_RX_XSAS_PROV_TXN_TOTAL		,
               ROUND((TX_PROV_IMP_R_FILES_TRANS/3600),0)        TPS_TX_PROV_IMP_R_FILES_TRANS	,
               ROUND((TX_PROV_TXN_TOTAL/3600),0)                TPS_TX_PROV_TXN_TOTAL			,
               ROUND((XSAS_PROV_TXN_COMMITTED/3600),0)          TPS_XSAS_PROV_TXN_COMMITTED
         FROM TEKELEC_OCUDR_PROVISION_RAW
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.TPS_PROV_TXN_COMMITTED                = B.TPS_PROV_TXN_COMMITTED,
                                    A.TPS_RX_PROV_EXPORT_CMDS               = B.TPS_RX_PROV_EXPORT_CMDS,
                                    A.TPS_RX_PROV_EXPORTS_REQ          		= B.TPS_RX_PROV_EXPORTS_REQ,
                                    A.TPS_RX_PROV_EXPORTS_SFUL              = B.TPS_RX_PROV_EXPORTS_SFUL,
                                    A.TPS_RX_PROV_IMPORT_CMDS_SFUL          = B.TPS_RX_PROV_IMPORT_CMDS_SFUL,
                                    A.TPS_RX_PROV_IMPORT_FILES_REC          = B.TPS_RX_PROV_IMPORT_FILES_REC,
                                    A.TPS_RX_PROV_IMPORT_FILES_SFUL         = B.TPS_RX_PROV_IMPORT_FILES_SFUL,
                                    A.TPS_RX_RAS_PROV_CON_ACCEPTED          = B.TPS_RX_RAS_PROV_CON_ACCEPTED,
                                    A.TPS_RX_RAS_PROV_CON_ATTEMPTED         = B.TPS_RX_RAS_PROV_CON_ATTEMPTED,
                                    A.TPS_RX_RAS_PROV_MSGS_RECEIVED         = B.TPS_RX_RAS_PROV_MSGS_RECEIVED,
                                    A.TPS_RX_RAS_PROV_MSGS_SENT             = B.TPS_RX_RAS_PROV_MSGS_SENT,
                                    A.TPS_RX_RAS_PROV_MSGS_SFUL             = B.TPS_RX_RAS_PROV_MSGS_SFUL,
                                    A.TPS_RX_XSAS_PROV_CON_ACCEPT         	= B.TPS_RX_XSAS_PROV_CON_ACCEPT,
                                    A.TPS_RX_XSAS_PROV_CON_ATTEMPT        	= B.TPS_RX_XSAS_PROV_CON_ATTEMPT,
                                    A.TPS_RX_XSAS_PROV_MSGS_RECEIV          = B.TPS_RX_XSAS_PROV_MSGS_RECEIV,
                                    A.TPS_RX_XSAS_PROV_MSGS_SENT            = B.TPS_RX_XSAS_PROV_MSGS_SENT,
                                    A.TPS_RX_XSAS_PROV_MSGS_SFUL            = B.TPS_RX_XSAS_PROV_MSGS_SFUL,
                                    A.TPS_RX_XSAS_PROV_TXN_TOTAL            = B.TPS_RX_XSAS_PROV_TXN_TOTAL,
                                    A.TPS_TX_PROV_IMP_R_FILES_TRANS         = B.TPS_TX_PROV_IMP_R_FILES_TRANS,
                                    A.TPS_TX_PROV_TXN_TOTAL                 = B.TPS_TX_PROV_TXN_TOTAL,
                                    A.TPS_XSAS_PROV_TXN_COMMITTED           = B.TPS_XSAS_PROV_TXN_COMMITTED
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.TPS_PROV_TXN_COMMITTED,
                                    A.TPS_RX_PROV_EXPORT_CMDS,
                                    A.TPS_RX_PROV_EXPORTS_REQ,
                                    A.TPS_RX_PROV_EXPORTS_SFUL,
                                    A.TPS_RX_PROV_IMPORT_CMDS_SFUL,
                                    A.TPS_RX_PROV_IMPORT_FILES_REC,
                                    A.TPS_RX_PROV_IMPORT_FILES_SFUL,
                                    A.TPS_RX_RAS_PROV_CON_ACCEPTED,
                                    A.TPS_RX_RAS_PROV_CON_ATTEMPTED,
                                    A.TPS_RX_RAS_PROV_MSGS_RECEIVED,
                                    A.TPS_RX_RAS_PROV_MSGS_SENT,
                                    A.TPS_RX_RAS_PROV_MSGS_SFUL,
                                    A.TPS_RX_XSAS_PROV_CON_ACCEPT,
                                    A.TPS_RX_XSAS_PROV_CON_ATTEMPT,
                                    A.TPS_RX_XSAS_PROV_MSGS_RECEIV,
                                    A.TPS_RX_XSAS_PROV_MSGS_SENT,
                                    A.TPS_RX_XSAS_PROV_MSGS_SFUL,
                                    A.TPS_RX_XSAS_PROV_TXN_TOTAL,
                                    A.TPS_TX_PROV_IMP_R_FILES_TRANS,
                                    A.TPS_TX_PROV_TXN_TOTAL,
                                    A.TPS_XSAS_PROV_TXN_COMMITTED
                                    )
                            VALUES (
                                    B.FECHA,
                                    B.ALCANCE_TYPE,
                                    B.ALCANCE,
                                    B.SERVER,
                                    B.TPS_PROV_TXN_COMMITTED,
                                    B.TPS_RX_PROV_EXPORT_CMDS,
                                    B.TPS_RX_PROV_EXPORTS_REQ,
                                    B.TPS_RX_PROV_EXPORTS_SFUL,
                                    B.TPS_RX_PROV_IMPORT_CMDS_SFUL,
                                    B.TPS_RX_PROV_IMPORT_FILES_REC,
                                    B.TPS_RX_PROV_IMPORT_FILES_SFUL,
                                    B.TPS_RX_RAS_PROV_CON_ACCEPTED,
                                    B.TPS_RX_RAS_PROV_CON_ATTEMPTED,
                                    B.TPS_RX_RAS_PROV_MSGS_RECEIVED,
                                    B.TPS_RX_RAS_PROV_MSGS_SENT,
                                    B.TPS_RX_RAS_PROV_MSGS_SFUL,
                                    B.TPS_RX_XSAS_PROV_CON_ACCEPT,
                                    B.TPS_RX_XSAS_PROV_CON_ATTEMPT,
                                    B.TPS_RX_XSAS_PROV_MSGS_RECEIV,
                                    B.TPS_RX_XSAS_PROV_MSGS_SENT,
                                    B.TPS_RX_XSAS_PROV_MSGS_SFUL,
                                    B.TPS_RX_XSAS_PROV_TXN_TOTAL,
                                    B.TPS_TX_PROV_IMP_R_FILES_TRANS,
                                    B.TPS_TX_PROV_TXN_TOTAL,
                                    B.TPS_XSAS_PROV_TXN_COMMITTED
                                   );
 COMMIT;
 EXIT;


