
-- Autor: Mauro Arraigada. Fecha: 15.05.2014
-- Actualizacion: Mauro Arraigada. Fecha: 19.05.2014. Motivo: se agregan 2 contadores en traffic.
-- Actualizacion: Mauro Arraigada. Fecha: 02.07.2014. Motivo: se modifican script para variables bind.
-- Actualizacion: Mauro Arraigada. Fecha: 02.12.2014. Motivo: se agrega el campo PAIS en todas las tablas.
-- Actualizacion: Monica Pellegrini. Fecha: 22.11.2016. Motivo: Se agrega un row_number para sacar duplicados.

VARIABLE MASCARA_DY   VARCHAR2(10);
VARIABLE MASCARA      VARCHAR2(20);

EXEC :MASCARA_DY := 'YYYY.MM.DD';
EXEC :MASCARA    := 'YYYY.MM.DD HH24:MI';

 MERGE INTO SVA_ZTE_TRAFFIC_HOUR A
 USING (
SELECT  FECHA,
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
  FROM( 
SELECT TO_DATE(SUBSTR(FECHA, 1, 16), :MASCARA) FECHA,
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
       TRIM(PAIS) PAIS,
       ROW_NUMBER () OVER(PARTITION BY TO_DATE(SUBSTR(FECHA, 1, 16), 'YYYY.MM.DD HH24:MI') , TRIM(PAIS)  ORDER BY TO_DATE(SUBSTR(FECHA, 1, 16), 'YYYY.MM.DD HH24:MI')DESC) ORDEN
  FROM AUX_SVA_ZTE_TRAFFIC
       )
 WHERE ORDEN = 1 
       ) O
    ON (O.FECHA = A.FECHA AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                   = O.AREA_CODE,
                               A.COS                         = O.COS,
                               A.TOTAL_CALL_COUNT            = O.TOTAL_CALL_COUNT,
                               A.TOTAL_CALL_DURATION         = O.TOTAL_CALL_DURATION,
                               A.TOTAL_GUEST_ACCESS          = O.TOTAL_GUEST_ACCESS,
                               A.GUEST_ACCESS_DURATION       = O.GUEST_ACCESS_DURATION,
                               A.SUBSCRIBER_ACCESS           = O.SUBSCRIBER_ACCESS,
                               A.SUBSCRIBER_ACCESS_DURATION  = O.SUBSCRIBER_ACCESS_DURATION,
                               A.COM_ACCESS_FAIL_MAILBOX     = O.COM_ACCESS_FAIL_MAILBOX,
                               A.COM_ACCESS_FAIL_MAILBOX_DUR = O.COM_ACCESS_FAIL_MAILBOX_DUR,
                               A.OUTGOING_CALL               = O.OUTGOING_CALL,
                               A.OUTGOING_CALL_DURATION      = O.OUTGOING_CALL_DURATION
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.TOTAL_CALL_COUNT,
                               A.TOTAL_CALL_DURATION,
                               A.TOTAL_GUEST_ACCESS,
                               A.GUEST_ACCESS_DURATION,
                               A.SUBSCRIBER_ACCESS,
                               A.SUBSCRIBER_ACCESS_DURATION,
                               A.COM_ACCESS_FAIL_MAILBOX,
                               A.COM_ACCESS_FAIL_MAILBOX_DUR,
                               A.OUTGOING_CALL,
                               A.OUTGOING_CALL_DURATION,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.TOTAL_CALL_COUNT,
                               O.TOTAL_CALL_DURATION,
                               O.TOTAL_GUEST_ACCESS,
                               O.GUEST_ACCESS_DURATION,
                               O.SUBSCRIBER_ACCESS,
                               O.SUBSCRIBER_ACCESS_DURATION,
                               O.COM_ACCESS_FAIL_MAILBOX,
                               O.COM_ACCESS_FAIL_MAILBOX_DUR,
                               O.OUTGOING_CALL,
                               O.OUTGOING_CALL_DURATION,
                               O.PAIS
                               );

 MERGE INTO SVA_ZTE_PROVISIONING_HOUR A
 USING (
SELECT TO_DATE(SUBSTR(FECHA, 1, 16), :MASCARA) FECHA,
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
       TRIM(PAIS) PAIS
  FROM AUX_SVA_ZTE_PROVISIONING
   ) O
    ON (O.FECHA = A.FECHA AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                   = O.AREA_CODE,
                               A.COS                         = O.COS,
                               A.CHANNEL                     = O.CHANNEL,
                               A.CREATION_COUNT              = O.CREATION_COUNT,
                               A.CREATION_SUCCESS_COUNT      = O.CREATION_SUCCESS_COUNT,
                               A.CREATION_FAILURE_COUNT      = O.CREATION_FAILURE_COUNT,
                               A.DELETION_COUNT              = O.DELETION_COUNT,
                               A.DELETION_SUCCESS_COUNT      = O.DELETION_SUCCESS_COUNT,
                               A.DELETION_FAILURE_COUNT      = O.DELETION_FAILURE_COUNT,
                               A.MODIFICATION_COUNT          = O.MODIFICATION_COUNT,
                               A.MODIFICATION_SUCCESS_COUNT  = O.MODIFICATION_SUCCESS_COUNT,
                               A.MODIFICATION_FAILURE_COUNT  = O.MODIFICATION_FAILURE_COUNT
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.CHANNEL,
                               A.CREATION_COUNT,
                               A.CREATION_SUCCESS_COUNT,
                               A.CREATION_FAILURE_COUNT,
                               A.DELETION_COUNT,
                               A.DELETION_SUCCESS_COUNT,
                               A.DELETION_FAILURE_COUNT,
                               A.MODIFICATION_COUNT,
                               A.MODIFICATION_SUCCESS_COUNT,
                               A.MODIFICATION_FAILURE_COUNT,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.CHANNEL,
                               O.CREATION_COUNT,
                               O.CREATION_SUCCESS_COUNT,
                               O.CREATION_FAILURE_COUNT,
                               O.DELETION_COUNT,
                               O.DELETION_SUCCESS_COUNT,
                               O.DELETION_FAILURE_COUNT,
                               O.MODIFICATION_COUNT,
                               O.MODIFICATION_SUCCESS_COUNT,
                               O.MODIFICATION_FAILURE_COUNT,
                               O.PAIS
                               );

 MERGE INTO SVA_ZTE_MCA_FWD_HOUR A
 USING (
SELECT TO_DATE(SUBSTR(FECHA, 1, 16), :MASCARA) FECHA,
       AREA_CODE,
       COS,
       TOTAL_MISSING_CALL_COUNT,
       B_NOT_ANSWER_COUNT,
       B_BUSY_COUNT,
       B_UNREACHABLE_COUNT,
       OTHER_CALL_COUNT,
       TRIM(PAIS) PAIS
  FROM AUX_SVA_ZTE_MCA_FWD
       ) O
    ON (O.FECHA = A.FECHA AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                = O.AREA_CODE,
                               A.COS                      = O.COS,
                               A.TOTAL_MISSING_CALL_COUNT = O.TOTAL_MISSING_CALL_COUNT,
                               A.B_NOT_ANSWER_COUNT       = O.B_NOT_ANSWER_COUNT,
                               A.B_BUSY_COUNT             = O.B_BUSY_COUNT,
                               A.B_UNREACHABLE_COUNT      = O.B_UNREACHABLE_COUNT,
                               A.OTHER_CALL_COUNT         = O.OTHER_CALL_COUNT
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.TOTAL_MISSING_CALL_COUNT,
                               A.B_NOT_ANSWER_COUNT,
                               A.B_BUSY_COUNT,
                               A.B_UNREACHABLE_COUNT,
                               A.OTHER_CALL_COUNT,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.TOTAL_MISSING_CALL_COUNT,
                               O.B_NOT_ANSWER_COUNT,
                               O.B_BUSY_COUNT,
                               O.B_UNREACHABLE_COUNT,
                               O.OTHER_CALL_COUNT,
                               O.PAIS
                               );

 MERGE INTO SVA_ZTE_DEPOSIT_MESSAGE_HOUR A
 USING (
SELECT TO_DATE(SUBSTR(FECHA, 1, 16), :MASCARA) FECHA,
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
       TRIM(PAIS) PAIS
  FROM AUX_SVA_ZTE_DEPOSIT_MESSAGE
       ) O
    ON (O.FECHA = A.FECHA AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                      = O.AREA_CODE,
                               A.COS                            = O.COS,
                               A.GUEST_DEPOSIT_MAIL             = O.GUEST_DEPOSIT_MAIL,
                               A.GUEST_DEPOSIT_MAIL_DURATION    = O.GUEST_DEPOSIT_MAIL_DURATION,
                               A.GUEST_RECORD_EMPTY_MSG         = O.GUEST_RECORD_EMPTY_MSG,
                               A.GUEST_RECORD_MSG_SUCCESS       = O.GUEST_RECORD_MSG_SUCCESS,
                               A.GUEST_RECORD_MSG_FAILURE       = O.GUEST_RECORD_MSG_FAILURE,
                               A.GUEST_ADD_RECORDING            = O.GUEST_ADD_RECORDING,
                               A.GUEST_ADD_RECORDING_DURATION   = O.GUEST_ADD_RECORDING_DURATION,
                               A.GUEST_DEPOSIT_FUT_DELIV_MAIL   = O.GUEST_DEPOSIT_FUT_DELIV_MAIL,
                               A.NODEPOSIT_FOR_BOX_NOT_EXIST    = O.NODEPOSIT_FOR_BOX_NOT_EXIST,
                               A.NODEPOSIT_FOR_BOX_FULL         = O.NODEPOSIT_FOR_BOX_FULL,
                               A.NODEPOSIT_FOR_BOX_INACTIVE     = O.NODEPOSIT_FOR_BOX_INACTIVE
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.GUEST_DEPOSIT_MAIL,
                               A.GUEST_DEPOSIT_MAIL_DURATION,
                               A.GUEST_RECORD_EMPTY_MSG,
                               A.GUEST_RECORD_MSG_SUCCESS,
                               A.GUEST_RECORD_MSG_FAILURE,
                               A.GUEST_ADD_RECORDING,
                               A.GUEST_ADD_RECORDING_DURATION,
                               A.GUEST_DEPOSIT_FUT_DELIV_MAIL,
                               A.NODEPOSIT_FOR_BOX_NOT_EXIST,
                               A.NODEPOSIT_FOR_BOX_FULL,
                               A.NODEPOSIT_FOR_BOX_INACTIVE,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.GUEST_DEPOSIT_MAIL,
                               O.GUEST_DEPOSIT_MAIL_DURATION,
                               O.GUEST_RECORD_EMPTY_MSG,
                               O.GUEST_RECORD_MSG_SUCCESS,
                               O.GUEST_RECORD_MSG_FAILURE,
                               O.GUEST_ADD_RECORDING,
                               O.GUEST_ADD_RECORDING_DURATION,
                               O.GUEST_DEPOSIT_FUT_DELIV_MAIL,
                               O.NODEPOSIT_FOR_BOX_NOT_EXIST,
                               O.NODEPOSIT_FOR_BOX_FULL,
                               O.NODEPOSIT_FOR_BOX_INACTIVE,
                               O.PAIS
                               );


 MERGE INTO SVA_ZTE_RETRIEVE_MESSAGE_HOUR A
 USING (
SELECT TO_DATE(SUBSTR(FECHA, 1, 16), :MASCARA) FECHA,
       AREA_CODE,
       COS,
       CHANNEL,
       RETRIEVE_NEW_MAIL_COUNT,
       RETRIEVE_HEARD_MAIL_COUNT,
       RETRIEVE_MAIL_FAIL,
       DELETE_MAIL_COUNT,
       SAVE_MAIL_COUNT,
       TRIM(PAIS) PAIS
  FROM AUX_SVA_ZTE_RETRIEVE_MESSAGE
       ) O
    ON (O.FECHA = A.FECHA AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                 = O.AREA_CODE,
                               A.COS                       = O.COS,
                               A.CHANNEL                   = O.CHANNEL,
                               A.RETRIEVE_NEW_MAIL_COUNT   = O.RETRIEVE_NEW_MAIL_COUNT,
                               A.RETRIEVE_HEARD_MAIL_COUNT = O.RETRIEVE_HEARD_MAIL_COUNT,
                               A.RETRIEVE_MAIL_FAIL        = O.RETRIEVE_MAIL_FAIL,
                               A.DELETE_MAIL_COUNT         = O.DELETE_MAIL_COUNT,
                               A.SAVE_MAIL_COUNT           = O.SAVE_MAIL_COUNT
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.CHANNEL,
                               A.RETRIEVE_NEW_MAIL_COUNT,
                               A.RETRIEVE_HEARD_MAIL_COUNT,
                               A.RETRIEVE_MAIL_FAIL,
                               A.DELETE_MAIL_COUNT,
                               A.SAVE_MAIL_COUNT,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.CHANNEL,
                               O.RETRIEVE_NEW_MAIL_COUNT,
                               O.RETRIEVE_HEARD_MAIL_COUNT,
                               O.RETRIEVE_MAIL_FAIL,
                               O.DELETE_MAIL_COUNT,
                               O.SAVE_MAIL_COUNT,
                               O.PAIS
                               );

 MERGE INTO SVA_ZTE_MAILBOX_COUNT_DAY A
 USING (
SELECT TO_DATE(FECHA, :MASCARA_DY) FECHA,
       AREA_CODE,
       COS,
       TOTAL_MAILBOX_COUNT,
       ACTIVE_MAILBOX_COUNT,
       UN_INITIALIZED_MAILBOX_COUNT,
       INITIALIZED_MAILBOX_COUNT,
       MAILBX_WITH_SPECIAL_GREETING,
       MAILBX_WITH_PERSONAL_GREETING,
       MAILBX_WITH_VOICE_SIGNATURE,
       MAILBX_WITH_PASSWORD_CHECK,
       MAILBX_WITH_NOEMPTY_MAIL_LIST,
       MAIL_LIST_COUNT,
       RECEIVER_COUNT_IN_MAIL_LIST,
       TRIM(PAIS) PAIS
  FROM AUX_SVA_ZTE_MAILBOX_COUNT
       ) O
    ON (A.FECHA = O.FECHA AND A.COS = O.COS AND A.PAIS = O.PAIS)
  WHEN MATCHED THEN UPDATE SET A.AREA_CODE                      = O.AREA_CODE,
                               A.TOTAL_MAILBOX_COUNT            = O.TOTAL_MAILBOX_COUNT,
                               A.ACTIVE_MAILBOX_COUNT           = O.ACTIVE_MAILBOX_COUNT,
                               A.UN_INITIALIZED_MAILBOX_COUNT   = O.UN_INITIALIZED_MAILBOX_COUNT,
                               A.INITIALIZED_MAILBOX_COUNT      = O.INITIALIZED_MAILBOX_COUNT,
                               A.MAILBX_WITH_SPECIAL_GREETING   = O.MAILBX_WITH_SPECIAL_GREETING,
                               A.MAILBX_WITH_PERSONAL_GREETING  = O.MAILBX_WITH_PERSONAL_GREETING,
                               A.MAILBX_WITH_VOICE_SIGNATURE    = O.MAILBX_WITH_VOICE_SIGNATURE,
                               A.MAILBX_WITH_PASSWORD_CHECK     = O.MAILBX_WITH_PASSWORD_CHECK,
                               A.MAILBX_WITH_NOEMPTY_MAIL_LIST  = O.MAILBX_WITH_NOEMPTY_MAIL_LIST,
                               A.MAIL_LIST_COUNT                = O.MAIL_LIST_COUNT,
                               A.RECEIVER_COUNT_IN_MAIL_LIST    = O.RECEIVER_COUNT_IN_MAIL_LIST
  WHEN NOT MATCHED THEN INSERT (
                               A.FECHA,
                               A.AREA_CODE,
                               A.COS,
                               A.TOTAL_MAILBOX_COUNT,
                               A.ACTIVE_MAILBOX_COUNT,
                               A.UN_INITIALIZED_MAILBOX_COUNT,
                               A.INITIALIZED_MAILBOX_COUNT,
                               A.MAILBX_WITH_SPECIAL_GREETING,
                               A.MAILBX_WITH_PERSONAL_GREETING,
                               A.MAILBX_WITH_VOICE_SIGNATURE,
                               A.MAILBX_WITH_PASSWORD_CHECK,
                               A.MAILBX_WITH_NOEMPTY_MAIL_LIST,
                               A.MAIL_LIST_COUNT,
                               A.RECEIVER_COUNT_IN_MAIL_LIST,
                               A.PAIS
                               )
                        VALUES (
                               O.FECHA,
                               O.AREA_CODE,
                               O.COS,
                               O.TOTAL_MAILBOX_COUNT,
                               O.ACTIVE_MAILBOX_COUNT,
                               O.UN_INITIALIZED_MAILBOX_COUNT,
                               O.INITIALIZED_MAILBOX_COUNT,
                               O.MAILBX_WITH_SPECIAL_GREETING,
                               O.MAILBX_WITH_PERSONAL_GREETING,
                               O.MAILBX_WITH_VOICE_SIGNATURE,
                               O.MAILBX_WITH_PASSWORD_CHECK,
                               O.MAILBX_WITH_NOEMPTY_MAIL_LIST,
                               O.MAIL_LIST_COUNT,
                               O.RECEIVER_COUNT_IN_MAIL_LIST,
                               O.PAIS
                               );

COMMIT;

EXIT;

