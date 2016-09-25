----POR MERCADO, WEEK
SELECT TRUNC(FECHA, 'DAY') FECHA,
       MERCADO,
       PAIS,
       SUM(QDA_NUM) QDA_NUM,
       SUM(QDA_DEN) QDA_DEN,
       SUM(QDR_NUM) QDR_NUM,
       SUM(QDR_DEN) QDR_DEN,
       ROUND(SUM(QDA_NUM)/ SUM(QDA_DEN),4) QDA,
       ROUND(SUM(QDR_NUM)/ SUM(QDR_DEN),4) QDR,
       ROUND(SUM(QDA_NUM)/ SUM(QDA_DEN) * SUM(QDR_NUM)/ SUM(QDR_DEN),4) NQI
  FROM(
----POR MERCADO, DAY
SELECT FECHA,
       MERCADO,
       PAIS,
       SUM(QDA_NUM) QDA_NUM,
       SUM(QDA_DEN) QDA_DEN,
       SUM(QDR_NUM) QDR_NUM,
       SUM(QDR_DEN) QDR_DEN,
       ROUND(SUM(QDA_NUM)/ SUM(QDA_DEN),4) QDA,
       ROUND(SUM(QDR_NUM)/ SUM(QDR_DEN),4) QDR,
       ROUND(SUM(QDA_NUM)/ SUM(QDA_DEN) * SUM(QDR_NUM)/ SUM(QDR_DEN),4) NQI
  FROM(
-----POR CELDA, DAY
SELECT TRUNC(FECHA) FECHA,
       LNCEL_ID,
       MERCADO,
       PAIS,
       SUM(QDA_NUM) QDA_NUM,
       SUM(QDA_DEN) QDA_DEN,
       SUM(QDR_NUM) QDR_NUM,
       SUM(QDR_DEN) QDR_DEN,
       ROUND(DECODE(SUM(QDA_DEN),0,0, SUM(QDA_NUM)/ SUM(QDA_DEN)),4) QDA,
       ROUND(DECODE(SUM(QDR_DEN),0,0, SUM(QDR_NUM)/ SUM(QDR_DEN)),4) QDR 
   FROM(
        SELECT A.FECHA, 
               A.LNCEL_ID,
               B.MERCADO,
               B.PAIS,
               SUM(QDA_NUM) QDA_NUM,
               SUM(QDA_DEN) QDA_DEN,
               --100 * DECODE(SUM(QDA_DEN), 0, 0, SUM(QDA_NUM) / SUM(QDA_DEN)) QDA_RTE,
               
               SUM(QDR_NUM) QDR_NUM,
               SUM(QDR_DEN) QDR_DEN
               --100 * DECODE(SUM(QDR_DEN), 0, 0, SUM(QDR_NUM) / SUM(QDR_DEN)) QDR_RTE
          FROM(
                SELECT FECHA, 
                       LNCEL_ID,
                       ACCESIBILITY,
                       RETAINABILITY,
                       CASE WHEN ACCESIBILITY < 99 THEN 0
                                                   ELSE QDA_ATTEMPTS END QDA_NUM,
                       QDA_ATTEMPTS QDA_DEN,
                       CASE WHEN RETAINABILITY < 99 THEN 0
                                                    ELSE QDR_ATTEMPTS END QDR_NUM,
                       QDR_ATTEMPTS QDR_DEN
                  FROM(
                        SELECT FECHA,
                               LNCEL_ID,
                               ROUND(CASE WHEN SIGN_CONN_ESTAB_ATT = 0 THEN 1
                                          WHEN EPS_BEARER_SETUP_ATTEMPTS = 0 THEN (100*(SIGN_CONN_ESTAB_COMP/SIGN_CONN_ESTAB_ATT))
                                                                             ELSE (100*(SIGN_CONN_ESTAB_COMP/SIGN_CONN_ESTAB_ATT) * 
                                                                                       (EPS_BEARER_SETUP_COMPLETIONS/EPS_BEARER_SETUP_ATTEMPTS)) END, 6) ACCESIBILITY,
                               (SIGN_CONN_ESTAB_ATT + 2 * EPS_BEARER_SETUP_ATTEMPTS) QDA_ATTEMPTS,
                               ROUND(100*(1- DECODE(QDR_ATTEMPTS,0,0,((EPC_EPS_BEARER_REL_REQ_RNL + EPC_EPS_BEARER_REL_REQ_OTH + ENB_EPS_BEARER_REL_REQ_RNL + 
                                                           ENB_EPS_BEARER_REL_REQ_TNL + ENB_EPS_BEARER_REL_REQ_OTH) / QDR_ATTEMPTS))),6) RETAINABILITY,       
                               QDR_ATTEMPTS
                          FROM(
                                --SELECT TRUNC(A.PERIOD_START_TIME, 'HH24') FECHA,
                                SELECT A.PERIOD_START_TIME FECHA,
                                       --A.LNBTS_ID,
                                       A.LNCEL_ID,
                                       SUM(SIGN_CONN_ESTAB_COMP) SIGN_CONN_ESTAB_COMP,
                                        
                                       SUM(SIGN_CONN_ESTAB_ATT_MO_S + SIGN_CONN_ESTAB_ATT_MT + SIGN_CONN_ESTAB_ATT_MO_D + SIGN_CONN_ESTAB_ATT_OTHERS + 
                                           SIGN_CONN_ESTAB_ATT_EMG) SIGN_CONN_ESTAB_ATT,
                                             
                                       SUM(EPS_BEARER_SETUP_COMPLETIONS) EPS_BEARER_SETUP_COMPLETIONS,
                                       SUM(EPS_BEARER_SETUP_ATTEMPTS) EPS_BEARER_SETUP_ATTEMPTS,
                                       
                                       SUM(EPC_EPS_BEARER_REL_REQ_RNL) EPC_EPS_BEARER_REL_REQ_RNL,
                                       SUM(EPC_EPS_BEARER_REL_REQ_OTH) EPC_EPS_BEARER_REL_REQ_OTH,
                                       SUM(ENB_EPS_BEARER_REL_REQ_RNL) ENB_EPS_BEARER_REL_REQ_RNL,
                                       SUM(ENB_EPS_BEARER_REL_REQ_TNL) ENB_EPS_BEARER_REL_REQ_TNL,
                                       SUM(ENB_EPS_BEARER_REL_REQ_OTH) ENB_EPS_BEARER_REL_REQ_OTH,
                                       
                                       SUM(EPC_EPS_BEARER_REL_REQ_NORM + EPC_EPS_BEARER_REL_REQ_DETACH + EPC_EPS_BEARER_REL_REQ_RNL + EPC_EPS_BEARER_REL_REQ_OTH +
                                           ENB_EPSBEAR_REL_REQ_RNL_REDIR + ENB_EPS_BEARER_REL_REQ_NORM + ENB_EPS_BEARER_REL_REQ_RNL + ENB_EPS_BEARER_REL_REQ_TNL + 
                                           ENB_EPS_BEARER_REL_REQ_OTH + PRE_EMPT_GBR_BEARER + PRE_EMPT_NON_GBR_BEARER) QDR_ATTEMPTS
                                              
                                  FROM NOKLTE_PS_LUEST_MNC1_RAW A,
                                       NOKLTE_PS_LEPSB_MNC1_RAW B
                                 WHERE /*A.PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') + 21600/86400 AND TO_DATE('&2', 'DD.MM.YYYY') + 75600/86400*/
                                       A.PERIOD_START_TIME IN
                                       (
                                        SELECT FECHA
                                          FROM CALIDAD_STATUS_REFERENCES
                                         WHERE FECHA BETWEEN TO_DATE('&FECHA_INICIO', 'DD.MM.YYYY')
                                                         AND TO_DATE('&FECHA_FIN', 'DD.MM.YYYY') + 83999 / 84000
                                           AND HORA NOT IN ('00', '01', '02', '03', '04', '05', '22', '23')
                                       )
                                   AND A.PERIOD_START_TIME = B.PERIOD_START_TIME
                                   AND A.LNCEL_ID = B.LNCEL_ID
                                   --AND A.LNCEL_ID = 2568256812568
                                --GROUP BY TRUNC(A.PERIOD_START_TIME, 'HH24'),
                                GROUP BY A.PERIOD_START_TIME,
                                       --A.LNBTS_ID,
                                       A.LNCEL_ID
                              )
                      )
              )A, OBJECTS_SP_LTE B
        WHERE A.LNCEL_ID = B.LNCEL_ID (+)
          --AND MERCADO = 'Bs.As./La Pam'
        GROUP BY A.FECHA, 
               A.LNCEL_ID,
               B.MERCADO,
               B.PAIS
       )
GROUP BY TRUNC(FECHA),
       LNCEL_ID,
       MERCADO,
       PAIS
       )
GROUP BY FECHA,
       MERCADO,
       PAIS     
      )
GROUP BY TRUNC(FECHA, 'DAY'),
       MERCADO,
       PAIS     
