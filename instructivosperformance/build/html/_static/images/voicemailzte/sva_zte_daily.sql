
-- Autor: Mauro Arraigada. Fecha: 19.05.2014
-- Actualizacion: Mauro Arraigada. Fecha: 02.07.2014. Motivo: se modifican script para variables bind.
-- Actualizacion: Mauro Arraigada. Fecha: 02.12.2014. Motivo: se agrega el campo PAIS en todas las tablas.
-- Actualizacion: Monica Pellegrini. Fecha: 23.11.2016. Motivo: Se agrega una nueva tabla bh.

VARIABLE FECHA_DESDE VARCHAR2(15);
VARIABLE FECHA_HASTA VARCHAR2(15);
VARIABLE MASCARA     VARCHAR2(15);
VARIABLE TR_HR       VARCHAR2(4);

EXEC :FECHA_DESDE := '&1';
EXEC :FECHA_HASTA := '&2';
EXEC :MASCARA     := 'DD.MM.YYYY';
EXEC :TR_HR       := 'HH24';

DELETE FROM SVA_ZTE_TRAFFIC_BH
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_TRAFFIC_BH
SELECT FECHA,
       HORA,
       AREA_CODE,
       COS,
       TOTAL_CALL_COUNT,
       TOTAL_CALL_DURATION,
       TOTAL_GUEST_ACCESS,
       GUEST_ACCESS_DURATION,
       SUBSCRIBER_ACCESS,
       SUBSCRIBER_ACCESS_DURATION,
       COM_ACCESS_FAIL_MAILBOX,
       COM_ACCESS_FAIL_MAILBOX_DUR,
       OUTGOING_CALL,
       OUTGOING_CALL_DURATION,
       PAIS
  FROM (
SELECT TRUNC(FECHA)           FECHA,
       TO_CHAR(FECHA, :TR_HR) HORA,
       AREA_CODE,
       COS,
       TOTAL_CALL_COUNT,
       TOTAL_CALL_DURATION,
       TOTAL_GUEST_ACCESS,
       GUEST_ACCESS_DURATION,
       SUBSCRIBER_ACCESS,
       SUBSCRIBER_ACCESS_DURATION,
       COM_ACCESS_FAIL_MAILBOX,
       COM_ACCESS_FAIL_MAILBOX_DUR,
       OUTGOING_CALL,
       OUTGOING_CALL_DURATION,
       PAIS,
       ROW_NUMBER() OVER(ORDER BY TOTAL_CALL_COUNT DESC) ORDEN
  FROM SVA_ZTE_TRAFFIC_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
       )
WHERE ORDEN = 1;

COMMIT;

DELETE FROM SVA_ZTE_TRAFFIC_DAY
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_TRAFFIC_DAY
SELECT TRUNC(FECHA)                      FECHA,
       AREA_CODE,
       COS,
       SUM(TOTAL_CALL_COUNT)             TOTAL_CALL_COUNT,
       SUM(TOTAL_CALL_DURATION)          TOTAL_CALL_DURATION,
       SUM(TOTAL_GUEST_ACCESS)           TOTAL_GUEST_ACCESS,
       SUM(GUEST_ACCESS_DURATION)        GUEST_ACCESS_DURATION,
       SUM(SUBSCRIBER_ACCESS)            SUBSCRIBER_ACCESS,
       SUM(SUBSCRIBER_ACCESS_DURATION)   SUBSCRIBER_ACCESS_DURATION,
       SUM(COM_ACCESS_FAIL_MAILBOX)      COM_ACCESS_FAIL_MAILBOX,
       SUM(COM_ACCESS_FAIL_MAILBOX_DUR)  COM_ACCESS_FAIL_MAILBOX_DUR,
       SUM(OUTGOING_CALL)                OUTGOING_CALL,
       SUM(OUTGOING_CALL_DURATION)       OUTGOING_CALL_DURATION,
       PAIS
  FROM SVA_ZTE_TRAFFIC_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
 GROUP BY TRUNC(FECHA), AREA_CODE, COS, PAIS;

COMMIT;

DELETE FROM SVA_ZTE_MCA_FWD_BH
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_MCA_FWD_BH
SELECT FECHA,
       HORA,
       AREA_CODE,
       COS,
       TOTAL_MISSING_CALL_COUNT,
       B_NOT_ANSWER_COUNT,
       B_BUSY_COUNT,
       B_UNREACHABLE_COUNT,
       OTHER_CALL_COUNT,
       PAIS
  FROM (
SELECT TRUNC(FECHA)           FECHA,
       TO_CHAR(FECHA, :TR_HR) HORA,
       AREA_CODE,
       COS,
       TOTAL_MISSING_CALL_COUNT,
       B_NOT_ANSWER_COUNT,
       B_BUSY_COUNT,
       B_UNREACHABLE_COUNT,
       OTHER_CALL_COUNT,
       PAIS,
       ROW_NUMBER() OVER(ORDER BY TOTAL_MISSING_CALL_COUNT DESC) ORDEN
  FROM SVA_ZTE_MCA_FWD_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
       )
 WHERE ORDEN = 1;

COMMIT;

DELETE FROM SVA_ZTE_MCA_FWD_DAY
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_MCA_FWD_DAY
SELECT TRUNC(FECHA)                    FECHA,
       AREA_CODE,
       COS,
       SUM(TOTAL_MISSING_CALL_COUNT)   TOTAL_MISSING_CALL_COUNT,
       SUM(B_NOT_ANSWER_COUNT)         B_NOT_ANSWER_COUNT,
       SUM(B_BUSY_COUNT)               B_BUSY_COUNT,
       SUM(B_UNREACHABLE_COUNT)        B_UNREACHABLE_COUNT,
       SUM(OTHER_CALL_COUNT)           OTHER_CALL_COUNT,
       PAIS
  FROM SVA_ZTE_MCA_FWD_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
 GROUP BY TRUNC(FECHA), AREA_CODE, COS, PAIS;

COMMIT;

DELETE FROM SVA_ZTE_DEPOSIT_MESSAGE_BH
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_DEPOSIT_MESSAGE_BH
SELECT FECHA,
       HORA,
       AREA_CODE,
       COS,
       GUEST_DEPOSIT_MAIL,
       GUEST_DEPOSIT_MAIL_DURATION,
       GUEST_RECORD_EMPTY_MSG,
       GUEST_RECORD_MSG_SUCCESS,
       GUEST_RECORD_MSG_FAILURE,
       GUEST_ADD_RECORDING,
       GUEST_ADD_RECORDING_DURATION,
       GUEST_DEPOSIT_FUT_DELIV_MAIL,
       NODEPOSIT_FOR_BOX_NOT_EXIST,
       NODEPOSIT_FOR_BOX_FULL,
       NODEPOSIT_FOR_BOX_INACTIVE,
       PAIS
  FROM (
SELECT TRUNC(FECHA)           FECHA,
       TO_CHAR(FECHA, :TR_HR) HORA,
       AREA_CODE,
       COS,
       GUEST_DEPOSIT_MAIL,
       GUEST_DEPOSIT_MAIL_DURATION,
       GUEST_RECORD_EMPTY_MSG,
       GUEST_RECORD_MSG_SUCCESS,
       GUEST_RECORD_MSG_FAILURE,
       GUEST_ADD_RECORDING,
       GUEST_ADD_RECORDING_DURATION,
       GUEST_DEPOSIT_FUT_DELIV_MAIL,
       NODEPOSIT_FOR_BOX_NOT_EXIST,
       NODEPOSIT_FOR_BOX_FULL,
       NODEPOSIT_FOR_BOX_INACTIVE,
       PAIS,
       ROW_NUMBER() OVER(ORDER BY GUEST_DEPOSIT_MAIL DESC) ORDEN
  FROM SVA_ZTE_DEPOSIT_MESSAGE_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
       )
 WHERE ORDEN = 1;

COMMIT;

DELETE FROM SVA_ZTE_DEPOSIT_MESSAGE_DAY
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_DEPOSIT_MESSAGE_DAY
SELECT TRUNC(FECHA)                        FECHA,
       AREA_CODE,
       COS,
       SUM(GUEST_DEPOSIT_MAIL)             GUEST_DEPOSIT_MAIL,
       SUM(GUEST_DEPOSIT_MAIL_DURATION)    GUEST_DEPOSIT_MAIL_DURATION,
       SUM(GUEST_RECORD_EMPTY_MSG)         GUEST_RECORD_EMPTY_MSG,
       SUM(GUEST_RECORD_MSG_SUCCESS)       GUEST_RECORD_MSG_SUCCESS,
       SUM(GUEST_RECORD_MSG_FAILURE)       GUEST_RECORD_MSG_FAILURE,
       SUM(GUEST_ADD_RECORDING)            GUEST_ADD_RECORDING,
       SUM(GUEST_ADD_RECORDING_DURATION)   GUEST_ADD_RECORDING_DURATION,
       SUM(GUEST_DEPOSIT_FUT_DELIV_MAIL)   GUEST_DEPOSIT_FUT_DELIV_MAIL,
       SUM(NODEPOSIT_FOR_BOX_NOT_EXIST)    NODEPOSIT_FOR_BOX_NOT_EXIST,
       SUM(NODEPOSIT_FOR_BOX_FULL)         NODEPOSIT_FOR_BOX_FULL,
       SUM(NODEPOSIT_FOR_BOX_INACTIVE)     NODEPOSIT_FOR_BOX_INACTIVE,
       PAIS
  FROM SVA_ZTE_DEPOSIT_MESSAGE_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
 GROUP BY TRUNC(FECHA), AREA_CODE, COS, PAIS;

COMMIT;

DELETE FROM SVA_ZTE_RETRIEVE_MESSAGE_BH
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_RETRIEVE_MESSAGE_BH
SELECT FECHA,
       HORA,
       AREA_CODE,
       COS,
       CHANNEL,
       RETRIEVE_NEW_MAIL_COUNT,
       RETRIEVE_HEARD_MAIL_COUNT,
       RETRIEVE_MAIL_FAIL,
       DELETE_MAIL_COUNT,
       SAVE_MAIL_COUNT,
       PAIS
  FROM (
SELECT TRUNC(FECHA)           FECHA,
       TO_CHAR(FECHA, :TR_HR) HORA,
       AREA_CODE,
       COS,
       CHANNEL,
       RETRIEVE_NEW_MAIL_COUNT,
       RETRIEVE_HEARD_MAIL_COUNT,
       RETRIEVE_MAIL_FAIL,
       DELETE_MAIL_COUNT,
       SAVE_MAIL_COUNT,
       PAIS,
       ROW_NUMBER() OVER(ORDER BY RETRIEVE_NEW_MAIL_COUNT DESC) ORDEN
  FROM SVA_ZTE_RETRIEVE_MESSAGE_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
       )
 WHERE ORDEN = 1;

DELETE FROM SVA_ZTE_RETRIEVE_MESSAGE_DAY
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_RETRIEVE_MESSAGE_DAY
SELECT TRUNC(FECHA)                    FECHA,
       AREA_CODE,
       COS,
       SUM(CHANNEL)                    CHANNEL,
       SUM(RETRIEVE_NEW_MAIL_COUNT)    RETRIEVE_NEW_MAIL_COUNT,
       SUM(RETRIEVE_HEARD_MAIL_COUNT)  RETRIEVE_HEARD_MAIL_COUNT,
       SUM(RETRIEVE_MAIL_FAIL)         RETRIEVE_MAIL_FAIL,
       SUM(DELETE_MAIL_COUNT)          DELETE_MAIL_COUNT,
       SUM(SAVE_MAIL_COUNT)            SAVE_MAIL_COUNT,
       PAIS
  FROM SVA_ZTE_RETRIEVE_MESSAGE_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
 GROUP BY TRUNC(FECHA), AREA_CODE, COS, PAIS;

COMMIT;

DELETE FROM SVA_ZTE_PROVISIONING_DAY
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_PROVISIONING_DAY
SELECT TRUNC(FECHA)                    FECHA,
       AREA_CODE,
       COS,
       SUM(CHANNEL)                    CHANNEL,
       SUM(CREATION_COUNT)             CREATION_COUNT,
       SUM(CREATION_SUCCESS_COUNT)     CREATION_SUCCESS_COUNT,
       SUM(CREATION_FAILURE_COUNT)     CREATION_FAILURE_COUNT,
       SUM(DELETION_COUNT)             DELETION_COUNT,
       SUM(DELETION_SUCCESS_COUNT)     DELETION_SUCCESS_COUNT,
       SUM(DELETION_FAILURE_COUNT)     DELETION_FAILURE_COUNT,
       SUM(MODIFICATION_COUNT)         MODIFICATION_COUNT,
       SUM(MODIFICATION_SUCCESS_COUNT) MODIFICATION_SUCCESS_COUNT,
       SUM(MODIFICATION_FAILURE_COUNT) MODIFICATION_FAILURE_COUNT,
       PAIS
  FROM SVA_ZTE_PROVISIONING_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
 GROUP BY TRUNC(FECHA), AREA_CODE, COS, PAIS;

COMMIT;

DELETE FROM SVA_ZTE_PROVISIONING_BH
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400;

COMMIT;

INSERT INTO SVA_ZTE_PROVISIONING_BH
SELECT  FECHA,
        HORA,
        AREA_CODE,
        COS,
        CHANNEL,
        CREATION_COUNT,
        CREATION_SUCCESS_COUNT,
        CREATION_FAILURE_COUNT,
        DELETION_COUNT,
        DELETION_SUCCESS_COUNT,
        DELETION_FAILURE_COUNT,
        MODIFICATION_COUNT,
        MODIFICATION_SUCCESS_COUNT,
        MODIFICATION_FAILURE_COUNT,
        PAIS   
  FROM(
SELECT TRUNC(FECHA)           FECHA,
       TO_CHAR(FECHA, :TR_HR) HORA,
       AREA_CODE,
       COS,
       CHANNEL,
       CREATION_COUNT,
       CREATION_SUCCESS_COUNT,
       CREATION_FAILURE_COUNT,
       DELETION_COUNT,
       DELETION_SUCCESS_COUNT,
       DELETION_FAILURE_COUNT,
       MODIFICATION_COUNT,
       MODIFICATION_SUCCESS_COUNT,
       MODIFICATION_FAILURE_COUNT,
       PAIS,
       ROW_NUMBER() OVER(ORDER BY CREATION_COUNT DESC) ORDEN
  FROM SVA_ZTE_PROVISIONING_HOUR
 WHERE FECHA BETWEEN TO_DATE(:FECHA_DESDE , :MASCARA)
                 AND TO_DATE(:FECHA_HASTA , :MASCARA) + 86399 / 86400
        )
 WHERE ORDEN = 1 ;
 

COMMIT;

EXIT;


