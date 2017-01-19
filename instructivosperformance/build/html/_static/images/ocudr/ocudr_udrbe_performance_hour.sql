 
-- AUTOR: MONICA PELLEGRINI. FECHA: 28.01.2016. MOTIVO: SOLITUD DE NUEVAS TABLAS PARA PLATAFORMA OCUDR TEKELEC_OCUDR_UDRBE_PERF_HOUR

MERGE INTO TEKELEC_OCUDR_UDRBE_PERF_RAW A
 USING(SELECT   FECHA,
                ALCANCE_TYPE,
                ALCANCE,
                SERVER,
                RX_PNNON_POOL_EDENTITY,
                RX_PN_POOL_EDENTITY,
                RX_READ_MSGS,
                RX_UPDATE_MSGS,
                TX_READ_REQ_FAILED,
                TX_READ_REQ_SUCCESS,
                TX_READ_UNK_SUBSCRIBER,
                TX_UPDATE_INVAL_IDENTITY,
                TX_UPDATE_NOT_POOL_MEMBER,
                TX_UPDATE_OUTOF_SYNC,
                TX_UPDATE_REQ_FAILED,
                TX_UPDATE_REQ_SUCCESS,
                TX_UPDATE_TOO_BUSY,
                TX_UPDATE_UNK_SUBSCRIBER   
         FROM AUX_OCUDR_UDRBE_PERFORMANCE
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.RX_PNNON_POOL_EDENTITY     = B.RX_PNNON_POOL_EDENTITY,
                                    A.RX_PN_POOL_EDENTITY        = B.RX_PN_POOL_EDENTITY,
                                    A.RX_READ_MSGS               = B.RX_READ_MSGS,
                                    A.RX_UPDATE_MSGS             = B.RX_UPDATE_MSGS,
                                    A.TX_READ_REQ_FAILED         = B.TX_READ_REQ_FAILED,
                                    A.TX_READ_REQ_SUCCESS        = B.TX_READ_REQ_SUCCESS,
                                    A.TX_READ_UNK_SUBSCRIBER     = B.TX_READ_UNK_SUBSCRIBER,
                                    A.TX_UPDATE_INVAL_IDENTITY   = B.TX_UPDATE_INVAL_IDENTITY,
                                    A.TX_UPDATE_NOT_POOL_MEMBER  = B.TX_UPDATE_NOT_POOL_MEMBER,
                                    A.TX_UPDATE_OUTOF_SYNC       = B.TX_UPDATE_OUTOF_SYNC,
                                    A.TX_UPDATE_REQ_FAILED       = B.TX_UPDATE_REQ_FAILED,
                                    A.TX_UPDATE_REQ_SUCCESS      = B.TX_UPDATE_REQ_SUCCESS,
                                    A.TX_UPDATE_TOO_BUSY         = B.TX_UPDATE_TOO_BUSY,
                                    A.TX_UPDATE_UNK_SUBSCRIBER   = B.TX_UPDATE_UNK_SUBSCRIBER
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.RX_PNNON_POOL_EDENTITY,
                                    A.RX_PN_POOL_EDENTITY,
                                    A.RX_READ_MSGS,
                                    A.RX_UPDATE_MSGS,
                                    A.TX_READ_REQ_FAILED,
                                    A.TX_READ_REQ_SUCCESS,
                                    A.TX_READ_UNK_SUBSCRIBER,
                                    A.TX_UPDATE_INVAL_IDENTITY,
                                    A.TX_UPDATE_NOT_POOL_MEMBER,
                                    A.TX_UPDATE_OUTOF_SYNC,
                                    A.TX_UPDATE_REQ_FAILED,
                                    A.TX_UPDATE_REQ_SUCCESS,
                                    A.TX_UPDATE_TOO_BUSY,
                                    A.TX_UPDATE_UNK_SUBSCRIBER
                                    )
                            VALUES (
                                  B.FECHA,
                                  B.ALCANCE_TYPE,
                                  B.ALCANCE,
                                  B.SERVER,
                                  B.RX_PNNON_POOL_EDENTITY,
                                  B.RX_PN_POOL_EDENTITY,
                                  B.RX_READ_MSGS,
                                  B.RX_UPDATE_MSGS,
                                  B.TX_READ_REQ_FAILED,
                                  B.TX_READ_REQ_SUCCESS,
                                  B.TX_READ_UNK_SUBSCRIBER,
                                  B.TX_UPDATE_INVAL_IDENTITY,
                                  B.TX_UPDATE_NOT_POOL_MEMBER,
                                  B.TX_UPDATE_OUTOF_SYNC,
                                  B.TX_UPDATE_REQ_FAILED,
                                  B.TX_UPDATE_REQ_SUCCESS,
                                  B.TX_UPDATE_TOO_BUSY,
                                  B.TX_UPDATE_UNK_SUBSCRIBER
                                    );
 COMMIT;
 EXIT;
