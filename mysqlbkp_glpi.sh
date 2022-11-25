#!/bin/bash

NAS="/mnt/nas/validador"

echo "Iniciando Backup"
mysqldump -u root -p"IDwSMwNDxGR@" glpi >/opt/backup_glpi/glpi-$(date +%d-%m-%Y).sql

echo "verificando mapeamento NAS"

if [ -e "$NAS" ]; then
	echo "Tem unidade montada"
		
else
	echo "Unidade não encontrada, iniciando mapeamento"
        #mount -t cifs //192.168.31.29/backup/Backup_GLPI_DB -o username=faraway,password="uTeVaLOG$Ana" /mnt/nas/
	sudo  mount -t cifs //192.168.31.29/backup/Backup_GLPI_DB -o username=faraway,password='uTeVaLOG$Ana' /mnt/nas/
	
fi

echo "Copiando bkp para nas"


mv /opt/backup_glpi/* /mnt/nas/
