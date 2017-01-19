
-- AUTOR: MONICA PELLEGRINI. FECHA: 07.04.2016. Motivo: tabla KPIs

MERGE INTO TEKELEC_OCUDR_UDRBE_PERF_HOUR A
USING(SELECT  FECHA,
              ALCANCE_TYPE,
              ALCANCE,
              SERVER,
              ROUND((RX_PNNON_POOL_EDENTITY/3600),0)    TPS_RX_PN_NON_POOL_EDENTITY,
              ROUND((RX_PN_POOL_EDENTITY/3600),0)       TPS_RX_PN_POOL_EDENTITY,
              ROUND((RX_READ_MSGS/3600),0)              TPS_RX_READ_MSGS,
              ROUND((RX_UPDATE_MSGS/3600),0)            TPS_RX_UPDATE_MSGS,
              ROUND((TX_READ_REQ_FAILED/3600),0)        TPS_TX_READ_REQ_FAILED,
              ROUND((TX_READ_REQ_SUCCESS/3600),0)       TPS_TX_READ_REQ_SUCCESS,
              ROUND((TX_READ_UNK_SUBSCRIBER/3600),0)    TPS_TX_READ_UNK_SUBSCRIBER,
              ROUND((TX_UPDATE_INVAL_IDENTITY/3600),0)  TPS_TX_UPDATE_INVAL_IDENTITY,
              ROUND((TX_UPDATE_NOT_POOL_MEMBER/3600),0) TPS_TX_UPDATE_NOT_POOL_MEMBER,
              ROUND((TX_UPDATE_OUTOF_SYNC/3600),0)      TPS_TX_UPDATE_OUTOF_SYNC,
              ROUND((TX_UPDATE_REQ_FAILED/3600),0)      TPS_TX_UPDATE_REQ_FAILED,
              ROUND((TX_UPDATE_REQ_SUCCESS/3600),0)     TPS_TX_UPDATE_REQ_SUCCESS,
              ROUND((TX_UPDATE_TOO_BUSY/3600),0)        TPS_TX_UPDATE_TOO_BUSY,
              ROUND((TX_UPDATE_UNK_SUBSCRIBER/3600),0)  TPS_TX_UPDATE_UNK_SUBSCRIBER 
         FROM TEKELEC_OCUDR_UDRBE_PERF_RAW
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.TPS_RX_PN_NON_POOL_EDENTITY     = B.TPS_RX_PN_NON_POOL_EDENTITY,
                                    A.TPS_RX_PN_POOL_EDENTITY        = B.TPS_RX_PN_POOL_EDENTITY,
                                    A.TPS_RX_READ_MSGS               = B.TPS_RX_READ_MSGS,
                                    A.TPS_RX_UPDATE_MSGS             = B.TPS_RX_UPDATE_MSGS,
                                    A.TPS_TX_READ_REQ_FAILED         = B.TPS_TX_READ_REQ_FAILED,
                                    A.TPS_TX_READ_REQ_SUCCESS        = B.TPS_TX_READ_REQ_SUCCESS,
                                    A.TPS_TX_READ_UNK_SUBSCRIBER     = B.TPS_TX_READ_UNK_SUBSCRIBER,
                                    A.TPS_TX_UPDATE_INVAL_IDENTITY   = B.TPS_TX_UPDATE_INVAL_IDENTITY,
                                    A.TPS_TX_UPDATE_NOT_POOL_MEMBER  = B.TPS_TX_UPDATE_NOT_POOL_MEMBER,
                                    A.TPS_TX_UPDATE_OUTOF_SYNC       = B.TPS_TX_UPDATE_OUTOF_SYNC,
                                    A.TPS_TX_UPDATE_REQ_FAILED       = B.TPS_TX_UPDATE_REQ_FAILED,
                                    A.TPS_TX_UPDATE_REQ_SUCCESS      = B.TPS_TX_UPDATE_REQ_SUCCESS,
                                    A.TPS_TX_UPDATE_TOO_BUSY         = B.TPS_TX_UPDATE_TOO_BUSY,
                                    A.TPS_TX_UPDATE_UNK_SUBSCRIBER   = B.TPS_TX_UPDATE_UNK_SUBSCRIBER
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.TPS_RX_PN_NON_POOL_EDENTITY,
                                    A.TPS_RX_PN_POOL_EDENTITY,
                                    A.TPS_RX_READ_MSGS,
                                    A.TPS_RX_UPDATE_MSGS,
                                    A.TPS_TX_READ_REQ_FAILED,
                                    A.TPS_TX_READ_REQ_SUCCESS,
                                    A.TPS_TX_READ_UNK_SUBSCRIBER,
                                    A.TPS_TX_UPDATE_INVAL_IDENTITY,
                                    A.TPS_TX_UPDATE_NOT_POOL_MEMBER,
                                    A.TPS_TX_UPDATE_OUTOF_SYNC,
                                    A.TPS_TX_UPDATE_REQ_FAILED,
                                    A.TPS_TX_UPDATE_REQ_SUCCESS,
                                    A.TPS_TX_UPDATE_TOO_BUSY,
                                    A.TPS_TX_UPDATE_UNK_SUBSCRIBER
                                    )
                            VALUES (
                                  B.FECHA,
                                  B.ALCANCE_TYPE,
                                  B.ALCANCE,
                                  B.SERVER,
                                  B.TPS_RX_PN_NON_POOL_EDENTITY,
                                  B.TPS_RX_PN_POOL_EDENTITY,
                                  B.TPS_RX_READ_MSGS,
                                  B.TPS_RX_UPDATE_MSGS,
                                  B.TPS_TX_READ_REQ_FAILED,
                                  B.TPS_TX_READ_REQ_SUCCESS,
                                  B.TPS_TX_READ_UNK_SUBSCRIBER,
                                  B.TPS_TX_UPDATE_INVAL_IDENTITY,
                                  B.TPS_TX_UPDATE_NOT_POOL_MEMBER,
                                  B.TPS_TX_UPDATE_OUTOF_SYNC,
                                  B.TPS_TX_UPDATE_REQ_FAILED,
                                  B.TPS_TX_UPDATE_REQ_SUCCESS,
                                  B.TPS_TX_UPDATE_TOO_BUSY,
                                  B.TPS_TX_UPDATE_UNK_SUBSCRIBER
                                    );
 COMMIT;
 EXIT;

