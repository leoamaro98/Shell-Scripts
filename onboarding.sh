#!/bin/bash

echo "

#############################   Atualizando pacotes   ##################################

"
apt-get update -y
apt-get upgrade -y

echo "Instalando softwares padrões"
apt-get install dconf-editor -y
apt-get install openssh-server -y
apt-get install ocsinventory-agent -y



echo "

#############################   Copiando Driver DockaDell   ################################

"
smbclient //192.168.90.82/gpos$/ -U ti-infra -c "get displaylink-driver-5.2.14.run /opt/displaylink-driver-5.2.14.run;"

echo "

#############################  Instalando Driver Docka Dell   ################################

"
chmod +x /opt/displaylink-driver-5.2.14.run;

/opt/displaylink-driver-5.2.14.run;



echo "

#############################   Inicando Ocs Inventory   ################################

"
ocsinventory-agent

echo "

#############################  Copiando Senhas Wifi.txt  ################################

"
echo " Digite a senha do ti-infra:"
smbclient //192.168.90.82/gpos$/ -U ti-infra -c "get senhawifi.txt /opt/senhawifi.txt;"


echo "

#############################  Criando usuario  ################################

"

echo "Adicionar usuário: "
read usuario
adduser $usuario

echo "senha do usuario $usuario: "
passwd $usuario

