 -- AUTOR: MONICA PELLEGRINI. FECHA: 28.01.2016. MOTIVO: SOLITUD DE NUEVAS TABLAS PARA PLATAFORMA OCUDR TEKELEC_OCUDR_SH_PERF_HOUR

MERGE INTO TEKELEC_OCUDR_SH_PERF_RAW A
 USING(SELECT   FECHA         ,
        ALCANCE_TYPE           ,
        ALCANCE                ,
        SERVER                 ,
        RX_REQ_PUR             ,
        RX_REQ_REJ_INV_SER_IND ,
        RX_REQ_SNR             ,
        RX_REQ_UDR             ,
        RX_RES_PNA             ,
        TX_REQ_PNR             ,
        TX_RES_PUA             ,
        TX_RES_SNA             ,
        TX_RES_UDA             
         FROM AUX_OCUDR_SH_PERFORMANCE
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400 
       ORDER BY FECHA 
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER)
       WHEN MATCHED THEN UPDATE SET A.RX_REQ_PUR          =  B.RX_REQ_PUR       ,
                                    A.RX_REQ_REJ_INV_SER_IND  =  B.RX_REQ_REJ_INV_SER_IND,
                                    A.RX_REQ_SNR              =  B.RX_REQ_SNR,
                                    A.RX_REQ_UDR              =  B.RX_REQ_UDR,
                                    A.RX_RES_PNA              =  B.RX_RES_PNA,
                                    A.TX_REQ_PNR              =  B.TX_REQ_PNR,
                                    A.TX_RES_PUA              =  B.TX_RES_PUA,
                                    A.TX_RES_SNA              =  B.TX_RES_SNA,
                                    A.TX_RES_UDA              =  B.TX_RES_UDA
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.RX_REQ_PUR ,      
                                    A.RX_REQ_REJ_INV_SER_IND,
                                    A.RX_REQ_SNR    ,        
                                    A.RX_REQ_UDR   ,         
                                    A.RX_RES_PNA   ,         
                                    A.TX_REQ_PNR    ,        
                                    A.TX_RES_PUA    ,        
                                    A.TX_RES_SNA    ,        
                                    A.TX_RES_UDA     
                                    )
                            VALUES (
                                    B.FECHA,
                                    B.ALCANCE_TYPE,
                                    B.ALCANCE,
                                    B.SERVER,
                                    B.RX_REQ_PUR   ,
                                    B.RX_REQ_REJ_INV_SER_IND,
                                    B.RX_REQ_SNR,
                                    B.RX_REQ_UDR,
                                    B.RX_RES_PNA,
                                    B.TX_REQ_PNR,
                                    B.TX_RES_PUA,
                                    B.TX_RES_SNA,
                                    B.TX_RES_UDA
                                    );
 COMMIT;
 EXIT;

