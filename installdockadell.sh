#!/bin/bash

echo "

#############################   Copiando Driver DockaDell   ################################

"
smbclient //192.168.90.82/gpos$/ -U ti-infra -c "get displaylink-driver-5.2.14.run /opt/displaylink-driver-5.2.14.run;"

echo "

#############################  Instalando Driver Docka Dell   ################################

"
chmod +x /opt/displaylink-driver-5.2.14.run;

/opt/displaylink-driver-5.2.14.run;

