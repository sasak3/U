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
  echo -e "\e[33m    ┌───────────────────────────────────────────────┐\033[0m"
  echo -e "\e[33m ───│                                                       │───\033[0m"
  echo -e "\e[33m ───│    ┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐    │───\033[0m"
  echo -e "\e[33m ───│    ├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤       │───\033[0m"
  echo -e "\e[33m ───│    ┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘     │───\033[0m"
  echo -e "\e[33m    │\033[0m  \e[33m    (C)https://t.me/fightertunnell  \033[0m \e[33m │\033[0m"
  echo -e "\e[33m    └───────────────────────────────────────────────┘\033[0m"
  echo -e "              Autoscript xray vpn lite (multi port)"
  echo -e "      Make sure the internet is smooth when installing the script"
  echo -e "\e[33m     JANGAN INSTALL SCRIPT INI MENGGUNAKAN KONEKSI VPN!!!\033[0m"
  echo ""
read -n 1 -s -r -p "  Press any key to Continue"
clear
echo -e "[ ${green}INFO${NC} Cek izin ip"
CEKEXPIRED () {
today=$(date -d +1day +%Y-%m-%d)
Exp1=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
echo -e "[ ${green}INFO${NC} status script aktip"
read -n 1 -s -r -p "  Press any key to Continue"
else
echo -e "[ ${green}INFO${NC} izin ip sudah berahir"
read -n 1 -s -r -p "  Press any key to Exit"
rm -f /root/sc
clear
exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | awk '{print $4}' | grep $MYIP)
if [[ $MYIP = $IZIN ]]; then
echo -e "[ ${green}INFO${NC} izin ip telah di setujui"
CEKEXPIRED
else
echo -e "[ ${green}INFO${NC} izin ip di tolak.. silahkan melakukan registrasi"
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
echo -e "[ ${green}INFO${NC} ] Script sudah di install"
echo -ne "[ ${yell}WARNING${NC} ] Apakah kamu mau install lagi ? (y/n)? "
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

echo "install paket...!"
echo 
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

echo -e ""
echo -e " ════════════════════════════════════════" 
echo -e "     _   _ ____" 
echo -e "    | | | |  _ \    __   ___ __  _ __  " 
echo -e "    | |_| | |_) |___\ \ / / '_ \| '_ \  " 
echo -e "    |  _  |  _ <_____\ V /| |_) | | | | " 
echo -e "    |_| |_|_| \_\     \_/ | .__/|_| |_| " 
echo -e "                          |_|  "
echo -e " ════════════════════════════════════════" 
echo -e "              [Autoscrip premium]" 
echo -e " ════════════════════════════════════════" 
    echo -e "${red}        ♦️ CUSTOM SETUP DOMAIN VPS     ${NC}"
    echo -e "${red} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
    echo "  2. Use Domain From script / Gunakan Domain Dari Script"
    echo "  3. Choose Your Own Domain / Pilih Domain Sendiri"
    echo -e "${red} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
    read -rp "Choose Your Domain Installation : " dom 

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



