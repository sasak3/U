#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt install -y bzip2 gzip coreutils screen curl
MYIP=$(curl -sS ipv4.icanhazip.com)
scversi=$(curl -sS https://raw.githubusercontent.com/vlukss/Premium/main/update/scriptversion | awk '{print $1}')
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
clear
  echo ""
  echo -e "\e[32m      ┌───────────────────────────────────────────────┐\033[0m"
  echo -e "\e[32m   ───│                                               │───\033[0m"
  echo -e "\e[32m   ───│    ┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐   │───\033[0m"
  echo -e "\e[32m   ───│    ├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤    │───\033[0m"
  echo -e "\e[32m   ───│    ┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘   │───\033[0m"
  echo -e "\e[32m      │\033[0m  \e[33m      HR-vpn (C)https://t.me/HRstores      \033[0m \e[32m │\033[0m"
  echo -e "\e[32m      └───────────────────────────────────────────────┘\033[0m"
  echo -e "\e[36m             Autoscript xray vpn lite (multi port)\033[0m"
  echo -e "\e[36m  Make sure the internet is smooth when installing the script\033[0m"
  echo -e "\e[31m     JANGAN INSTALL SCRIPT INI MENGGUNAKAN KONEKSI VPN!!!\033[0m"
  echo ""
read -n 1 -s -r -p " Tekan enter untuk melanjutkan"
clear
echo -e "[ \e[33mINFO\033[0m ] Memeriksa izin script.."
sleep 3
CEKEXPIRED () {
today=$(date -d +1day +%Y-%m-%d)
Exp1=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
echo -e "[ \e[33mINFO\033[0m ] Bersiap melakukan penginstalan"
sleep 2
read -n 1 -s -r -p " Tekan enter untuk melanjutkan"
else
echo -e "[ \e[33mINFO\033[0m izin script sudah berahir"
read -n 1 -s -r -p "  Press any key to Exit"
rm -f /root/sc
clear
exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | awk '{print $4}' | grep $MYIP)
if [[ $MYIP = $IZIN ]]; then
echo -e "[ \e[33mINFO\033[0m ] izin script telah di konfirmasi"
sleep 2
CEKEXPIRED
else
echo -e "[ \e[33mINFO\033[0m ] izin ip di tolak.. silahkan melakukan registrasi"
read -n 1 -s -r -p "  Press any key to Exit"
rm -f /root/sc
clear
exit 0
fi
clear
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
mkdir -p /var/lib/alf-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/alf-prem/ipvps.conf
echo -e "[ ${green}INFO${NC} mulai menginstall"
if [ -f "/etc/xray/domain" ]; then
echo ""
echo -e "[ \e[33mINFO\033[0m ] Script sudah di install"
echo -ne "[ \e[33mWARNING\033[0m ] Apakah kamu mau install lagi ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm setup.sh
sleep 10
exit 0
else
clear
fi
fi

    # > pasang gotop
    gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
    gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
    curl -sL "$gotop_link" -o /tmp/gotop.deb
    dpkg -i /tmp/gotop.deb >/dev/null 2>&1

    # > Pasang BBR Plus
    wget -qO /tmp/bbr.sh "${REPO}server/bbr.sh" >/dev/null 2>&1
    chmod +x /tmp/bbr.sh && bash /tmp/bbr.sh

if [[ -e /etc/debian_version ]]; then
	source /etc/os-release
	OS=$ID # debian or ubuntu
elif [[ -e /etc/centos-release ]]; then
	source /etc/os-release
	OS=centos
fi

echo ""
wget -q https://raw.githubusercontent.com/sasak3/v4/main/dep.sh;chmod +x dep.sh;./dep.sh
rm dep.sh
clear
clear

#echo " "
#read -rp "Input ur domain : " -e pp
   # if [ -z $pp ]; then
   #     echo -e "
   #     Nothing input for domain!
    #    Then a random domain will be created"
   #else
   #     echo "$pp" > /root/scdomain
#	echo "$pp" > /etc/xray/scdomain
#	echo "$pp" > /etc/xray/domain
#	echo "$pp" > /etc/v2ray/domain
#	echo $pp > /root/domain
 #       echo "IP=$pp" > /var/lib/SIJA/ipvps.conf
  #  fi

echo ""
  echo -e "\e[32m      ┌───────────────────────────────────────────────┐\033[0m"
  echo -e "\e[32m   ───│                                               │───\033[0m"
  echo -e "\e[32m   ───│    ┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐   │───\033[0m"
  echo -e "\e[32m   ───│    ├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤    │───\033[0m"
  echo -e "\e[32m   ───│    ┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘   │───\033[0m"
  echo -e "\e[32m      │\033[0m  \e[33m      HR-vpn (C)https://t.me/HRstores      \033[0m \e[32m │\033[0m"
  echo -e "\e[32m      └───────────────────────────────────────────────┘\033[0m"
    echo -e "${red}                       ♦️ CUSTOM SETUP DOMAIN VPS     ${NC}"
    echo -e "\e[32m      ┌───────────────────────────────────────────────┐\033[0m"
    echo "          1. Gunakan Domain Dari Script"
    echo "          2. Pilih Domain Sendiri"
    echo -e "\e[32m      └───────────────────────────────────────────────┘\033[0m"
    read -rp " Tentukan domain anda : " dom 

if test $dom -eq 1; then
clear
wget -q -O /root/cf.sh "https://raw.githubusercontent.com/sasak3/v4/main/slowdns/cf.sh"
chmod +x /root/cf.sh
./cf.sh
elif test $dom -eq 2; then
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/SIJA/ipvps.conf
 "IP=$host" >> /etc/xray/domain

fi
echo -e "${GREEN}Done.${NC}"
sleep 2
clear
echo "IP=$host" >> /var/lib/SIJA/ipvps.conf
#echo "IP=$host" >> /var/lib/scrz-prem/ipvps.conf
echo "$host" >> /root/domain
#clear
echo -e "$green[INFO]$NC Pointing Domain NS"
wget https://raw.githubusercontent.com/sasak3/v4/main/slowdns/cfslow.sh && chmod +x cfslow.sh && ./cfslow.sh
rm -f /root/cfslow.sh
clear
#install ssh ovpn
echo -e "$green[INFO]$NC Install SSH"
sleep 2
wget https://raw.githubusercontent.com/sasak3/v4/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
#Instal Xray
echo -e "$green[INFO]$NC Install Xray"
sleep 2
wget https://raw.githubusercontent.com/sasak3/v4/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
wget https://raw.githubusercontent.com/sasak3/multi-ws/ipuk/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
#instal websocket
echo -e "$green[INFO]$NC Install websocket"
sleep 2
wget https://raw.githubusercontent.com/sasak3/v4/main/Sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
#pasang rc clone ssh ovpn 
echo -e "$green[INFO]$NC Install SET-BR"
sleep 2
wget https://raw.githubusercontent.com/sasak3/v4/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh >/dev/null 2>&1
clear   
#Instal slowdns
echo -e "$green[INFO]$NC Install SowDNS"
sleep 2
wget -q -O slow.sh https://raw.githubusercontent.com/sasak3/v4/main/slowdns/slow.sh && chmod +x slow.sh && ./slow.sh
clear
#udp
echo -e "$green[INFO]$NC Install UDP"
sleep 2
wget https://raw.githubusercontent.com/heruahmad1/v4/main/udp/udp.sh && bash udp.sh
clear



