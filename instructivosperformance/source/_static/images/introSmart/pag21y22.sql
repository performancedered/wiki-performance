SELECT /*+ ORDERED */
 o1.provincia,
 o1.localidad,
 round(100 *
       decode(sum(RRC_EST_SUCC_USR_DEN),
              0,
              1,
              (sum(RRC_EST_SUCC_USR_NUM) / sum(RRC_EST_SUCC_USR_DEN))),
       2) rrcEstSuccessUserRate,
 round((100 * CASE
         WHEN sum(RRC_CSS_VOZ_DEN) = 0 THEN
          0
         WHEN sum(RAB_CSS_VOZ_DEN) = 0 THEN
          (sum(RRC_CSS_VOZ_NUM) / sum(RRC_CSS_VOZ_DEN))
         ELSE
          (sum(RRC_CSS_VOZ_NUM) / sum(RRC_CSS_VOZ_DEN)) *
          (sum(RAB_CSS_VOZ_NUM) / sum(RAB_CSS_VOZ_DEN))
       END),
       2) accessibilityVoice,
 round((100 * CASE
         WHEN sum(RRC_CSS_VIDEOCALL_DEN) = 0 THEN
          1
         WHEN sum(RAB_CSS_VIDEOCALL_DEN) = 0 THEN
          (sum(RRC_CSS_VIDEOCALL_NUM) / sum(RRC_CSS_VIDEOCALL_DEN))
         ELSE
          (sum(RRC_CSS_VIDEOCALL_NUM) / sum(RRC_CSS_VIDEOCALL_DEN)) *
          (sum(RAB_CSS_VIDEOCALL_NUM) / sum(RAB_CSS_VIDEOCALL_DEN))
       END),
       2) accessibilityVideo,
 round((100 * CASE
         WHEN sum(RRC_CSS_PACKET_DEN) = 0 THEN
          1
         WHEN sum(RAB_CSS_PACKET_DEN) = 0 THEN
          (sum(RRC_CSS_PACKET_NUM) / sum(RRC_CSS_PACKET_DEN))
         ELSE
          (sum(RRC_CSS_PACKET_NUM) / sum(RRC_CSS_PACKET_DEN)) *
          (sum(RAB_CSS_PACKET_NUM) / sum(RAB_CSS_PACKET_DEN))
       END),
       2) accessibilityPacket,
 round(100 * decode(sum(RRC_CSS_VOZ_DEN),
                    0,
                    1,
                    (sum(RRC_CSS_VOZ_NUM) / sum(RRC_CSS_VOZ_DEN))),
       2) rrcCssVoiceRate,
 round(100 *
       decode(sum(RRC_CSS_VIDEOCALL_DEN),
              0,
              1,
              (sum(RRC_CSS_VIDEOCALL_NUM) / sum(RRC_CSS_VIDEOCALL_DEN))),
       2) rrcCssVideocallRate,
 round(100 *
       decode(sum(RRC_CSS_PACKET_DEN),
              0,
              1,
              (sum(RRC_CSS_PACKET_NUM) / sum(RRC_CSS_PACKET_DEN))),
       2) rrcCssPacketRate,
 round(100 * decode(sum(RAB_CSS_VOZ_DEN),
                    0,
                    1,
                    (sum(RAB_CSS_VOZ_NUM) / sum(RAB_CSS_VOZ_DEN))),
       2) rabCssVoiceRate,
 round(100 *
       decode(sum(RAB_CSS_VIDEOCALL_DEN),
              0,
              1,
              (sum(RAB_CSS_VIDEOCALL_NUM) / sum(RAB_CSS_VIDEOCALL_DEN))),
       2) rabCssVideocallRate,
 round(100 *
       decode(sum(RAB_CSS_PACKET_DEN),
              0,
              1,
              (sum(RAB_CSS_PACKET_NUM) / sum(RAB_CSS_PACKET_DEN))),
       2) rabCssPacketRate,
 t1.fecha,
 round(100 *
       decode((sum(HSDPA_ACCESS_USR_DEN)),
              0,
              1,
              (sum(HSDPA_ACCESS_USR_NUM) / sum(HSDPA_ACCESS_USR_DEN))),
       2) hsdpaAccessibilityUserRate,
 round(100 *
       decode((sum(HSUPA_ACCESS_USR_DEN)),
              0,
              1,
              (sum(HSUPA_ACCESS_USR_NUM) / sum(HSUPA_ACCESS_USR_DEN))),
       2) accesibilidadHsupa
  FROM OBJECTS_SP_UMTS           o1,
       umts_nsn_service_wcel_day t1,
       umts_nsn_hsdpa_wcel_day   t2
 WHERE t2.fecha(+) = t1.fecha
   AND t2.int_id(+) = t1.int_id
   AND provincia = 'SALTA'
   AND LOCALIDAD = 'SALTA'
   AND t1.fecha between to_date('14.10.2015', 'DD.MM.YYYY') AND
       to_date('22.10.2015', 'DD.MM.YYYY') + (86399 / 86400)
   AND o1.wcell_id = t1.int_id
 GROUP BY t1.fecha, o1.provincia, o1.localidad
 ORDER BY t1.fecha, o1.localidad
