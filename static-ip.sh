#!/bin/bash
getinfo()
{
  read -p "entre l'adresse du routeur   " routerip
  read -p "le masque de sous reseau" netmask
  read -p "entre l'ip du serveur  " staticip)
  read -p "adresse du serveur DNS ?  " dns
  read -p "broadcast ?:  " broadcast
}

writeinterfacefile()

{

cat << EOF > $1
# The loopback network interface
auto lo
iface lo inet loopback

#nouvelle configuration IP
iface eth0 inet static
address $staticip
netmask $netmask
gateway $routerip
broadcast $broadcast
dns-nameservers $dns
EOF
#don't use any space before of after 'EOF' in the previous line
  echo ""
  echo "envois des informations de confgurations dans: '$1' file."
  echo ""
  exit 0
}

file="/etc/network/interfaces"
if [ ! -f $file ]; then
  echo ""
  echo "The file '$file' doesn't exist!"
  echo ""
  exit 1
fi

clear
echo "mise en place de l'adresse ip static du serveur"
echo ""

getinfo
echo ""
echo "configuration static du serveur"
echo "Address:   $routerip"
echo "masque de sous reseau: $netmask"
echo "ip du serveur:   $staticip"
echo "serveur DNS:  $dns"


while true; do
  read -p "Are these informations correct? [y/n]: " yn
  case $yn in
    [Yy]* ) writeinterfacefile $file;;
    [Nn]* ) getinfo;;
        * ) echo "Pleas enter y or n!";;
  esac
done
