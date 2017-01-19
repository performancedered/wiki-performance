
-- AUTOR: MONICA PELLEGRINI. FECHA: 28.01.2016. MOTIVO: SOLITUD DE NUEVAS TABLAS PARA PLATAFORMA OCUDR TEKELEC_OCUDR_OAM_HOUR
-- Actualizacion: Monica Pellegrini. Fecha:25.04.2016. Motivo: Se cambia la tabla completamente por cambios desde el lado del proveedor.

MERGE INTO TEKELEC_OCUDR_OAM_RAW A
 USING(SELECT   FECHA,
                ALCANCE_TYPE,
                ALCANCE,
                SERVER,
                NAME,
                CPU_COREUTILPCT_PEAK,
                CPU_COREUTILPCT_AVERAGE
         FROM AUX_OCUDR_OAM
       WHERE FECHA BETWEEN TO_DATE('&1', 'DD.MM.YYYY')
                       AND TO_DATE('&2', 'DD.MM.YYYY') + 86399/86400
       ORDER BY FECHA
       ) B
       ON(A.FECHA = B.FECHA AND
          A.ALCANCE_TYPE = B.ALCANCE_TYPE AND
          A.ALCANCE = B.ALCANCE AND
          A.SERVER = B.SERVER AND
          A.NAME    = B.NAME)
       WHEN MATCHED THEN UPDATE SET A.CPU_COREUTILPCT_PEAK     = B.CPU_COREUTILPCT_PEAK,
                                    A.CPU_COREUTILPCT_AVERAGE  = B.CPU_COREUTILPCT_AVERAGE
        WHEN NOT MATCHED THEN INSERT (
                                    A.FECHA,
                                    A.ALCANCE_TYPE,
                                    A.ALCANCE,
                                    A.SERVER,
                                    A.NAME,
                                    A.CPU_COREUTILPCT_PEAK,
                                    A.CPU_COREUTILPCT_AVERAGE
                                    )
                            VALUES (
                                    B.FECHA,
                                    B.ALCANCE_TYPE,
                                    B.ALCANCE,
                                    B.SERVER,
                                    B.NAME,
                                    B.CPU_COREUTILPCT_PEAK,
                                    B.CPU_COREUTILPCT_AVERAGE
                                    );
 COMMIT;
 EXIT;

