#!/bin/bash
INFORMES_HOME=$1

HEADER="<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Disk space usage</title>
<h2> Disk space usage </h2>
<style>
table, td {
    border : 1px solid black;
}
td {
   background-color: #01984D;
   color           : white;
}
th {
    border : 1px solid black;
    background-color: green;
    color           : white;
}
</style>
</head><body>
<table>
    <tr>
    <th>Server</th>
    <th>Filesystem</th>
    <th>Size</th>
    <th>Used</th>
    <th>Avail</th>
    <th>Use%</th>
   <th>Mounted on</th>
    </tr>"
#
FOOTER="</table>
</body>
</html>"
#
echo "$HEADER" > $INFORMES_HOME/Data/espacio.html
#
cat $INFORMES_HOME/Data/perdidoRC21.txt  >> $INFORMES_HOME/Data/espacio.html
cat $INFORMES_HOME/Data/perdidoRC3.txt  >> $INFORMES_HOME/Data/espacio.html
#
cat $INFORMES_HOME/Data/guerreroST1.txt  >> $INFORMES_HOME/Data/espacio.html
#
cat $INFORMES_HOME/Data/cortado.txt  >> $INFORMES_HOME/Data/espacio.html
#
echo "$FOOTER" >> $INFORMES_HOME/Data/espacio.html

exit
