
#!/bin/sh
<<COMMENT
        Fecha: 03/08/2017
        Calcula la fecha respecto a la
        actual del sistema e inicia el EndToEnd de Pentaho
COMMENT
#SFTP-REMOTE-DIR="/var/www/reports"
SFTPUSER=dlc_report
SFTPPASS=d78preFAfaVe
SFTPIP=10.104.8.20
#echo $SFTPUSER
#ftp -inv << _EOF_
#open $SFTPIP

date=`date +%Y%m%d`

sh $HOME/Pentaho61/data-integration/kitchen.sh -file=$HOME/AcSVOWIFI/PentahoSourceFiles/AcSVOWIFI_RAW_EndToEnd.kjb -param:FECHA_PROC=$date
