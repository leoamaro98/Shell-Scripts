#!/bin/bash

NAS="/mnt/nas/validador"

echo "Iniciando Backup"
mysqldump -u root -p"IDwSMwNDxGR@" glpi >/opt/backup_glpi/glpi-$(date +%d-%m-%Y).sql

echo "verificando mapeamento NAS"

if [ -e "$NAS" ]; then
	echo "Tem unidade montada"
		
else
	echo "Unidade não encontrada, iniciando mapeamento"
        mount -t cifs //192.168.0.29/backup/'Backup GLPI DB' -o username=guest,password="" /mnt/nas/
	
fi

echo "Copiando bkp para nas"


mv /opt/backup_glpi/* /mnt/nas/
