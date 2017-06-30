-- Autor: Mario Heredia.
-- Modificación: Cristian Farias.
-- Fecha:01/06/2016
-- Motivo: Se divide la querie en 3 para mostrar los datos por cada OSSRC.

--TAB=OSSRC1
with    RFC as ( 
               SELECT FECHA 
               FROM CALIDAD_STATUS_REFERENCES 
               WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                              AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
               ), 
        TF2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_TRAFFIC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        HO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_HO_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        SR2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_SERVICE_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESAVAIL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESACC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        FE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_FER_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        CO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_COD_SCH_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        PC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_PCU_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        QOS as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_QOSPCL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RXQ as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RXQUAL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC1' 
                 GROUP BY PERIOD_START_TIME 
               ) 
SELECT RFC.FECHA,
       TF2.CANTIDAD CANT_TFC,
       HO2.CANTIDAD CANT_HOV,
       SR2.CANTIDAD CANT_SRV,
       RE2.CANTIDAD CANT_RES,
       RC2.CANTIDAD CANT_REC,
       FE2.CANTIDAD CANT_FER,
       CO2.CANTIDAD CANT_COS,
       PC2.CANTIDAD CANT_PCU,
       QOS.CANTIDAD CANT_QOS,
       RXQ.CANTIDAD CANT_RXQ
FROM   RFC,
       TF2,
       HO2,
       SR2,
       RE2,
       RC2,
       FE2,
       CO2,
       PC2,
       QOS,
       RXQ
WHERE   RFC.FECHA = TF2.FECHA (+)
AND     RFC.FECHA = HO2.FECHA (+)
AND     RFC.FECHA = SR2.FECHA (+)
AND     RFC.FECHA = RE2.FECHA (+)
AND     RFC.FECHA = RC2.FECHA (+)
AND     RFC.FECHA = FE2.FECHA (+)
AND     RFC.FECHA = CO2.FECHA (+)
AND     RFC.FECHA = PC2.FECHA (+)
AND     RFC.FECHA = QOS.FECHA (+)
AND     RFC.FECHA = RXQ.FECHA (+)
ORDER BY RFC.FECHA;

--TAB=OSSRC2
with    RFC as ( 
               SELECT FECHA 
               FROM CALIDAD_STATUS_REFERENCES 
               WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                              AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
               ), 
        TF2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_TRAFFIC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        HO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_HO_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        SR2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_SERVICE_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESAVAIL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESACC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        FE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_FER_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        CO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_COD_SCH_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        PC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_PCU_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        QOS as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_QOSPCL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RXQ as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RXQUAL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC2' 
                 GROUP BY PERIOD_START_TIME 
               ) 
SELECT RFC.FECHA,
       TF2.CANTIDAD CANT_TFC,
       HO2.CANTIDAD CANT_HOV,
       SR2.CANTIDAD CANT_SRV,
       RE2.CANTIDAD CANT_RES,
       RC2.CANTIDAD CANT_REC,
       FE2.CANTIDAD CANT_FER,
       CO2.CANTIDAD CANT_COS,
       PC2.CANTIDAD CANT_PCU,
       QOS.CANTIDAD CANT_QOS,
       RXQ.CANTIDAD CANT_RXQ
FROM   RFC,
       TF2,
       HO2,
       SR2,
       RE2,
       RC2,
       FE2,
       CO2,
       PC2,
       QOS,
       RXQ
WHERE   RFC.FECHA = TF2.FECHA (+)
AND     RFC.FECHA = HO2.FECHA (+)
AND     RFC.FECHA = SR2.FECHA (+)
AND     RFC.FECHA = RE2.FECHA (+)
AND     RFC.FECHA = RC2.FECHA (+)
AND     RFC.FECHA = FE2.FECHA (+)
AND     RFC.FECHA = CO2.FECHA (+)
AND     RFC.FECHA = PC2.FECHA (+)
AND     RFC.FECHA = QOS.FECHA (+)
AND     RFC.FECHA = RXQ.FECHA (+)
ORDER BY RFC.FECHA;

--TAB=OSSRC3
with    RFC as ( 
               SELECT FECHA 
               FROM CALIDAD_STATUS_REFERENCES 
               WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                              AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
               ), 
        TF2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_TRAFFIC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        HO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_HO_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        SR2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_SERVICE_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESAVAIL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESACC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        FE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_FER_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        CO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_COD_SCH_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        PC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_PCU_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        QOS as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_QOSPCL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RXQ as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RXQUAL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC3' 
                 GROUP BY PERIOD_START_TIME 
               ) 
SELECT RFC.FECHA,
       TF2.CANTIDAD CANT_TFC,
       HO2.CANTIDAD CANT_HOV,
       SR2.CANTIDAD CANT_SRV,
       RE2.CANTIDAD CANT_RES,
       RC2.CANTIDAD CANT_REC,
       FE2.CANTIDAD CANT_FER,
       CO2.CANTIDAD CANT_COS,
       PC2.CANTIDAD CANT_PCU,
       QOS.CANTIDAD CANT_QOS,
       RXQ.CANTIDAD CANT_RXQ
FROM   RFC,
       TF2,
       HO2,
       SR2,
       RE2,
       RC2,
       FE2,
       CO2,
       PC2,
       QOS,
       RXQ
WHERE   RFC.FECHA = TF2.FECHA (+)
AND     RFC.FECHA = HO2.FECHA (+)
AND     RFC.FECHA = SR2.FECHA (+)
AND     RFC.FECHA = RE2.FECHA (+)
AND     RFC.FECHA = RC2.FECHA (+)
AND     RFC.FECHA = FE2.FECHA (+)
AND     RFC.FECHA = CO2.FECHA (+)
AND     RFC.FECHA = PC2.FECHA (+)
AND     RFC.FECHA = QOS.FECHA (+)
AND     RFC.FECHA = RXQ.FECHA (+)
ORDER BY RFC.FECHA;

--TAB=OSSRC5
with    RFC as ( 
               SELECT FECHA 
               FROM CALIDAD_STATUS_REFERENCES 
               WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                              AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
               ), 
        TF2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_TRAFFIC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        HO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_HO_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        SR2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_SERVICE_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESAVAIL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RESACC_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        FE2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_FER_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        CO2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_COD_SCH_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        PC2 as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_PCU_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        QOS as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_QOSPCL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ), 
        RXQ as ( 
                 SELECT PERIOD_START_TIME FECHA, COUNT(*) CANTIDAD 
                 FROM GSM_C_NSN_RXQUAL_HOU2 -- 
                 WHERE PERIOD_START_TIME BETWEEN TO_DATE('&1', 'DD.MM.YYYY') 
                                          AND TO_DATE('&2', 'DD.MM.YYYY')  + 86399/86400 
                 AND OSSRC = 'OSSRC5' 
                 GROUP BY PERIOD_START_TIME 
               ) 
SELECT RFC.FECHA,
       TF2.CANTIDAD CANT_TFC,
       HO2.CANTIDAD CANT_HOV,
       SR2.CANTIDAD CANT_SRV,
       RE2.CANTIDAD CANT_RES,
       RC2.CANTIDAD CANT_REC,
       FE2.CANTIDAD CANT_FER,
       CO2.CANTIDAD CANT_COS,
       PC2.CANTIDAD CANT_PCU,
       QOS.CANTIDAD CANT_QOS,
       RXQ.CANTIDAD CANT_RXQ
FROM   RFC,
       TF2,
       HO2,
       SR2,
       RE2,
       RC2,
       FE2,
       CO2,
       PC2,
       QOS,
       RXQ
WHERE   RFC.FECHA = TF2.FECHA (+)
AND     RFC.FECHA = HO2.FECHA (+)
AND     RFC.FECHA = SR2.FECHA (+)
AND     RFC.FECHA = RE2.FECHA (+)
AND     RFC.FECHA = RC2.FECHA (+)
AND     RFC.FECHA = FE2.FECHA (+)
AND     RFC.FECHA = CO2.FECHA (+)
AND     RFC.FECHA = PC2.FECHA (+)
AND     RFC.FECHA = QOS.FECHA (+)
AND     RFC.FECHA = RXQ.FECHA (+)
ORDER BY RFC.FECHA;

