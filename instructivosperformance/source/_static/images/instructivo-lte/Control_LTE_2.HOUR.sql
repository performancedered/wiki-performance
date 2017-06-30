-- Autor: Cristian Farias. 
-- Fecha: 03.10.2016.
-- Motivo: Se modifican las queries para juntar los resultados por LNCEL y NE.

--------------------------------------------------------------------------------------------
-- LNCEL
--------------------------------------------------------------------------------------------

--Tab=LteLNCELHour

with  FCH as  (SELECT /*+ materialize */ FECHA
            FROM CALIDAD_STATUS_REFERENCES
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            ), 
    SRV1 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_SERVICE_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC1'
            GROUP BY FECHA
            ),        
    PAQ1 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_PAQ_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC1'
            GROUP BY FECHA
            ),
    AVA1 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_AVAIL_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC1'
            GROUP BY FECHA
            ),
    SRV2 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_SERVICE_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC2'
            GROUP BY FECHA
            ),        
    PAQ2 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_PAQ_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC2'
            GROUP BY FECHA
            ),
    AVA2 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_AVAIL_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC2'
            GROUP BY FECHA
            ),
    SRV3 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_SERVICE_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC3'
            GROUP BY FECHA
            ),        
    PAQ3 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_PAQ_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC3'
            GROUP BY FECHA
            ),
    AVA3 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_AVAIL_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC3'
            GROUP BY FECHA
            ),

    SRV5 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_SERVICE_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC5'
            GROUP BY FECHA
            ),        
    PAQ5 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_PAQ_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC5'
            GROUP BY FECHA
            ),
    AVA5 as  (SELECT /*+ materialize */ FECHA,
            COUNT(1) CANTIDAD
            FROM LTE_NSN_AVAIL_LCEL_HOUR
            WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
            AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
            AND OSSRC = 'OSSRC5'
            GROUP BY FECHA
            )      
SELECT FCH.FECHA,
SRV1.CANTIDAD SRV_RC1,
PAQ1.CANTIDAD PAQ_RC1,
AVA1.CANTIDAD AVA_RC1,
SRV2.CANTIDAD SRV_RC2,
PAQ2.CANTIDAD PAQ_RC2,
AVA2.CANTIDAD AVA_RC2,
SRV3.CANTIDAD SRV_RC3,
PAQ3.CANTIDAD PAQ_RC3,
AVA3.CANTIDAD AVA_RC3,
SRV5.CANTIDAD SRV_RC5,
PAQ5.CANTIDAD PAQ_RC5,
AVA5.CANTIDAD AVA_RC5
FROM FCH,
SRV1,
PAQ1,
AVA1,
SRV2,
PAQ2,
AVA2,
SRV3,
PAQ3,
AVA3,
SRV5,
PAQ5,
AVA5
WHERE FCH.FECHA  = SRV1.FECHA (+)
AND   FCH.FECHA  = PAQ1.FECHA (+)
AND   FCH.FECHA  = AVA1.FECHA (+)
AND   FCH.FECHA  = SRV2.FECHA (+)
AND   FCH.FECHA  = PAQ2.FECHA (+)
AND   FCH.FECHA  = AVA2.FECHA (+)
AND   FCH.FECHA  = SRV3.FECHA (+)
AND   FCH.FECHA  = PAQ3.FECHA (+)
AND   FCH.FECHA  = AVA3.FECHA (+)
AND   FCH.FECHA  = SRV5.FECHA (+)
AND   FCH.FECHA  = PAQ5.FECHA (+)
AND   FCH.FECHA  = AVA5.FECHA (+)
ORDER BY FCH.FECHA;

--------------------------------------------------------------------------------------------
-- NE
--------------------------------------------------------------------------------------------

--Tab=LteNEHour
with  FCH  as  (SELECT /*+ materialize */ FECHA
              FROM CALIDAD_STATUS_REFERENCES
              WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
              ),
    IOS as  (SELECT /*+ materialize */ FECHA,
                            ELEMENT_CLASS,
                            COUNT(1) CANTIDAD
                    FROM LTE_NSN_SERVICE_NE_HOUR
                    WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
                    GROUP BY FECHA, ELEMENT_CLASS
                    ),
    IOP as  (SELECT /*+ materialize */ FECHA,
                            ELEMENT_CLASS,
                            COUNT(1) CANTIDAD
                    FROM LTE_NSN_PAQ_NE_HOUR
                    WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
                    GROUP BY FECHA, ELEMENT_CLASS
                    ),
    IOA as  (SELECT /*+ materialize */ FECHA,
                            ELEMENT_CLASS,
                            COUNT(1) CANTIDAD
                    FROM LTE_NSN_AVAIL_NE_HOUR
                    WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                                AND TO_DATE('&2', 'DD.MM.YYYY')+86399/86400
                    GROUP BY FECHA, ELEMENT_CLASS
                    ),
    ITS as  (SELECT /*+ materialize */ FECHA,
                            DECODE(ELEMENT_CLASS, 'LNBTS'  , CANTIDAD) LBS_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'ALM'    , CANTIDAD) ALM_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'CIUDAD' , CANTIDAD) CDD_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'PAIS'   , CANTIDAD) CTY_CANTIDAD
                    FROM  IOS
                    ),
    ITP as  (SELECT /*+ materialize */ FECHA,
                            DECODE(ELEMENT_CLASS, 'LNBTS'  , CANTIDAD) LBS_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'ALM'    , CANTIDAD) ALM_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'CIUDAD' , CANTIDAD) CDD_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'PAIS'   , CANTIDAD) CTY_CANTIDAD
                    FROM  IOP
                    ),
    ITA as  (SELECT /*+ materialize */ FECHA,
                            DECODE(ELEMENT_CLASS, 'LNBTS'  , CANTIDAD) LBS_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'ALM'    , CANTIDAD) ALM_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'MERCADO', CANTIDAD) MRC_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'CIUDAD' , CANTIDAD) CDD_CANTIDAD,
                            DECODE(ELEMENT_CLASS, 'PAIS'   , CANTIDAD) CTY_CANTIDAD
                    FROM  IOA
                    ),
    IHS as  (SELECT /*+ materialize */ FECHA,
                              MAX(LBS_CANTIDAD) LBS_CANTIDAD,
                              MAX(ALM_CANTIDAD) ALM_CANTIDAD,
                              MAX(MRC_CANTIDAD) MRC_CANTIDAD,
                              MAX(CDD_CANTIDAD) CDD_CANTIDAD,
                              MAX(CTY_CANTIDAD) CTY_CANTIDAD
                      FROM  ITS
                      GROUP BY FECHA
                      ),
    IHP as  (SELECT /*+ materialize */ FECHA,
                              MAX(LBS_CANTIDAD) LBS_CANTIDAD,
                              MAX(ALM_CANTIDAD) ALM_CANTIDAD,
                              MAX(MRC_CANTIDAD) MRC_CANTIDAD,
                              MAX(CDD_CANTIDAD) CDD_CANTIDAD,
                              MAX(CTY_CANTIDAD) CTY_CANTIDAD
                      FROM  ITP
                      GROUP BY FECHA
                      ),
    IHA as  (SELECT /*+ materialize */ FECHA,
                              MAX(LBS_CANTIDAD) LBS_CANTIDAD,
                              MAX(ALM_CANTIDAD) ALM_CANTIDAD,
                              MAX(MRC_CANTIDAD) MRC_CANTIDAD,
                              MAX(CDD_CANTIDAD) CDD_CANTIDAD,
                              MAX(CTY_CANTIDAD) CTY_CANTIDAD
                      FROM  ITA
                      GROUP BY FECHA
                      )
SELECT FCH.FECHA,
       IHS.LBS_CANTIDAD SRV_LBS,
       IHS.ALM_CANTIDAD SRV_ALM,
       IHS.MRC_CANTIDAD SRV_MRC,
       IHS.CDD_CANTIDAD SRV_CDD,
       IHS.CTY_CANTIDAD SRV_CTY,    
       IHP.LBS_CANTIDAD PAQ_LBS,
       IHP.ALM_CANTIDAD PAQ_ALM,
       IHP.MRC_CANTIDAD PAQ_MRC,
       IHP.CDD_CANTIDAD PAQ_CDD,
       IHP.CTY_CANTIDAD PAQ_CTY,
       IHA.LBS_CANTIDAD AVA_LBS,
       IHA.ALM_CANTIDAD AVA_ALM,
       IHA.MRC_CANTIDAD AVA_MRC,
       IHA.CDD_CANTIDAD AVA_CDD,
       IHA.CTY_CANTIDAD AVA_CTY
FROM  IHS,
      IHP,
      IHA,
      FCH
WHERE IHS.FECHA (+) = FCH.FECHA
AND   IHP.FECHA (+) = FCH.FECHA
AND   IHA.FECHA (+) = FCH.FECHA
ORDER BY FCH.FECHA;
