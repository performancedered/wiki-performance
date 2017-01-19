 -- Autor: Monica Pellegrini. Fecha: 28.01.2016. Motivo: Solitud de nuevas tablas para plataforma OCUDR.
-- Actualizacion: Monica Pellegrini. Fecha: 06.04.2016. Motivo: se cambia nombre a tabla por tekelec_ocudr_provision_raw.

MERGE INTO TEKELEC_OCUDR_PROVISION_RAW A
 USING(SELECT FECHA,
              ALCANCE_TYPE,
              ALCANCE,
              SERVER,
              PROV_TXN_COMMITTED,
              RX_PROV_EXPORT_CMDS,
              RX_PROV_EXPORTS_REQUESTED,
              RX_PROV_EXPORTS_SFUL,
              RX_PROV_IMPORT_CMDS_SFUL,
              RX_PROV_IMPORT_FILES_RECEIVED,
              RX_PROV_IMPORT_FILES_SFUL,
              RX_RAS_PROV_CON_ACCEPTED,
              RX_RAS_PROV_CON_ATTEMPTED,
              RX_RAS_PROV_MSGS_RECEIVED,
              RX_RAS_PROV_MSGS_SENT,
              RX_RAS_PROV_MSGS_SFUL,
              RX_XSAS_PROV_CON_ACCEPTED,
              RX_XSAS_PROV_CON_ATTEMPTED,
              RX_XSAS_PROV_MSGS_RECEIVED,
              RX_XSAS_PROV_MSGS_SENT,
              RX_XSAS_PROV_MSGS_SFUL,
              RX_XSAS_PROV_TXN_TOTAL,
              TX_PROV_IMP_R_FILES_TRANS,
              TX_PROV_TXN_TOTAL,
              XSAS_PROV_TXN_COMMITTED
         FROM AUX_OCUDR_PROVISIONING_PERF
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.PROV_TXN_COMMITTED                = B.PROV_TXN_COMMITTED,
                                    A.RX_PROV_EXPORT_CMDS               = B.RX_PROV_EXPORT_CMDS,
                                    A.RX_PROV_EXPORTS_REQUESTED         = B.RX_PROV_EXPORTS_REQUESTED,
                                    A.RX_PROV_EXPORTS_SFUL              = B.RX_PROV_EXPORTS_SFUL,
                                    A.RX_PROV_IMPORT_CMDS_SFUL          = B.RX_PROV_IMPORT_CMDS_SFUL,
                                    A.RX_PROV_IMPORT_FILES_RECEIVED     = B.RX_PROV_IMPORT_FILES_RECEIVED,
                                    A.RX_PROV_IMPORT_FILES_SFUL         = B.RX_PROV_IMPORT_FILES_SFUL,
                                    A.RX_RAS_PROV_CON_ACCEPTED          = B.RX_RAS_PROV_CON_ACCEPTED,
                                    A.RX_RAS_PROV_CON_ATTEMPTED         = B.RX_RAS_PROV_CON_ATTEMPTED,
                                    A.RX_RAS_PROV_MSGS_RECEIVED         = B.RX_RAS_PROV_MSGS_RECEIVED,
                                    A.RX_RAS_PROV_MSGS_SENT             = B.RX_RAS_PROV_MSGS_SENT,
                                    A.RX_RAS_PROV_MSGS_SFUL             = B.RX_RAS_PROV_MSGS_SFUL,
                                    A.RX_XSAS_PROV_CON_ACCEPTED         = B.RX_XSAS_PROV_CON_ACCEPTED,
                                    A.RX_XSAS_PROV_CON_ATTEMPTED        = B.RX_XSAS_PROV_CON_ATTEMPTED,
                                    A.RX_XSAS_PROV_MSGS_RECEIVED        = B.RX_XSAS_PROV_MSGS_RECEIVED,
                                    A.RX_XSAS_PROV_MSGS_SENT            = B.RX_XSAS_PROV_MSGS_SENT,
                                    A.RX_XSAS_PROV_MSGS_SFUL            = B.RX_XSAS_PROV_MSGS_SFUL,
                                    A.RX_XSAS_PROV_TXN_TOTAL            = B.RX_XSAS_PROV_TXN_TOTAL,
                                    A.TX_PROV_IMP_R_FILES_TRANS         = B.TX_PROV_IMP_R_FILES_TRANS,
                                    A.TX_PROV_TXN_TOTAL                 = B.TX_PROV_TXN_TOTAL,
                                    A.XSAS_PROV_TXN_COMMITTED           = B.XSAS_PROV_TXN_COMMITTED
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.PROV_TXN_COMMITTED,
                                    A.RX_PROV_EXPORT_CMDS,
                                    A.RX_PROV_EXPORTS_REQUESTED,
                                    A.RX_PROV_EXPORTS_SFUL,
                                    A.RX_PROV_IMPORT_CMDS_SFUL,
                                    A.RX_PROV_IMPORT_FILES_RECEIVED,
                                    A.RX_PROV_IMPORT_FILES_SFUL,
                                    A.RX_RAS_PROV_CON_ACCEPTED,
                                    A.RX_RAS_PROV_CON_ATTEMPTED,
                                    A.RX_RAS_PROV_MSGS_RECEIVED,
                                    A.RX_RAS_PROV_MSGS_SENT,
                                    A.RX_RAS_PROV_MSGS_SFUL,
                                    A.RX_XSAS_PROV_CON_ACCEPTED,
                                    A.RX_XSAS_PROV_CON_ATTEMPTED,
                                    A.RX_XSAS_PROV_MSGS_RECEIVED,
                                    A.RX_XSAS_PROV_MSGS_SENT,
                                    A.RX_XSAS_PROV_MSGS_SFUL,
                                    A.RX_XSAS_PROV_TXN_TOTAL,
                                    A.TX_PROV_IMP_R_FILES_TRANS,
                                    A.TX_PROV_TXN_TOTAL,
                                    A.XSAS_PROV_TXN_COMMITTED
                                    )
                            VALUES (
                                    B.FECHA,
                                    B.ALCANCE_TYPE,
                                    B.ALCANCE,
                                    B.SERVER,
                                    B.PROV_TXN_COMMITTED,
                                    B.RX_PROV_EXPORT_CMDS,
                                    B.RX_PROV_EXPORTS_REQUESTED,
                                    B.RX_PROV_EXPORTS_SFUL,
                                    B.RX_PROV_IMPORT_CMDS_SFUL,
                                    B.RX_PROV_IMPORT_FILES_RECEIVED,
                                    B.RX_PROV_IMPORT_FILES_SFUL,
                                    B.RX_RAS_PROV_CON_ACCEPTED,
                                    B.RX_RAS_PROV_CON_ATTEMPTED,
                                    B.RX_RAS_PROV_MSGS_RECEIVED,
                                    B.RX_RAS_PROV_MSGS_SENT,
                                    B.RX_RAS_PROV_MSGS_SFUL,
                                    B.RX_XSAS_PROV_CON_ACCEPTED,
                                    B.RX_XSAS_PROV_CON_ATTEMPTED,
                                    B.RX_XSAS_PROV_MSGS_RECEIVED,
                                    B.RX_XSAS_PROV_MSGS_SENT,
                                    B.RX_XSAS_PROV_MSGS_SFUL,
                                    B.RX_XSAS_PROV_TXN_TOTAL,
                                    B.TX_PROV_IMP_R_FILES_TRANS,
                                    B.TX_PROV_TXN_TOTAL,
                                    B.XSAS_PROV_TXN_COMMITTED
                                   );
 COMMIT;
 EXIT;

