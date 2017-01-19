-- Autor: Monica Pellegrini. Fecha:22.09.2016
-- Actualizacion: Monica Pellegrini. Fecha:02.11.2016. Motivo: se la deja que corra horaria. 
-- Actualizacion: Monica Pellegrini. Fecha: 30.11.2016. Motivo: se agregan los procesos de 3g datos.

VARIABLE FECHA_DESDE VARCHAR2(15);
VARIABLE FECHA_HASTA  VARCHAR2(15);

EXEC :FECHA_DESDE := '&1 &2';
EXEC :FECHA_HASTA := '&3 &4';

BEGIN

P_UMTS_NSN_QDA_QDR_HOUR_INS ( P_FECHA_DESDE => :FECHA_DESDE,
                              P_FECHA_HASTA => :FECHA_HASTA);

P_UMTS_NSN_DIRECT_NQI_HOUR_INS ( P_FECHA_DESDE => :FECHA_DESDE,
                                P_FECHA_HASTA => :FECHA_HASTA);

P_UMTS_NSN_RETENTION_3G_INS ( P_FECHA_DESDE => :FECHA_DESDE,
                              P_FECHA_HASTA => :FECHA_HASTA);

P_UMTS_NSN_WEIGH_AVAIL_INS ( P_FECHA_DESDE => :FECHA_DESDE,
                             P_FECHA_HASTA => :FECHA_HASTA);

P_UMTS_NSN_QDA_QDR_DATOS_HOUR ( P_FECHA_DESDE => :FECHA_DESDE,
                                P_FECHA_HASTA => :FECHA_HASTA);


P_UMTS_NSN_RETE_DATOS_HOUR ( P_FECHA_DESDE => :FECHA_DESDE,
                              P_FECHA_HASTA => :FECHA_HASTA);
                              
P_UMTS_NSN_USER_THROUGHPUT ( P_FECHA_DESDE => :FECHA_DESDE,
                              P_FECHA_HASTA => :FECHA_HASTA);

P_UMTS_NSN_HSDPA_USERS_RATIO ( P_FECHA_DESDE => :FECHA_DESDE,
                               P_FECHA_HASTA => :FECHA_HASTA);  


END;
/
EXIT;
