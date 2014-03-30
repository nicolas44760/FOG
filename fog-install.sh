#!/bin/bash

echo "mise à jour et upgarde du systeme avant installation"
sudo apt-get update && sudo apt-get upgrade

echo "appuyer sur enter pour commencer l'installation"
echo ""


#installation de webmin
echo "installation de webmin: administration du serveur par le web"
sudo apt-get install webmin

#installatyion de wireshark
echo "installation de wireshark: outils d'analyse reseau"
sudo apt-get install wireshark

# Installation de FOG-Sevrer

echo "téléchargement de fog 0.32"

sudo wget http://sourceforge.net/projects/freeghost/files/fog_0.32.tar.gz
echo "decompression de l'archive"
sudo tar -xvzf fog_0.32.tar.gz
cd fog_0.32/bin
sudo chmod +x installfog.sh
echo "lancement de l'installation"
sudo ./installfog.sh
