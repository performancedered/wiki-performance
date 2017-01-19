 -- AUTOR: MONICA PELLEGRINI. FECHA: 28.01.2016. MOTIVO: SOLITUD DE NUEVAS TABLAS PARA PLATAFORMA OCUDR TEKELEC_OCUDR_COMAGENT_HOUR

MERGE INTO TEKELEC_OCUDR_COMAGENT_RAW A
 USING(SELECT   FECHA         ,
                ALCANCE_TYPE           ,
                ALCANCE                ,
                SERVER                 ,
                CA_AVG_RSRC_POOL_UTIL,
                CA_AVG_RX_STACK_EVENTS,
                CA_AVG_TX_STACK_EVENTS,
                CA_DS_TX,
                CA_PEAK_RSRC_POOL_UTIL,
                CA_PEAK_RX_STACK_EVENTS,
                CA_PEAK_TX_STACK_EVENTS,
                CA_RX,
                CA_RX_BUNDLED,
                CA_RX_EVENTS_BUNDLED,
                CA_RX_SUCCESS,
                CA_TX,
                CA_TX_BUNDLED,
                CA_TX_EVENTS_BUNDLED,
                CA_TX_SUCCESS           
         FROM AUX_OCUDR_COMAGENT_PERFORMANCE
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.CA_AVG_RSRC_POOL_UTIL     = B.CA_AVG_RSRC_POOL_UTIL,
                                    A.CA_AVG_RX_STACK_EVENTS    = B.CA_AVG_RX_STACK_EVENTS,
                                    A.CA_AVG_TX_STACK_EVENTS    = B.CA_AVG_TX_STACK_EVENTS,
                                    A.CA_DS_TX                  = B.CA_DS_TX,
                                    A.CA_PEAK_RSRC_POOL_UTIL    = B.CA_PEAK_RSRC_POOL_UTIL,
                                    A.CA_PEAK_RX_STACK_EVENTS   = B.CA_PEAK_RX_STACK_EVENTS,
                                    A.CA_PEAK_TX_STACK_EVENTS   = B.CA_PEAK_TX_STACK_EVENTS,
                                    A.CA_RX                     = B.CA_RX,
                                    A.CA_RX_BUNDLED             = B.CA_RX_BUNDLED,
                                    A.CA_RX_EVENTS_BUNDLED      = B.CA_RX_EVENTS_BUNDLED,
                                    A.CA_RX_SUCCESS             = B.CA_RX_SUCCESS,
                                    A.CA_TX                     = B.CA_TX,
                                    A.CA_TX_BUNDLED             = B.CA_TX_BUNDLED,
                                    A.CA_TX_EVENTS_BUNDLED      = B.CA_TX_EVENTS_BUNDLED,
                                    A.CA_TX_SUCCESS             = B.CA_TX_SUCCESS
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.CA_AVG_RSRC_POOL_UTIL,
                                    A.CA_AVG_RX_STACK_EVENTS,
                                    A.CA_AVG_TX_STACK_EVENTS,
                                    A.CA_DS_TX,
                                    A.CA_PEAK_RSRC_POOL_UTIL,
                                    A.CA_PEAK_RX_STACK_EVENTS,
                                    A.CA_PEAK_TX_STACK_EVENTS,
                                    A.CA_RX,
                                    A.CA_RX_BUNDLED,
                                    A.CA_RX_EVENTS_BUNDLED,
                                    A.CA_RX_SUCCESS,
                                    A.CA_TX,
                                    A.CA_TX_BUNDLED,
                                    A.CA_TX_EVENTS_BUNDLED,
                                    A.CA_TX_SUCCESS 
                                    )
                            VALUES (
                                    B.FECHA,
                                    B.ALCANCE_TYPE,
                                    B.ALCANCE,
                                    B.SERVER,
                                    B.CA_AVG_RSRC_POOL_UTIL,
                                    B.CA_AVG_RX_STACK_EVENTS,
                                    B.CA_AVG_TX_STACK_EVENTS,
                                    B.CA_DS_TX,
                                    B.CA_PEAK_RSRC_POOL_UTIL,
                                    B.CA_PEAK_RX_STACK_EVENTS,
                                    B.CA_PEAK_TX_STACK_EVENTS,
                                    B.CA_RX,
                                    B.CA_RX_BUNDLED,
                                    B.CA_RX_EVENTS_BUNDLED,
                                    B.CA_RX_SUCCESS,
                                    B.CA_TX,
                                    B.CA_TX_BUNDLED,
                                    B.CA_TX_EVENTS_BUNDLED,
                                    B.CA_TX_SUCCESS
                                    );
 COMMIT;
 EXIT;
