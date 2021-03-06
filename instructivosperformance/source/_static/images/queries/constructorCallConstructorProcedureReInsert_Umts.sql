
DECLARE

-- Autor: Mario Heredia. Fecha: 03.06.2016.
-- Constructor de llamadas al proceso de ReInsercion UMTS RAW

CURSOR LINEAS IS
SELECT TO_CHAR(FECHA, 'DD.MM.YYYY HH24') FECHA_CHR,
       CASE WHEN TRUNC(SYSDATE, 'HH24') >= FECHA THEN 'TRAER' ELSE 'NO TRAER' END FLG_FECHA,
       OSSRC,
       CASE WHEN MAX_SRL * 0.90 > NVL(SRL, 0) THEN 'Service_Level' END FLG_SRL,
       SRL,
       CASE WHEN MAX_TRF * 0.90 > NVL(TRF, 0) THEN 'Traffic' END FLG_TRF,
       TRF,
       CASE WHEN MAX_CRS * 0.90 > NVL(CRS, 0) THEN 'Cell_Resource' END FLG_CRS,
       CRS,
       CASE WHEN MAX_HSW * 0.90 > NVL(HSW, 0) THEN 'HSDPA_WBTS' END FLG_HSW,
       HSW,
       CASE WHEN MAX_CTP * 0.90 > NVL(CTP, 0) THEN 'Cell_thrput' END FLG_CTP,
       CTP,
       CASE WHEN MAX_RRC * 0.90 > NVL(RRC, 0) THEN 'RRC' END FLG_RRC,
       RRC,
       CASE WHEN MAX_YHO * 0.90 > NVL(YHO, 0) THEN 'Intra_System_Handover' END FLG_YHO,
       YHO,
       CASE WHEN MAX_SHO * 0.90 > NVL(SHO, 0) THEN 'Soft_Handover' END FLG_SHO,
       SHO,
       CASE WHEN MAX_IHO * 0.90 > NVL(IHO, 0) THEN 'Inter_System_Handover' END FLG_IHO,
       MAX_IHO,
       IHO,
       CASE WHEN MAX_CTW * 0.90 > NVL(CTW, 0) THEN 'Cell_Throughput_WBTS' END FLG_CTW,
       CTW,
       CASE WHEN MAX_CPI * 0.90 > NVL(CPI, 0) THEN 'Cpich_quality' END FLG_CPI,
       CPI,
       CASE WHEN MAX_L3I * 0.90 > NVL(L3I, 0) THEN 'L3Iub' END FLG_L3I,
       L3I,
       CASE WHEN MAX_PKT * 0.90 > NVL(PKT, 0) THEN 'Packet_call' END FLG_PKT,
       PKT
  FROM (
SELECT FECHA,
       OSSRC,
       MAX(SRL_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_SRL,
       SRL_CNT SRL,
       MAX(TRF_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_TRF,
       TRF_CNT TRF,
       MAX(CRS_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_CRS,
       CRS_CNT CRS,
       MAX(HSW_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_HSW,
       HSW_CNT HSW,
       MAX(CTP_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_CTP,
       CTP_CNT CTP,
       MAX(RRC_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_RRC,
       RRC_CNT RRC,
       MAX(YHO_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_YHO,
       YHO_CNT YHO,
       MAX(SHO_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_SHO,
       SHO_CNT SHO,
       MAX(IHO_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_IHO,
       IHO_CNT IHO,
       MAX(CTW_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_CTW,
       CTW_CNT CTW,
       MAX(CPI_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_CPI,
       CPI_CNT CPI,
       MAX(L3I_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_L3I,
       L3I_CNT L3I,
       MAX(PKT_CNT) OVER(PARTITION BY OSSRC ORDER BY FECHA ASC RANGE 24 PRECEDING) MAX_PKT,
       PKT_CNT PKT
  FROM AUX_UMTS_C_ALL_FCTRL_RAW
       );

V_PROCNAME VARCHAR2(30) := 'P_ALL_C_NSN_RAW_RINS';

/*
P_ALL_C_NSN_RAW_RINS('WCELL', 'HSDPA_WBTS', 'OSSRC1', '30.05.2016 21');
P_ALL_C_NSN_RAW_RINS('WCELL', 'Cell_Throughput_WBTS', 'OSSRC1', '30.05.2016 21');
P_ALL_C_NSN_RAW_RINS('WCELL', 'HSDPA_WBTS', 'OSSRC1', '30.05.2016 22');
P_ALL_C_NSN_RAW_RINS('WCELL', 'Cell_Throughput_WBTS', 'OSSRC1', '30.05.2016 22');
*/

BEGIN

FOR SYN IN LINEAS LOOP

    IF SYN.FLG_FECHA = 'TRAER' THEN

    IF SYN.FLG_SRL IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_SRL||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_TRF IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_TRF||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_CRS IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_CRS||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_HSW IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_HSW||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_CTP IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_CTP||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_RRC IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_RRC||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_YHO IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_YHO||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_SHO IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_SHO||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    /*
    IF SYN.FLG_IHO IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_IHO||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;
    */

    IF SYN.FLG_CTW IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_CTW||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_CPI IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_CPI||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_L3I IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_L3I||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');
    END IF;

    IF SYN.FLG_PKT IS NOT NULL THEN
       DBMS_OUTPUT.PUT_LINE(V_PROCNAME||' (''WCELL'', '''||SYN.FLG_PKT||''', '''||SYN.OSSRC||''', '''||SYN.FECHA_CHR||''');');

    END IF;

    END IF;

END LOOP;

END;
/
