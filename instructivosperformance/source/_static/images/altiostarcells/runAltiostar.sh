#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
COMMENT

ps cax | grep runAltiostarEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/Altiostar/Scripts/runAltiostarEndToEnd.sh
fi
exit
#!/bin/bash
<<COMMENT
        Fecha: 10/02/2017
COMMENT

ps cax | grep runAltiostarEndToEnd.sh > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  sh /calidad/Altiostar/Scripts/runAltiostarEndToEnd.sh
fi
exit
