#!/usr/bin/ksh

# Setting Context Oracle
oracleHome='/oracle/app/oracle/product/10.2'
oracleSid='WILLY'
oracleTerm='vt100'
path="$oracleHome/bin:/usr/local/bin:/usr/bin:/opt/ansic/bin:/us:"

# workDir Java Class
CLASSJAVADIR='/calidad/control/java/class'

# WorkDirectories
# Objetos
wDirMvendorObjects='/calidad/multivendor/gsm/objects/'

# Loader
workDirLoader='/oracle/app/oracle/loader/'
workDirHome='/calidad/'

# Mmsc Mms
WorkDirMmscMmsHourly='/calidad/msc/mmsc/hourly/'
WorkDirMmscMmsDaily='/calidad/msc/mmsc/daily/'
WorkDirMmscMmsSummary='/calidad/msc/mmsc/summary/'

# Msc ClearCode
WorkDirMscCcHourly='/calidad/msc/cc/hourly/'
WorkDirMscCcDaily='/calidad/msc/cc/daily/'
WorkDirMscCcSummary='/calidad/msc/cc/summary/'

# Msc Cgr
WorkDirMscCgrHourly='/calidad/msc/cgr/hourly/'
WorkDirMscCgrDaily='/calidad/msc/cgr/daily/'
WorkDirMscCgrSummary='/calidad/msc/cgr/summary/'

# Msc Sms
WorkDirMscSmsHourly='/calidad/msc/sms/hourly/'
WorkDirMscSmsDaily='/calidad/msc/sms/daily/'
WorkDirMscSmsSummary='/calidad/msc/sms/summary/'

# Msc Traffic
WorkDirMscTrafficHourly='/calidad/msc/traffic/hourly/'
WorkDirMscTrafficDaily='/calidad/msc/traffic/daily/'
WorkDirMscTrafficSummary='/calidad/msc/traffic/summary/'

# Msc Destination
WorkDirMscDestinationHourly='/calidad/msc/destination/hourly/'
WorkDirMscDestinationDaily='/calidad/msc/destination/daily/'
WorkDirMscDestinationSummary='/calidad/msc/destination/summary/'

# Msc Hlr
WorkDirCoreHlrHourly='/calidad/msc/hlr/hourly/'
workDirMscHlrDaily='/calidad/msc/hlr/daily/'
workDirMscHlrSummary='/calidad/msc/hlr/summary/'

# Msc Omgw
WorkDirCoreOmgwHourly='/calidad/msc/omgw/hourly/'
WorkDirCoreOmgwDaily='/calidad/msc/omgw/daily/'
WorkDirCoreOmgwSummary='/calidad/msc/omgw/summary/'

# Msc Msc
WorkDirCoreMscHourly='/calidad/msc/msc/hourly/'
WorkDirCoreMscDaily='/calidad/msc/msc/daily/'
WorkDirCoreMscSummary='/calidad/msc/msc/summary/'

# Msc Mgw
WorkDirCoreMgwHourly='/calidad/msc/mgw/hourly/'
WorkDirCoreMgwDaily='/calidad/msc/mgw/daily/'
WorkDirCoreMgwSummary='/calidad/msc/mgw/summary/'

# Msc Ctss
WorkDirCoreCtssHourly='/calidad/msc/ctss/hourly/'
WorkDirCoreCtssDaily='/calidad/msc/ctss/daily/'
WorkDirCoreCtssSummary='/calidad/msc/ctss/summary/'

# Nokia Mmsc
WorkDirMmscHourly='/calidad/sva/mmsc/hourly/'
WorkDirMmscDaily='/calidad/sva/mmsc/daily/'
WorkDirMmscSummary='/calidad/sva/mmsc/summary/'

# Multivendor GSM
WorkDirMultivendorHourly='/calidad/multivendor/gsm/hourly/'
WorkDirMultivendorDaily='/calidad/multivendor/gsm/daily/'
WorkDirMultivendorSummary='/calidad/multivendor/gsm/summary/'
WorkDirMultivendorGprsHourly='/calidad/multivendor/gprs/hourly/'
WorkDirMultivendorGprsDaily='/calidad/multivendor/gprs/daily/'
WorkDirMultivendorGprsSummary='/calidad/multivendor/gprs/summary/'

# Nsn Gsm Hourly
workDirNsnGsmHourly='/calidad/nokia/gsm/hourly/'
workDirNsnGsmHourlyScript='/calidad/nokia/gsm/hourly/scripts/'
workDirNsnGsmHourlyLog='/calidad/nokia/gsm/hourly/logs/'
wDirNsnGsmHourly='/calidad/nokia/gsm/hourly/'
wDirNsnGsmHourlyScript='/calidad/nokia/gsm/hourly/scripts/'
wDirNsnGsmHourlyLog='/calidad/nokia/gsm/hourly/logs/'
wDirNsnGsmHourlyH='/calidad/nokia/gsm/hourly/history/'

# Noc GSM

WorkDirNocGsmHourly='/calidad/multivendor/gsm/hourly/noc/'
WorkDirNocGsmDaily='/calidad/multivendor/gsm/daily/noc/'
WorkDirNocGsmSummary='/calidad/multivendor/gsm/summary/noc/'

workDirDisponibilidadGsmHourly='/calidad/nokia/gsm/hourly/noc/news/'
workDirDisponibilidadGsmDaily='/calidad/nokia/gsm/daily/noc/news/'
workDirDisponibilidadGsmSummary='/calidad/nokia/gsm/summary/noc/news/'

workDirDisponibilidadUmtsHourly='/calidad/nokia/umts/hourly/noc/news/'
workDirDisponibilidadUmtsDaily='/calidad/nokia/umts/daily/noc/news/'
workDirDisponibilidadUmtsSummary='/calidad/nokia/umts/summary/noc/news/'

# Core Fing
WorkDirCoreFingHourly='/calidad/nokia/fing/hourly/'
WorkDirCoreFingDaily='/calidad/nokia/fing/daily/'
WorkDirCoreFingSummary='/calidad/nokia/fing/summary/'

# Tecnomen
WorkDirTecnomen='/calidad/tecnomen/'
fileConfigurationTecnomen='/calidad/tecnomen/tecnomen.cfg'
fileConfigurationTecnomenMinute='/calidad/tecnomen/tecnomen_diam_min.cfg'

# Msc Destination
WorkDirWapHourly='/calidad/sva/wap/hourly/'
WorkDirWapDaily='/calidad/sva/wap/daily/'
WorkDirWapSummary='/calidad/sva/wap/summary/'

# Nortel
workDirNortelHourly='/calidad/nortel/hourly/'
workDirNortelDaily='/calidad/nortel/daily/'
workDirNortelRecovery='/calidad/nortel/rec/'
workDirNortelStorage='/calidad/storage/nortel/'

# Partitions
workDirPartitions='/calidad/check_db_sys/particiones/'

# Spool Report
workDirSmsSpool='/calidad/ps_spool/sms/'
workDirSpoolStatusReport='/calidad/ps_spool/status/'
workDirAspCell='/calidad/ps_spool/asps/'
workDirAspSwitch='/calidad/ps_spool/asps/'
workDirAspHourly='/calidad/ps_spool/asps/'

# Scripts Generic
workDirGeneric='/calidad/utilities/generic/'

# Nokia Ggsn Apn
workDirApnMinute='/calidad/nokia/mibs/ggsn/apn/minute/'
workDirApnHourly='/calidad/nokia/mibs/ggsn/apn/hourly/'
workDirApnDaily='/calidad/nokia/mibs/ggsn/apn/daily/'
workDirApnSummary='/calidad/nokia/mibs/ggsn/apn/summary/'

# Nokia Umts
workDirUmtsRecovery='/calidad/nokia/umts/rec/'
wDirUmtsHourly='/calidad/nokia/umts/hourly/'
workDirUmtsHourly='/calidad/nokia/umts/hourly/'
workDirUmtsDaily='/calidad/nokia/umts/daily/'
workDirUmtsSummary='/calidad/nokia/umts/summary/'
workDirUmtsHourlyCapacity='/calidad/nokia/umts/hourly/capacity/'
workDirUmtsDailyCapacity='/calidad/nokia/umts/daily/capacity/'
workDirUmtsSummaryCapacity='/calidad/nokia/umts/summary/capacity/'
workDirUmtsSummaryHo='/calidad/nokia/umts/summary/ho/'
workDirUmtsHourlyIups='/calidad/nokia/umts/hourly/iups/'
workDirUmtsDailyIups='/calidad/nokia/umts/daily/iups/'
workDirUmtsSummaryIups='/calidad/nokia/umts/summary/iups/'

# Tekelec
workDirTekelecMinute='/calidad/sva/tekelec/minute/'
workDirTekelecHourly='/calidad/sva/tekelec/hourly/'
workDirTekelecDaily='/calidad/sva/tekelec/daily/'
workDirTekelecSummary='/calidad/sva/tekelec/summary/'
workDirTekelecTablero='/calidad/sva/tekelec/tablero/'

# Nokia Core Ggsn Apn Mibs
snmpBulkWalk='/usr/sfw/bin/snmpbulkwalk'
snmpWalk='/usr/sfw/bin/snmpwalk'
snmpGet='/usr/sfw/bin/snmpget'
mibsDir='/calidad/nokia/mibs/files_mibs'

# Nokia Core Sgsn
wdCoreHourly='/calidad/nokia/core/hourly/'
wdCoreDaily='/calidad/nokia/core/daily/'
wdCoreSummary='/calidad/nokia/core/summary/'

# Other Services
# Spool Mous Monthly To Cti DataWareHouse
workDirMousMonthlyToCtiDw='/calidad/servicios/cti_dw/'
workDirBackupScript='/calidad/check_db_sys/backup/'
workDirBackupStorage='/calidad/storage/backup/'
workDirRemoveScript='/calidad/check_db_sys/remove/'

# Sva
workDirClaroReclamos='/calidad/sva/reclamos/'
workDirComverseHourly='/calidad/comverse/hourly/'
workDirLogsBam='/calidad/sva/bam/'
workDirStorageLogsBam='/export/home/soporte/bam/'
workDirEhealth='/calidad/sva/ehealth/'
workDirEhealthInterfaceHourly='/calidad/sva/ehealth/interface/hourly/'
workDirEhealthInterfaceDaily='/calidad/sva/ehealth/interface/daily/'
workDirEhealthInterfaceSummary='/calidad/sva/ehealth/interface/summary/'
workDirEhealthHfcHourly='/calidad/sva/ehealth/hfc/hourly/'
workDirEhealthHfcHourlyCsv='/calidad/sva/ehealth/hfc/hourly/csv/'
workDirEhealthHfcDaily='/calidad/sva/ehealth/hfc/daily/'
workDirEhealthHfcSummary='/calidad/sva/ehealth/hfc/summary/'

# Sitios Sin Trafico
WorkDirSitiosSinTrafico='/calidad/tablero/sitios_sin_trafico/'

# Tablero Ico Week
WorkDirTableroIcoWeek='/calidad/tablero/ico/'

# Amx
WorkDirReporteAmx='/calidad/tablero/amx'

# Telmex
mibsDirTelmex='/calidad/sva/gpon/mibs/'
workDirTelmex='/calidad/sva/gpon/'
workDirTelmexStorage='/export/home/calidad/storage/telmexFiles/'
communityGPONTelmex='n39dsg3q9az'
communityHFCTelmex='petete'
communityRADIUSTelmex='t3lmeXKom'
communityCMTTelmex='t3lmeXKom'
communitySERVERSTelmex='petete'
communityDPI_SRPTelmex='c14r0Kom'
communityDPI_PTSTelmex='c14r0Kom'
telmexPlataformListEtl='GPON HFC SERVERS DPI_SRP DPI_PTS RADIUS'
versionSNMP='1 2c'
WorkDirIncognitoHourly='/calidad/sva/incognito/hourly/'
WorkDirIncognitoDaily='/calidad/sva/incognito/daily/'
WorkDirIncognitoSummary='/calidad/sva/incognito/summary/'
objectsIncognito='NG NS NGS S'

# Example
workDirExample='/calidad/example/'

# Files Statistics Nortel

fileNortelBts='aOFS_BTS_M0?00HH00'

fileNortelGprsFirst='aOPCUL_BTS_M0?00HH00'
fileNortelGprs='aOPCUL_BTS_M0?00HH??'

fileNortelTmaFirst='aOPCUL_TMA_M0?00HH00'
fileNortelTma='aOPCUL_TMA_M0?00HH??'

fileNortelScchFirst='aOPCUL_CCH_M0?00HH00'
fileNortelScch='aOPCUL_CCH_M0?00HH??'

fileNortelHo='aOFS_ADJ_M0?00HH00'

fileNortelPaging='aOFS_BSC_M0?00HH00'

fileNortelCompressedDotGz='obs_raw.tar.gz'
fileNortelCompressedDotTar='obs_raw.tar'

# Files Contents Statistics in the Process
pathLoaderOracle='/oracle/app/oracle/loader'
fileNortelCounterValueBts="$pathLoaderOracle/nbts_new.txt"
fileNortelCounterValueGprs="$pathLoaderOracle/ngprs_new.txt"
fileNortelCounterValueTma="$pathLoaderOracle/ngprs_tma_new.txt"
fileNortelCounterValueScch="$pathLoaderOracle/ngprs_cch_new.txt"
fileNortelCounterValueHo="$pathLoaderOracle/nho_new.txt"
fileNortelCounterValuePaging="$pathLoaderOracle/npaging_new.txt"

fileNortelCounterListBts="$pathLoaderOracle/nortel_bts_temp_new.txt"
fileNortelCounterListGprs="$pathLoaderOracle/nortel_gprs_temp_new.txt"
fileNortelCounterListTma="$pathLoaderOracle/nortel_gprs_tma_temp_new.txt"
fileNortelCounterListScch="$pathLoaderOracle/nortel_gprs_cch_temp_new.txt"
fileNortelCounterListHo="$pathLoaderOracle/nortel_ho_temp_new.txt"
fileNortelCounterListPaging="$pathLoaderOracle/nortel_paging_temp_new.txt"

fileNortelCounterValueRecoveryBts="$pathLoaderOracle/nbts_new_rec.txt"
fileNortelCounterValueRecoveryGprs="$pathLoaderOracle/ngprs_new_rec.txt"
fileNortelCounterValueRecoveryTma="$pathLoaderOracle/ngprs_tma_new_rec.txt"
fileNortelCounterValueRecoveryScch="$pathLoaderOracle/ngprs_cch_new_rec.txt"
fileNortelCounterValueRecoveryHo="$pathLoaderOracle/nho_new_rec.txt"
fileNortelCounterValueRecoveryPaging="$pathLoaderOracle/npaging_new_rec.txt"

fileNortelCounterListRecoveryBts="$pathLoaderOracle/nortel_bts_temp_new_rec.txt"
fileNortelCounterListRecoveryGprs="$pathLoaderOracle/nortel_gprs_temp_new_rec.txt"
fileNortelCounterListRecoveryTma="$pathLoaderOracle/nortel_gprs_tma_temp_new_rec.txt"
fileNortelCounterListRecoveryScch="$pathLoaderOracle/nortel_gprs_cch_temp_new_rec.txt"
fileNortelCounterListRecoveryHo="$pathLoaderOracle/nortel_ho_temp_new_rec.txt"
fileNortelCounterListRecoveryPaging="$pathLoaderOracle/nortel_paging_temp_new_rec.txt"

# List Bscs Nortel Network
bscsNortelArgentinaNetwork='101 201 202 204'
bscsNortelUruguayNetwork='010 011 012 013 014 015'
bscsNortelParaguayNetwork='050 051 052 053 054 055 056 057 058'

statisticNortelHourlyCollection='bts gprs tma scch ho'
bscsNortelNetwork="$bscsNortelArgentinaNetwork $bscsNortelUruguayNetwork $bscsNortelParaguayNetwork"

scriptSqlDropTemporaryTable="$workDirNortelHourly/qdrop.sql"

scriptSqlCreateTemporaryScriptsAndTableBts="${workDirNortelHourly}qbts.sql"
scriptCtlLoadTemporaryTableBts="$pathLoaderOracle/nbts_new.ctl"
scriptSqlUpdateTemporaryTableBts="$pathLoaderOracle/qbts_up.sql"
scriptSqlInsertInTableHourBts="$pathLoaderOracle/qbts_ins.sql"

scriptSqlCreateTemporaryScriptsAndTableGprs="${workDirNortelHourly}qgprs.sql"
scriptCtlLoadTemporaryTableGprs="$pathLoaderOracle/ngprs_new.ctl"
scriptSqlUpdateTemporaryTableGprs="$pathLoaderOracle/qgprs_up.sql"
scriptSqlInsertInTableHourGprs="$pathLoaderOracle/qgprs_ins.sql"

scriptSqlCreateTemporaryScriptsAndTableTma="${workDirNortelHourly}qgprstma.sql"
scriptCtlLoadTemporaryTableTma="$pathLoaderOracle/ngprstma_new.ctl"
scriptSqlUpdateTemporaryTableTma="$pathLoaderOracle/qgprstma_up.sql"
scriptSqlInsertInTableHourTma="$pathLoaderOracle/qgprstma_ins.sql"

scriptSqlCreateTemporaryScriptsAndTableScch="${workDirNortelHourly}qgprsccch.sql"
scriptCtlLoadTemporaryTableScch="$pathLoaderOracle/ngprscch_new.ctl"
scriptSqlUpdateTemporaryTableScch="$pathLoaderOracle/qgprscch_up.sql"
scriptSqlInsertInTableHourScch="$pathLoaderOracle/qgprscch_ins.sql"

scriptSqlCreateTemporaryScriptsAndTableHo="${workDirNortelHourly}qho.sql"
scriptCtlLoadTemporaryTableHo="$pathLoaderOracle/nho_new.ctl"
scriptSqlUpdateTemporaryTableHo="$pathLoaderOracle/qho_up.sql"
scriptSqlInsertInTableHourHo="$pathLoaderOracle/qho_ins.sql"

scriptRecoverySqlDropTemporaryTable="$workDirNortelRecovery/qdrop_rec.sql"

scriptRecoverySqlCreateTemporaryScriptsAndTableBts="$workDirNortelRecovery/qbts_rec.sql"
scriptRecoveryCtlLoadTemporaryTableBts="$pathLoaderOracle/nbts_new_rec.ctl"
scriptRecoverySqlUpdateTemporaryTableBts="$pathLoaderOracle/qbts_up_rec.sql"
scriptRecoverySqlInsertInTableHourBts="$pathLoaderOracle/qbts_ins_rec.sql"

scriptRecoverySqlCreateTemporaryScriptsAndTableGprs="$workDirNortelRecovery/qgprs_rec.sql"
scriptRecoveryCtlLoadTemporaryTableGprs="$pathLoaderOracle/ngprs_new_rec.ctl"
scriptRecoverySqlUpdateTemporaryTableGprs="$pathLoaderOracle/qgprs_up_rec.sql"
scriptRecoverySqlInsertInTableHourGprs="$pathLoaderOracle/qgprs_ins_rec.sql"

scriptRecoverySqlCreateTemporaryScriptsAndTableTma="$workDirNortelRecovery/qgprstma_rec.sql"
scriptRecoveryCtlLoadTemporaryTableTma="$pathLoaderOracle/ngprstma_new_rec.ctl"
scriptRecoverySqlUpdateTemporaryTableTma="$pathLoaderOracle/qgprstma_up_rec.sql"
scriptRecoverySqlInsertInTableHourTma="$pathLoaderOracle/qgprstma_ins_rec.sql"

scriptRecoverySqlCreateTemporaryScriptsAndTableScch="$workDirNortelRecovery/qgprsccch_rec.sql"
scriptRecoveryCtlLoadTemporaryTableScch="$pathLoaderOracle/ngprscch_new_rec.ctl"
scriptRecoverySqlUpdateTemporaryTableScch="$pathLoaderOracle/qgprscch_up_rec.sql"
scriptRecoverySqlInsertInTableHourScch="$pathLoaderOracle/qgprscch_ins_rec.sql"

scriptRecoverySqlCreateTemporaryScriptsAndTableHo="$workDirNortelRecovery/qho_rec.sql"
scriptRecoveryCtlLoadTemporaryTableHo="$pathLoaderOracle/nho_new_rec.ctl"
scriptRecoverySqlUpdateTemporaryTableHo="$pathLoaderOracle/qho_up_rec.sql"
scriptRecoverySqlInsertInTableHourHo="$pathLoaderOracle/qho_ins_rec.sql"

# Path and parameters in OMC-R
ipOmcRArgentina='10.48.21.40'
ipOmcRUruguay='10.96.2.86'
ipOmcRParaguay='10.104.169.51'

pathDefaultContentsStatistic='/SDO/data/obs/raw/'
pathDefaultContentsStatisticCompressed='/SDO/data/obs/compressed/'

# Code Number Menu Options

# Code Main Menu
CodeMenuMscCc=1
CodeMenuMscCgr=2
CodeMenuMscSms=3
CodeMenuMscDestination=4
CodeMenuMscTraffic=5

CodeMenuMultivendorGsm=10
CodeMenuMultivendorGprs=11

CodeMenuUmts=15

# File Setting and Configuration Menu
pathFunctions='/calidad/control/'
logActionFile='/calidad/control/menu/logactionfile.txt'
beforeLogActionFile='/calidad/control/menu/logactionfile.tx2'
afterLogActionFile='/calidad/control/menu/logactionfile.tx3'
menuConfigurationFile='/calidad/control/menu/menusettingcode.cfg'
fileLoaderLogAction='/calidad/control/menu/fileloaderlogaction.ctl'
fileLogLoaderLogAction='/calidad/control/menu/fileloaderlogaction.log'
recoveryFinishFile='/calidad/control/menu/recoveryfinish.sh'
recoveryLogFile='/calidad/recovery.log'
fileSpoolLogAction='/calidad/control/menu/filespoollogaction.sql'

# Spool AMX
pathFtpReportAmx='/for_ftp_litio/reportes_amx/'
WorkDirSpoolAmx='/calidad/ps_spool/amx/'

fileGsmServiceDeniedNetwork='Gsd_yy_mm_dd_.txt'
fileGsmServiceDeniedMarket='Gsd_yy_mm_dd_r.txt'
fileGsmServiceDeniedBsc='Gsd_yy_mm_dd_bsc.txt'

fileGsmTchDropRateNetwork='Gdrop_yy_mm_dd_.txt'
fileGsmTchDropRateMarket='Gdrop_yy_mm_dd_r.txt'
fileGsmTchDropRateBsc='Gdrop_yy_mm_dd_bsc.txt'

fileGsmSqiBadNetwork='Gpsqi_yy_mm_dd_.txt'
fileGsmSqiBadMarket='Gsqi_yy_mm_dd_r.txt'
fileGsmSqiBadBsc='Gsqi_yy_mm_dd_bsc.txt'

fileGsmTrafficNetwork='Gtraff_yy_mm_dd_.txt'
fileGsmTrafficMarket='Gtraff_yy_mm_dd_r.txt'
fileGsmTrafficBsc='Gtraff_yy_mm_dd_bsc.txt'

fileGprsNetwork='Gprs_yy_mm_dd_.txt'
fileGprsMarket='Gprs_yy_mm_dd_r.txt'
fileGprsBsc='Gprs_yy_mm_dd_bsc.txt'

fileTar='txt_yy_mm_dd_amx.tar'

#################################################################################################################################################
# Report Status Total and Parcial
#################################################################################################################################################

reportStatusHourlyPlat='MSC'
reportStatusHourlyGroupMail='RP'
reportStatusHourlyHtmlFile='rpt_hourly_petrini.html'
reportStatusHourlyLogFile='report_status_hourly.log'
reportStatusHourlyTitule='Report Status Horario'
reportStatusHourlyParamFail='all'
reportStatusHourlyTruncate='J'

reportStatusDailyPlat='MULTIVENDOR DISPONIBILIDAD MSC TABLERO UMTS SVA NOKIA LTE LOGICA CISCO COMVERSE TECNOMEN TEKELEC COUNTER OTROS VOICEMAIL'
reportStatusDailyGroupMail='STT'
reportStatusDailyHtmlFile='rpt_daily.html'
reportStatusDailyLogFile='report_status_daily.log'
reportStatusDailyTitule='Report Status Diario'
reportStatusDailyParamFail='all'
reportStatusDailyTruncate='J'

reportStatusWeeklyPlat='MULTIVENDOR DISPONIBILIDAD MSC TABLERO UMTS SVA NOKIA LTE CISCO COUNTER TECNOMEN'
reportStatusWeeklyGroupMail='STT'
reportStatusWeeklyHtmlFile='rpt_weekly.html'
reportStatusWeeklyLogFile='report_status_weekly.log'
reportStatusWeeklyTitule='Report Status Semanal'
reportStatusWeeklyParamFail='all'
reportStatusWeeklyTruncate='DAY'

reportStatusMonthlyPlat='MULTIVENDOR DISPONIBILIDAD MSC TABLERO UMTS SVA NOKIA LTE DW CISCO COUNTER OTROS VOICEMAIL'
reportStatusMonthlyGroupMail='STT'
reportStatusMonthlyHtmlFile='rpt_monthly.html'
reportStatusMonthlyLogFile='report_status_monthly.log'
reportStatusMonthlyTitule='Report Status Mensual'
reportStatusMonthlyParamFail='all'
reportStatusMonthlyTruncate='MONTH'

reportStatusParcialMonthlyPlat='TABLERO UMTS'
reportStatusParcialMonthlyGroupMail='STT'
reportStatusParcialMonthlyHtmlFile='rpt_monthly.html'
reportStatusParcialMonthlyLogFile='report_status_parcial_monthly.log'
reportStatusParcialMonthlyTitule='Report Status Parcial Mensual'
reportStatusParcialMonthlyParamFail='all'
reportStatusParcialMonthlyTruncate='MONTH'

reportStatusDailyRecoveryPlat='NOKIA CISCO'
reportStatusDailyRecoveryGroupMail='MA'

reportStatusWeeklyRecoveryPlat='LTE'
reportStatusWeeklyRecoveryGroupMail='MA'

#################################################################################################################################################

# Sva
# Logica Omg
logicaOmgPlats='OMG1 OMG2 OMG3 OMG4 OMGX'
logicaOmgFileMask="YYYYMMDD_HH24000010.84*Metrics.log"
logicaOmgPathRemoteHost='../omg/metrics/'
workDirLogicaOmgHourly='/calidad/logica/omg/hourly/'
workDirCheckDbSysStats='/calidad/check_db_sys/stats/'

# Comverse
dirSfe='/stats/'
archivoSfe='summary_sfe*'

# Tableros
wdirTableroMinutos='/calidad/tablero/minutos/'
wdirTableroControl='/calidad/tablero/control/'
wdirTableroEvolutivo='/calidad/tablero/evolutivo/'
wdirTableroRegion='/calidad/tablero/region/'
wdirTableroBss='/calidad/tablero/bss/'
wdirTableroMinutosUmts='/calidad/tablero/umts/'
wdirTableroGsm='/calidad/tablero/gestion/'
wdirTableroGeo='/calidad/tablero/geo/'
wdirTableroGeometriaDaily='/calidad/tablero/geometria/daily/'
wdirTableroGeometriaSummary='/calidad/tablero/geometria/summary/'
wdirTableroTickets='/calidad/tablero/tickets/'
wDirTableroCapacity='/calidad/tablero/cpcdd_opt/'
itemsProcessEvolutivo='GSM_MOUS GPRS/EDGE SMS VLR VLR_GSM VLR_UMTS UMTS_MOUS_VOZ UMTS_MOUS_VIDEOCALL UMTS_PS_DL UMTS_PS_UL HSUPA HSDPA TOTAL_MOUS TOTAL_PS'

wdirTableroIm='/calidad/tablero/im/'
wDirReportTicket='/calidad/ps_spool/tickets/'

logTableroTicketsUpd='/calidad/tablero/tickets/tablero_tickets_upd.log'

workDirTableroTaskForce='/calidad/tablero/taskforce/'
# List Umts

dblinkOnlyRC1='OSSRC1'
dblinkOnlyRC2='OSSRC2'
dblinkOnlyRC3='OSSRC3'
dblinkOnlyRC6='OSSRC6'
dblinkOnlyRC7='OSSRC7'
dblinkOnlyRC8='OSSRC8'
dblinks='OSSV51'
dblinksOss2g='OSSRC1  OSSRC6'
dblinksOss='OSS2G OSS3G'
dblinksOss8k='OSSRC3 OSSRC2 OSSRC1'

dblinksReclamosData='PROD UYPROD PYPROD'
categoryReclamosData='TOTAL GEO_POS GEO_REF'
categoryReclamosDataSummary='TOTAL GEO_POS GEO_REF'

listHourlyCountersOlsDefault='WCELL'
listHourlyCountersOlsCapacity=''
listHourlyCountersOlsIu='WCELL'
listHourlyCountersOlsService='WCELL RNC ALM MERCADO PAIS'
listHourlyCountersOlsHo='WCELL RNC ALM MERCADO PAIS'
listHourlyCountersOlsHsdpa='WCELL RNC ALM MERCADO PAIS'
listHourlyCountersOlsBler='WCELL DL_RNC UL_RNC DL_ALM UL_ALM DL_MERCADO UL_MERCADO DL_PAIS UL_PAIS'
listHourlyCountersOlsMacd='WCELL RNC ALM MERCADO PAIS'
listHourlyCountersOlsSignaling='RNC'
listHourlyCountersOlsWbtsmon='WCELL RNC ALM MERCADO PAIS'

listHourlyElementsCountersWcellDefault='aux au1 ins'
listHourlyElementsCountersWcellService='aux'
listHourlyElementsCountersWcellTraffic='aux'
listHourlyElementsCountersWcellMacd='aux'
# listHourlyElementsCountersWcellIups='aux au1 ins in1'
listHourlyElementsCountersWcellIu='529 530 550 568 510 au5 au6'
listHourlyElementsCountersWcellHsdpa='ins'
listHourlyElementsCountersWcellBler='DL UL'
listHourlyElementsCountersWbtsOnlyAux='aux'

listHourlyOlsService='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsTraffic='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsHsdpa='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsIu='WCELL'
# listHourlyOlsIucs='RNC'
# listHourlyOlsIups='RNC'
listHourlyOlsPower=''
listHourlyOlsHo='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsCapacity='WCELL WBTS RNC ALM MERCADO PAIS'
listHourlyOlsBler='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsNoc='WCELL WBTS RNC ALM MERCADO CO SUPERVISION GERENCIA PAIS'
listHourlyOlsMacd='WCELL RNC ALM MERCADO PAIS'
listHourlyOlsSignaling='RNC'

listDailyElementsCountersDefault='BH DAY'
listDailyElementsCountersCapacity='BH'

listDailyCountersOlsService='WCELL CS_RNC PS_RNC CS_ALM PS_ALM CS_MERCADO PS_MERCADO CS_PAIS PS_PAIS'
listDailyCountersOlsHsdpa='WCELL RNC ALM MERCADO PAIS'
listDailyCountersOlsTraffic='WCELL RNC ALM MERCADO PAIS'
listDailyCountersOlsIub='VC'
listDailyCountersOlsIups='RNC'
listDailyCountersOlsIucs='RNC'
listDailyCountersOlsPower='WCELL'
listDailyCountersOlsHo='WCELL RNC ALM MERCADO PAIS'
listDailyCountersOlsBler='DL_WCELL UL_WCELL DL_RNC UL_RNC DL_ALM UL_ALM DL_MERCADO UL_MERCADO DL_PAIS UL_PAIS'
listDailyCountersOlsMacd='WCELL RNC ALM MERCADO PAIS'
listDailyCountersOlsSignaling='RNC'

listDailyOlsService='WCELL RNC ALM MERCADO PAIS'
listDailyOlsTraffic='WCELL RNC ALM MERCADO PAIS'
listDailyOlsHsdpa='WCELL RNC ALM MERCADO PAIS'
listDailyOlsIub='VC'
listDailyOlsPower='WCELL'
listDailyOlsHo='WCELL RNC ALM MERCADO PAIS'
listDailyOlsIups='IF RNC'
listDailyOlsIucs='IF RNC'
listDailyOlsCapacity='WCELL WBTS RNC ALM MERCADO PAIS'
listDailyOlsBler='WCELL RNC ALM MERCADO PAIS'
listDailyOlsNoc='WCELL WBTS RNC ALM MERCADO CO SUPERVISION GERENCIA PAIS'
listOlsNocUmtsPond='RNC ALM MERCADO CO SUPERVISION GERENCIA PAIS'
# listDailyOlsNoc='WCELL WBTS RNC ALM MERCADO PAIS'
listDailyCountersOlsWbtsMon='WBTS RNC ALM MERCADO PAIS'
listDailyOlsSignaling='RNC'
listDailyOlsCpucor='RNC'


listSummaryOlsService='WCELL RNC ALM MERCADO PAIS'
listSummaryOlsTraffic='WCELL RNC ALM MERCADO PAIS'
listSummaryOlsHsdpa='WCELL RNC ALM MERCADO PAIS'
listSummaryOlsIub='VC'
listSummaryOlsIucs='IF RNC'
listSummaryOlsIups='RNC MERCADO PAIS'
listSummaryOlsPower='WCELL'
listSummaryOlsHo='WCELL RNC ALM MERCADO PAIS'
listSummaryOlsCapacity='WBTS WCELL RNC ALM MERCADO PAIS'
listSummaryOlsBler='WCELL RNC ALM MERCADO PAIS'
listSummaryOlsNoc='WCELL WBTS RNC ALM MERCADO CO SUPERVISION GERENCIA PAIS'
#listSummaryOlsNoc='WCELL WBTS RNC ALM MERCADO PAIS'
listSummaryOlsCpucor='RNC'
listAvailableDaysSummaryService='DOMINGO'
listAvailableDaysSummaryTraffic='DOMINGO'
listAvailableDaysSummaryHsdpa='DOMINGO'
listAvailableDaysSummaryIub='DOMINGO'
listAvailableDaysSummaryIucs='DOMINGO'
listAvailableDaysSummaryIups='DOMINGO'
listAvailableDaysSummaryPower='DOMINGO'
listAvailableDaysSummaryHo='DOMINGO'
listAvailableDaysSummaryCapacity='DOMINGO'
listAvailableDaysSummaryBler='DOMINGO'
listAvailableDaysSummaryNoc='DOMINGO JUEVES'

listNeTableroGeometria='WCELL WBTS RNC ALM MERCADO PAIS CIUDAD'

# WorDir Ne Configuracion Nsn
wdirConfiguracionNeNsn='/calidad/nokia/conf'
wdirConfiguracionNeNsnScripts='/calidad/nokia/conf/ne'

# Listas KPI para Generacion de Tickets por Tecnologia

# listTicketsOls='MERCADO'
listTicketsOls='BTS MERCADO MSC SGSN'

#listTicketsTecnologia='GSM UMTS CORE'
listTicketsTecnologia='CORE'


listKpiTicketsGSMBTS='DROP_CALL TCH_FAIL'
listKpiTicketsGSMMERCADO='DROP_CALL TCH_FAIL'
listKpiTicketsUMTSBTS='ACCES_PACKET RETEN_PACKET'
listKpiTicketsUMTSMERCADO='ACCES_PACKET RETEN_PACKET ACCES_VOICE RETEN_VOICE'
listKpiTicketsCOREMSC='TSC'
listKpiTicketsCORESGSN='NOACCESIBILITY NORETENIBILITY'

# listCountersPlatForDailyGsm='TRAFFIC SERVICE HO FER RESAVAIL RESACC POWER PCU COD_SCH RXQUAL'

# listCountersPlatForHourlyGsm='TRAFFIC SERVICE HO FER RESAVAIL RESACC POWER PCU COD_SCH RXQUAL MVENDOR QOSPCL TRX LOAD OVERIP DAP'
listCountersPlatForHourlyGsm='TRX LOAD OVERIP DAP'

listCountersPlatForDailyGsmBh='TRAFFIC SERVICE HO FER RESAVAIL RESACC POWER PCU COD_SCH RXQUAL QOSPCL TRX'
listCountersPlatForDailyGsmDay='TRAFFIC SERVICE HO FER RESAVAIL RESACC POWER PCU COD_SCH RXQUAL QOSPCL TRX LOAD OVERIP DAP'

listCountersPlatForHourlyUmts='RCPMRLC'
# listCountersPlatForHourlyUmts='CELLRES SERVLEV WBTSHW TRAFFIC RCPMRLC INS'
listCountersPlatForDailyUmts='CELLRES SERVLEV WBTSHW TRAFFIC RCPMRLC INS'

wdirMvendorHourlyScripts='/calidad/multivendor/gsm/hourly/scripts'
wdirMvendorDailyScripts='/calidad/multivendor/gsm/daily/scripts'

wdirUmtsHourlyScripts='/calidad/nokia/umts/hourly/scripts/'

listOlsGsmHourly='BSC ALM MERCADO PAIS'
listOlsGsm='BTS BSC ALM MERCADO PAIS'
listOlsGprs='BTS BSC ALM MERCADO PAIS'
listOlsGprsHourly='BSC ALM MERCADO PAIS'
listOlsNocGsm='BTS BCF BSC CO SUPERVISION GERENCIA ALM MERCADO PAIS'
listOlsNocGsmPond='BSC CO SUPERVISION GERENCIA ALM MERCADO PAIS'
listNeDisponibilidadGsm='BTS BCF BSC CO SUPERVISION GERENCIA ALM MERCADO PAIS'
listNeDisponibilidadUmts='WCELL WBTS RNC CO SUPERVISION GERENCIA ALM MERCADO PAIS'

listSummaryCountersService='WCELL RNC ALM MERCADO PAIS'
listSummaryCountersHsdpa='WCELL RNC ALM MERCADO PAIS'
listSummaryCountersIub='VC'
listSummaryCountersMacd='WCELL RNC ALM MERCADO PAIS'

# Soporte
workDirSpoolSoporte='/calidad/ps_spool/soporte/'
workDirSpoolStorageSoporte='/export/home/soporte/'

# Pcube
WorkDirPcube='/calidad/core/pcube/'
# PcubeCMList='Argentina Uruguay Paraguay'
PcubeCMList='Argentina Paraguay'
# PcubeCMList='Paraguay'
# PcubeCMList='Argentina'

PcubeCMArgentina='10.92.17.98'
PcubeCMUruguay='10.92.17.98'
PcubeCMParaguay='10.101.6.145'
PcubeCMPathRemoteHostArgentina='/opt/CM/cm/adapters/TAAdapter/csvfiles/'
PcubeCMPathRemoteHostUruguay='/opt/CM/cm/adapters/TAAdapter/csvfiles/'
PcubeCMPathRemoteHostParaguay='/CM/cm/cm/adapters/TAAdapter/csvfiles/'

# Ventanas de dias y horas
# MSC
ventanaHorariaMscDiasDesde=2
ventanaHorariaMscHoraDesde=0
ventanaHorariaMscDiasHasta=0
ventanaHorariaMscHoraHasta=-2

ventanaDiariaMscDiasDesde=3
ventanaDiariaMscDiasHasta=1

# Multivendor
ventanaDiariaMvendorDiasDesde=2
ventanaDiariaMvendorDiasHasta=1

ventanaDiariaMvendorGprsDiasDesde=2
ventanaDiariaMvendorGprsDiasHasta=1

# Multivendor Hour
ventanaHorariaMvendorGsmDiasDesdeNsn=2
ventanaHorariaMvendorGsmDiasDesdeNortel=2
ventanaHorariaMvendorGsmHoraDesdeNsn=0
ventanaHorariaMvendorGsmHoraDesdeNortel=0

ventanaHorariaMvendorGsmDiasHastaNsn=0
ventanaHorariaMvendorGsmDiasHastaNortel=0
ventanaHorariaMvendorGsmHoraHastaNsn=-2
ventanaHorariaMvendorGsmHoraHastaNortel=-1

# UMTS
ventanaHorariaUmtsDiasDesde=2
ventanaHorariaUmtsHoraDesde=0
ventanaHorariaUmtsDiasHasta=0
ventanaHorariaUmtsHoraHasta=-1

ventanaDiariaUmtsDiasDesde=5
ventanaDiariaUmtsDiasHasta=1

listUmtsPlataformMonthlySummary='service iub hsdpa power traffic capacity ho iups macd cpucor tablero'
listUmtsPlataformWeeklySunday='service iub hsdpa power traffic capacity ho iucs iups macd cpucor tablero'
##### listUmtsPlataformMonthlySummary='service iub hsdpa power traffic capacity ho bler iups macd cpucor tablero'
##### listUmtsPlataformWeeklySunday='service iub hsdpa power traffic capacity ho bler iucs iups macd cpucor tablero'

# SVA RECLAMOS
ventanaHorariaReclamosDiasDesde=2
ventanaHorariaReclamosHoraDesde=0
ventanaHorariaReclamosDiasHasta=0
ventanaHorariaReclamosHoraHasta=-1

ventanaDiariaReclamosDiasDesde=3
ventanaDiariaReclamosDiasHasta=1

diaInicioVentanaDeActualizacionRemedy=365
fechaInicioVentanaDeGesReclamos='01.10.2012'

# Tablero Minuto Diario
diasDesdeTableroMousDay=6
diasHastaTableroMousDay=1

# Disponibilidad Ventana Mantenimiento
fechaDesdeDisponibilidadDiariaGsm=3
fechaHastaDisponibilidadDiariaGsm=1
fechaDesdeDisponibilidadDiariaUmts=3
fechaHastaDisponibilidadDiariaUmts=1

# Web de Cobertura - E Solutions
workDirGeoTrafico='/calidad/servicios/esolutions/'
workDirAspCheck='/calidad/ps_spool/check/'

# Log Exceptions Processed
workDirStorageExceptionsProcessed='/calidad/ps_spool/exceptions/'

# Core Fing
objectsCounterFing='SSPROF IPDYN DIAMETER GTPC SCDR GTPP GTPU'
objectsFing='SSPROF GTPC SCDR GTPP'
levelFing='NODO FLEXI PAIS'

# Pcube Storage files Users Categories
wDirPcubeUsersCategories='/calidad/core/pcube/users/'
wDirStoragePcubeUsersCategories='/calidad/core/pcube/users/csv/'

# Traffica Settings
listTypesItemsTraffica='met sta dat'

listTrafficaItemsDelete='EMPRESAS DIRECTORES BLACKBERRY'
listTrafficaItems='EMPRESAS DIRECTORES'

cantidadSemanasDeHistoricoEnServidorTraffica=11
homeDirTrafficaHourly=/calidad/msc/traffica/hourly/
workDirTrafficaHourly=/export/home/traffica/storage_DBE_Export/

# SVA - HFC
workDirHFC='/calidad/sva/incognito/'
# sshSentenceLocalhost='ssh root@localhost'
sshSentenceLocalhost='ssh calidad@localhost'
# sshSentenceLocalhost=''
ipcliCommand='/usr/local/bin/ipcli'
userNameHFC='SMART'
passNameHFC='smart'

# userNameHFC='Administrator'
# passNameHFC='telmex'

ipcliSentenceListRE='LIST ROUTINGELEMENT'
ipcliSentenceShowRE='SHOW ROUTINGELEMENT'
ipcliSentenceListRules='LIST RULE'

fileTxtRoutingElementHFC='incognito_HFC_RE.txt'
fileTxtListRuleHFC='incognito_HFC_ListRule.txt'
fileCtlRoutingElementHFC='incognito_HFC_RE.ctl'
fileCtlListRuleHFC='incognito_HFC_ListRule.ctl'

diasAtrasPlataformHFCEquiposDHCP=0

### Analisis Indicadores Isabhw
wdirAnalysisIndicators='/calidad/tablero/indicators/'

indicatorsList='GSM_TCH_BLCK GSM_NO_ACC_VOICE'
# indicatorsList='NO_ACCESIBILITY_VOZ NO_ACCESIBILITY_DATA TCH_BLCK TCH_FAIL SDCCH_BLCK SDCCH_FAIL RACH7'
# indicatorsList='NO_ACCESIBILITY_VOZ NO_ACCESIBILITY_DATA'

# referencesElements='BCF BSC ALM MERCADO PAIS'
referencesElements='MERCADO PAIS PLMN'

analysisElementOfBCF='BTS'
# analysisElementOfBSC='BTS BCF'
analysisElementOfBSC='BCF'
# analysisElementOfALM='BTS BCF'
analysisElementOfALM='BCF'
# analysisElementOfMERCADO='BTS BCF BSC ALM'
analysisElementOfMERCADO='BCF BTS'
# analysisElementOfPAIS='BTS BCF BSC ALM MERCADO'
analysisElementOfPAIS='BTS BCF'
analysisElementOfPLMN='BTS BCF'

# summarisationList='DAY WEEK MONTH'
summarisationList='WEEK MONTH'

tableroIndicadoresRecurrenciaTec='GSM GPRS'
# tableroIndicadoresRecurrenciaTec='GPRS'
tableroIndicadoresRecurrenciaCla='IND_DESVIOS'
tableroIndicadoresRecurrenciaEle='BTS BCF BSC ALM MERCADO'

### Tablero Objetivos
workDirTableroDesvios='/calidad/tablero/desvios/'
tableroDesviosCeldasClasificacion='CRITICO CORPORATIVO'
tableroDesviosListaTecnologia='GSM UMTS'

### Tablero Corporativo

workDirTableroCorporativo='/calidad/tablero/corporativo/'
tableroCorporativoTecnologia='GSM UMTS'
tableroCorporativoTipo='GESTION CORPORATIVO'
# tableroCorporativoTipo='GESTION'

# Variables Mngmnt Cron Backup

wdirBackupCronFiles='/calidad/check_db_sys/backup/cron_files/'

#### Dashboard Week ####

WorkDirDashboard='/calidad/tablero/dashboard/'

# TKLC PM
workdirTklcPm='/calidad/sva/tekelec/pm/'
workDirTklcPmScripts='/calidad/sva/tekelec/pm/scripts/'
##### PlatsTklcOfPm='SDM PCRF'
PlatsTklcOfPm='SDM'
txtFileTKLC='pmConfiguration.txt'
TklcPmDirectories='DiameterShPeerStats DiameterPcefPeerStats'

ventanaHorariaTklcPMDiasDesde=3
ventanaHorariaTklcPMHorasDesde=0

ventanaHorariaTklcPMDiasHasta=0
ventanaHorariaTklcPMHorasHasta=-1

ventanaDiariaTklcPMDiasDesde=3
ventanaDiariaTklcPMDiasHasta=1

ventanaConfiguracionTklcPMDias=0
ventanaConfiguracionTklcPMHoras=-1

# Tekelec PCRF
wDirTklcPcrf='/calidad/sva/tekelec/pcrf/'
ventanaConfiguracionTklcPcrfHoras=0
ventanaConfiguracionTklcPcrfDias=1
PlatsTklcOfPcrf='Pcrf'
txtFilePcrfTKLC='pcrfConfiguration.txt'

platListBusyHourPCRF='MPE SPR'
typeListBusyHourMPE='TPS SESSIONS CPU'
typeListBusyHourSPR='TPS CPU USERS'

scriptNamePcrfHour=mpeMergeHour.sql
scriptNamePcrfDay=mpeMergeDay.sql
scriptNamePcrfBHMpe=mpeMergeBHMpe.sql
scriptNamePcrfBHSpr=mpeMergeBHSpr.sql
scriptNamePcrfIsabhw=mpeMergeIsabhw.sql

####################################################
# Huawei
####################################################
workdirHuawei='/usr/local/bin/TELMEX-Scripts/statsCX/datafiles'
workdirHuaweiHourly='/calidad/sva/huawei/hourly/'
workdirHuaweiDaily='/calidad/sva/huawei/daily/'
userHuawei='calidad'
ipHuawei='172.16.254.37'

####################################################
# Janus
####################################################
workdirJanusHourly='/calidad/sva/tecnotree/janus/hourly/'
workdirJanusDaily='/calidad/sva/tecnotree/janus/daily/'
ipJanus='10.84.84.17 10.84.88.17'
countryJanus='ar uy py'
dataJanus='sms voice_vcsl subscriber_count'
pathjanus='/home/calidad/callRate/data'
userJanus='calidad'

####################################################
# StarHome
####################################################
workdirStarHomeHourly='/calidad/sva/starhome/ipn/hourly/'
workdirStarHomeDaily='/calidad/sva/starhome/ipn/daily/'
ipStarHome='10.92.40.20'
paisStarhome='arg-cti pry-hut ury-amw'
userStarHome='iu'
passStarHome='Sgc-Prvi'

####################################################
# Ring Back Tones
####################################################
WorkDirRbtHourly='/calidad/sva/huawei/rbt/hourly/'
WorkDirRbtDaily='/calidad/sva/huawei/rbt/daily/'
WorkDirRbtSummary='/calidad/sva/huawei/rbt/summary/'
userRingBackTones='calidad'
PassRingBackTones='calidad'
paisRingBackTones='ARG UY PY'
statsRBT='operations quantity'

RableroTicketGestionLevelSummary='BCF ALM MERCADO SUPERVISION GERENCIA CIUDAD PAIS'
tableroAlarmGestionLevelSummary='BCF ALM MERCADO SUPERVISION GERENCIA CIUDAD PAIS'

# Celcite
workDirCelcite='/calidad/celcite/'
workDirSpoolControlSnapshot='/calidad/ps_spool/snapshots/'

# Feasibility
workDirFeasibility='/calidad/tablero/feasibility/'

# Conatel
workDirTableroConatel='/calidad/tablero/conatel/'
listElementConatelQuarter='ASUNCION CIUDAD_DEL_ESTE PARAGUAY'

# Temip Fault Management
wdirFaultManagement='/calidad/fault/'

####################################################
# Roamware
####################################################
ipRoamware='10.104.28.168'
userRoamware='mars'
WorkDirRoamware='/opt/Roamware/logs/ANAM/shared/ClaroTPS'
WorkDirRoamwareHourly='/calidad/sva/roamware/hourly/'
WorkDirRoamwareDaily='/calidad/sva/roamware/daily/'
paisRoamware='AR PY UY CBA'

####################################################
# Gemalto
####################################################
WorkDirGemaltoHourly='/calidad/sva/gemalto/hourly'
WorkDirGemaltoDaily='/calidad/sva/gemalto/daily'
ipEquiposGemalto='10.105.98.117 10.105.98.118 10.105.98.119 10.105.98.120 10.105.98.121 192.168.43.111'
# ipEquiposGemalto='10.105.98.117 10.105.98.119 10.105.98.120 10.105.98.121 192.168.43.111'
userOtaSrv='ora112'
userOtaDbSrv='ora112'
pathRam='/product/prevManUnix/report/RAM'
pathSwap='/product/prevManUnix/report/SWAP'
pathCpu='/product/prevManUnix/report/CPU'
userGemalto='calidad'
pathSimbrowsing='/product/gemalto/OSG/OSGLB/log'
countryGemalto='AR PY UY'
# ipEquiposGemaltoSec='10.105.98.117'
ipEquiposGemaltoSec='10.105.98.117 10.105.98.119'
pathOtaDm='/files/cti/OTADM_STATS'
statOtaDm='OTA DM'
pathPush='/product/gemalto/cti/psm/apache-tomcat-6.0.26-psm/pushmanager/logs'
pathPushOtaSrv1='/product/gemalto/cti/psm/apache-tomcat-6.0.26-psm/pushmanager/logs'
pathPushOtaSrv2='/product/gemalto/ctu/psmaota/apache-tomcat-6.0.26-psm/pushmanager/logs'
pathPushOtaSrv3='/product/gemalto/coa/psm/apache-tomcat-6.0.26-psm/pushmanager/logs'
ipGemaltoOtaLte='10.92.64.154'
userGemaltoOtaLte='ctuareport'
pathGemaltoOtaLte='/files/ctu/pmaota/QueryActivatedCards/reports'
userGemaltoOtaSrv1='ctilinqus'
userGemaltoOtaSrv2='ctulinqus'
userGemaltoOtaSrv3='coalinqus'

####################################################
# Tecnotree Cdc
####################################################
ipTecnotreeCdc='10.84.59.79'
PaisTecnotreeCdc='ar uy py'
# PaisTecnotreeCdc='ar'
WorkDirTecnotreeCdcHourly='/calidad/sva/tecnotree/'
ipTpsCdc='10.84.59.149'
userTpsCdc='cdclogs'
passTpsCdc='tecnotree'
ipTpsCm='192.168.16.175 192.168.16.184'
PaisTecnotreeCm='AR UY PY'
userTpsCm='cmlogs'
passTpsCm='tecnotree'

####################################################
## Cisco GGSN Files
####################################################

wDirCiscoGgsn='/calidad/core/ggsn/'
txtCfgFileCiscoGgsn='ggsnConfiguration.txt'

ventanaConfiguracionCiscoGgsnDias=0
ventanaConfiguracionCiscoGgsnHoras=-1

ciscoPlats='ggsn'
sshCiscoGgsnUser='cisco_user'
sshCiscoGgsnIp='10.92.49.93'
sshCiscoGgsnStorageDir='/SMART/storage01/ggsnCiscoFiles/'

####################################################
## Cisco Pcube Subscriber Manager Files
####################################################

wDirCiscoPcubeSm='/calidad/core/pcube/sm/'
txtCfgFileCiscoPcubeSm='pcubeSmConfiguration.txt'
ciscoPlatsPcube='Sm'

sshCiscoPcubeSmUser='cisco_user'
sshCiscoPcubeSmIp='10.92.49.93'
sshCiscoPcubeSmStorageDir='/SMART/storage01/pcubeSmFiles/'

# Core FlexiNG FsClish
wDirCoreFsClish='/calidad/core/fsclish/'
fsClishFlexiNGs='jo2-fng-1.cti tor-fng-1.cti tor-fng-2.cti'


### Reclamos

reclamosCountriesList='Argentina Uruguay Paraguay'
# reclamosTechnologyList='GSM UMTS'
reclamosTechnologyList='UMTS'
# reclamosTypeList='VOZ DATOS'
reclamosTypeList='DATOS'

####################################################
## SVA Omg
####################################################
WorkDirOmgHourly='/calidad/sva/omg/hourly/'
WorkDirOmgDaily='/calidad/sva/omg/daily/'
WorkDirOmgSummary='/calidad/sva/omg/summary/'
ipSvaOmg='10.84.55.146'

wdirPocMibs='/calidad/poc/mibs'
wdirPocMibsDll='/calidad/utilities/net-snmp/local/share/snmp/mibs/'
wDirBHCA='/calidad/bhca/'
wDirComverse='/calidad/comverse/'

### CellOwner
WorkDirCellOwner='/calidad/cellowner/'

### Spool Fail
WorkDirFail='/calidad/ps_spool/fail'

####################################################
## Sva Zte
####################################################
WorkDirZteHourly='/calidad/sva/zte/hourly'
WorkDirZteDaily='/calidad/sva/zte/daily'
ipZte='10.101.12.160 10.104.219.136'
userZtePy='zxftpstat'
pathZtePy='/zxindata/zxstatdata/VMS_Stats'
userZteUy='report'
pathZteUy='/home/report/VMS_UY'
statsZte='ctraf dmess mcont mprov freas rmess'

####################################################
## Sva Nbg
####################################################
WorkDirChargingClient='/export/home/calidad/chargingclient/records'
WorkDirNbgHourly='/calidad/sva/nbg/hourly'
WorkDirNbgDaily='/calidad/sva/nbg/daily'
WorkDirCCDir='/export/home/calidad/chargingclient'
WorkDirStorageNbg='/export/home/nbg/files'

####################################################
## Sva Tmm
####################################################
WorkDirTmmHourly='/calidad/sva/tmm/hourly/'
WorkDirTmmDaily='/calidad/sva/tmm/daily/'
WorkDirStorageTmm='/export/home/tmm/files'
statsTmm='MO MT'
userTmm='tmm'
ipTmm='10.92.50.83'
WorkDirScriptTmm='/export/home/tmm/'
scriptTmm='./permisos.sh'

####################################################
## Sva Diameter
####################################################

workDirSvaDiameterHourly='/calidad/sva/diameter/hourly/'
workDirSvaDiameterDaily='/calidad/sva/diameter/daily/'

#################################################################################################################################################
###### AQ UMTS
#################################################################################################################################################

wDirNsnUmtsHourly='/calidad/nokia/umts/aq/hourly/'
wDirNsnUmtsHourlyLog='/calidad/nokia/umts/aq/hourly/logs/'
wDirNsnUmtsHourlyScripts='/calidad/nokia/umts/aq/hourly/scripts/'
wDirNsnUmtsHourlyH='/calidad/nokia/umts/aq/hourly/history/'

wDirNsnUmtsDaily='/calidad/nokia/umts/aq/daily/'
wDirNsnUmtsDailyLog='/calidad/nokia/umts/aq/daily/logs/'
wDirNsnUmtsDailyScripts='/calidad/nokia/umts/aq/daily/scripts/'

wDirNsnUmtsDailyServiceDetail='/calidad/nokia/umts/aq/daily/service/detail/'
wDirNsnUmtsDailyServiceMaster='/calidad/nokia/umts/aq/daily/service/master/'

wdNsnUmtsDailyLog='/calidad/nokia/umts/aq/daily/logs/'
wdNsn3gDailyLogDetSrv='/calidad/nokia/umts/aq/daily/logs/Detail/Service/'
wdNsn3gDailyLogMstSrv='/calidad/nokia/umts/aq/daily/logs/Master/Service/'

wdNsnUmtsDailySrvDet='/calidad/nokia/umts/aq/daily/service/detail/'
wdNsnUmtsDailySrvMst='/calidad/nokia/umts/aq/daily/service/master/'

wdNsnUmtsSummaryDetSrv='/calidad/nokia/umts/aq/summary/service/detail/'
wdNsnUmtsSummaryMstSrv='/calidad/nokia/umts/aq/summary/service/master/'
wdNsnUmtsSummaryDetSrvLog='/calidad/nokia/umts/aq/summary/logs/Service/Detail/'
wdNsnUmtsSummaryMstSrvLog='/calidad/nokia/umts/aq/summary/logs/Service/Master/'

#################################################################################################################################################

listLevelSummaryCounterDefault='BH DAY'
listLevelSummaryCounterMacD='BH DAY HDAY'
listLevelSummaryDefault='BH DAY HDAY'
listLevelSummaryMacD='BH DAY'

####################################################
## Sva Vhe
####################################################

workdirStarHomeVheDaily='/calidad/sva/starhome/vhe/daily'
workdirGlr='../Argentina_GLR/'
fileVheDaily='capacity.csv'
scriptVheDaily='./statistics.sh'
workdirVheWsms='../VHE/'
statsVhe='BHCA BHSM'

#####################################################
# EMBLACOM VPN
#####################################################

workdirEmblacomVpnHourly='/calidad/sva/emblacom/hourly/'
countryEmblacom='AR UY PY'
userEmblacom='transfer'
ipEmblacom='10.104.191.151 10.104.201.169'
dirEmblacom='/home/transfer/dailystats'

#####################################################
# DSR
#####################################################

WorkDirDsrHourly='/calidad/sva/dsr/hourly'
WorkDirDsrDaily='/calidad/sva/dsr/daily'
ipDsr='10.92.49.93'
userDsr='storage_user'
pathDsr='/SMART/storage01/dsrFiles'
StatisticsDsr='memory system processor connections'

#####################################################
# DNS
#####################################################

WorkDirSvaDnsHourly='/calidad/sva/dns/hourly'
WorkDirSvaDnsDaily='/calidad/sva/dns/daily'

#####################################################
# VANTIO
#####################################################

workDirSvaVantioHourly='/calidad/sva/vantio/hourly'
workDirSvaVantioDaily='/calidad/sva/vantio/daily'
workDirSvaVantioSummary='/calidad/sva/vantio/summary'

#####################################################
# CORE CISCO GGSN
#####################################################

workDirCoreCiscoGgsn='/calidad/core/cisco/ggsn'

########################################################################
# Radar AMX
########################################################################

wdirTableroRadar='/calidad/tablero/radar/daily/'
wdirTableroRadarSummary='/calidad/tablero/radar/summary/'

listaNetworkElementTableroRadar='WCELL WBTS RNC ALM MERCADO CIUDAD CLUSTER PAIS'
listaNetworkElementTableroRadarSummary='WCELL WBTS RNC ALM MERCADO CIUDAD CLUSTER PAIS'

#####################################################
# STP
#####################################################

WorkDirStpHourly='/calidad/sva/stp/hourly/'
WorkDirStpDaily='/calidad/sva/stp/daily/'
userStp='stp_user'
ipStp='10.92.49.93'
pathStpFiles='/SMART/storage01/stpFiles'
StatisticsStp='component availability complink'
NodosStp='cordobastp rosariostp1 jontestp1 torcuatostp stp01asu stp01cde'

#####################################################
# NOKIA CORE SGSN HOUR
#####################################################

WorkDirCoreSgsnHourly='/calidad/nokia/sgsn/hourly/'
WorkDirCoreSgsnDaily='/calidad/nokia/sgsn/daily/'
WorkDirCoreSgsnSummary='/calidad/nokia/sgsn/summary/'
CoreSgsnList24='data_papu ipda_ippu iura_rnc load_index over_flexins paus_papu iusd_flexins gbsd_flexins'
CoreSgsnList3='iumm_sac1 gmmt_ci3 iusm_sac1 smtm_ci3'
CoreSgsnListDaily='data_papu load_index paus_papu iumm_sac1 iusm_sac1 iusd_flexins gbsd_flexins ipda_ippu iura_rnc over_flexins smtm_ci3 gmmt_ci3'
CoreSgsnKpiList='ippu stat cell wcell gbu'
CoreSgsnKpiListWeekly='ippu gbu wcell cell stat load'
StatList='PAPU SGSN'

#######################################
# IUR
#######################################

workDirTableroIur='/calidad/tablero/iur/'

#######################################
# CNC LATENCY
#######################################

userCncLatency='sistemasCnc'
ipFilesCnc='10.92.49.93'
DirCncLatency='/SMART/storage01/CncFilesLatency'
WorkDirCnc='/calidad/nokia/cnc/'

###########################################
# TOP 50
##########################################

workDirTableroTop50='/calidad/tablero/top_50/'

###########################################
# HFC MIBS
##########################################

WorkDirHfcHourly='/calidad/sva/hfc/hourly/'
WorkDirHfcDaily='/calidad/sva/hfc/daily/'
WorkDirHfcSummary='/calidad/sva/hfc/weekly/'

##########################################
# OCUDR
##########################################

WorkDirOcudrHourly='/calidad/sva/tekelec/ocudr/hourly/'
WorkDirOcudrDaily='/calidad/sva/tekelec/ocudr/daily/'
WorkDirOcudrSummary='/calidad/sva/tekelec/ocudr/weekly/'

StatisticsOcudr='oam udrbe provisioning comagent Sh udrfe'
userOcudr='storage_user'
ipOcudr='10.92.49.93'
pathOcudr='/SMART/storage01/OcudrFiles'
