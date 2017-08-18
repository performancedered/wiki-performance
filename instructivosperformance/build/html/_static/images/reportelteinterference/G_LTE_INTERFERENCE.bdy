create or replace package body G_LTE_INTERFERENCE AS

PROCEDURE p_lte_interferencia(FECHA_DESDE in char,FECHA_HASTA in char) IS
 vNumeroRegistros NUMBER;
 faltante_de_datos EXCEPTION;
BEGIN 
-- control semanal de faltante de datos 
SELECT COUNT(*) INTO vNumeroRegistros       
                         FROM LTE_NSN_PAQ_LCEL_IBHW
                         WHERE fecha BETWEEN TO_DATE(FECHA_DESDE, 'DD.MM.YYYY') 
                                         AND TO_DATE(FECHA_HASTA, 'DD.MM.YYYY');
           IF vNumeroRegistros<8000 THEN
               RAISE faltante_de_datos;
           END IF;
-- fin del control 
 merge into Tablero_LTE_interference tablero using (
with 
object_lte as (SELECT  
                      o1.lncel_id,
                      o1.LNBTS_ID,
                      o1.OSSRC,
                      o1.LNCEL_NAME,
                      o1.LNBTS_NAME,
                      o1.pais,
                      CASE WHEN EARFCNDL>9000 THEN 'BANDA_700'
                       ELSE 'BANDA_AWS'
                       END BANDA,
                      CASE WHEN (EARFCNDL=2000 OR EARFCNDL=9260) THEN 'MVS' ELSE 'AMX'
                        END RANSHARING
          FROM  OBJECTS_SP_LTE o1,OBJECTS_NSN_LNCEL_AUX o2
               WHERE 
                o1.MR_name not like ('NO COMERCIAL%')
               and TO_DATE (FECHA_DESDE,'DD.MM.YYYY') BETWEEN O1.LNCEL_VALID_START_DATE AND O1.LNCEL_VALID_FINISH_DATE
               and o1.LNCEL_ID = o2.MRBTS || o2.LNBTS || o2.LNCEL  
               and o1.ossrc=o2.ossrc
               AND PAIS is not null 
               and o1.LNCEL_NAME NOT IN ('LC9997A')--celda de test ranSharing
               and o1.LNBTS_NAME not like 'PR%' and o1.LNBTS_NAME not like  'TST%' 
                                    
 ),
 
 
 DATAS as (SELECT t1.fecha,
       LNCEL_name,
       LNBTS_name,
       o1.lncel_id,
       o1.lnbts_id,
       o1.ossrc,
       BANDA,
         o1.pais,
         RANSHARING,
       --ROUND(DECODE((RSSI_PUCCH_UL_DEN), 0, 0,(RSSI_PUCCH_UL_NUM) / (RSSI_PUCCH_UL_DEN)), 2) RSSIPUCCHULAVG,
       ROUND(DECODE((RSSI_PUSCH_UL_DEN), 0, 0,(RSSI_PUSCH_UL_NUM) / (RSSI_PUSCH_UL_DEN)), 2) RSSIPUSCHAVG,
       --ROUND(DECODE((SINR_PUCCH_UL_DEN), 0, 0,(SINR_PUCCH_UL_NUM) / (SINR_PUCCH_UL_DEN)), 2) SINRPUCCHAVG
       ROUND(DECODE((SINR_PUSCH_UL_DEN), 0, 0,(SINR_PUSCH_UL_NUM) / (SINR_PUSCH_UL_DEN)), 2) SINRPUSCHAVG 
FROM             LTE_NSN_PAQ_LCEL_IBHW t1, object_lte o1
WHERE 
 o1.lncel_id=t1.lncel_id
and o1.LNBTS_ID= T1.LNBTS_id
and o1.OSSRC   = t1.OSSRC
AND T1.fecha BETWEEN TO_DATE (FECHA_DESDE,'DD.MM.YYYY') 
                                             AND TO_DATE (FECHA_HASTA,'DD.MM.YYYY')  
)


SELECT fecha,
       LNCEL_name,
       LNBTS_name,
       lncel_id,
       lnbts_id,
       ossrc,
       banda,
       PAIS,  
       RSSIPUSCHAVG,
       SINRPUSCHAVG,
       Ransharing, 
       CASE WHEN RSSIPUSCHAVG > -95 AND SINRPUSCHAVG < 5 THEN 1 ELSE 0 END INTERFERIDO
FROM   DATAS
            ) D
ON (tablero.fecha=d.fecha and tablero.Lncel_Name=d.LNCEL_name)
 WHEN MATCHED THEN
   UPDATE SET
        tablero.RSSIPUSCHAVG=D.RSSIPUSCHAVG,
        tablero.SINRPUSCHAVG=D.SINRPUSCHAVG,
        tablero.INTERFERIDO=D.INTERFERIDO,  
        tablero.banda=D.BANDA,
        tablero.ransharing=D.Ransharing
   
 WHEN NOT MATCHED THEN
   INSERT (FECHA,
           LNCEL_NAME,
           LNBTS_name,
           LNCEL_ID,
           LNBTS_ID,
           OSSRC,
           BANDA,
           PAIS,  
           RSSIPUSCHAVG,
           SINRPUSCHAVG,
           INTERFERIDO,
           RANSHARING
          
           ) VALUES
           (
           D.FECHA,
           D.LNCEL_NAME,
           D.LNBTS_name,
           D.LNCEL_ID,
           D.LNBTS_ID,
           D.OSSRC,
           D.BANDA,
           D.PAIS,  
           D.RSSIPUSCHAVG,
           D.SINRPUSCHAVG,
           D.INTERFERIDO,
           D.Ransharing
           );          
  Commit;
           EXCEPTION 
      WHEN faltante_de_datos  THEN 
        G_ERROR_LOG_NEW.P_LOG_ERROR('p_lte_interferencia --FALTANTE DE DATOS '||vNumeroRegistros,SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
      WHEN OTHERS THEN
        G_ERROR_LOG_NEW.P_LOG_ERROR('p_lte_interferencia',SQLCODE,SQLERRM,DBMS_UTILITY.format_error_backtrace );
 END;                
           
end G_LTE_INTERFERENCE;
/
