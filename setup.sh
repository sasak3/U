#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

REPO="https://raw.githubusercontent.com/sasak3/U/main/"

###
BURIQ () {
    curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/sasak3/izinvps/ipuk/ip 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/sasak3/izinvps/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo " Anda perlu menjalankan skrip ini sebagai root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo " OpenVZ Tidak di dukung"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
  echo ""
  echo -e"${tyblue}    ┌───────────────────────────────────────────────┐${NC}"
  echo -e"${tyblue} ───│                                                       │───${NC}"
  echo -e"${tyblue} ───│    ┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐    │───${NC}"
  echo -e"${tyblue} ───│    ├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤       │───${NC}"
  echo -e"${tyblue} ───│    ┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘     │───${NC}"
  echo -e"${tyblue}    │${NC}${yellow}    (C)https://t.me/fightertunnell  ${NC} ${tyblue} │${NC}"
  echo -e"${tyblue}    └───────────────────────────────────────────────┘${NC}"
  echo -e"              Autoscript xray vpn lite (multi port)"
  echo -e"      Make sure the internet is smooth when installing the script"
  echo -e"${red}      JANGAN INSTALL SCRIPT INI MENGGUNAKAN KONEKSI VPN!!!${NC}"
  echo -e "[ ${tyblue}NOTES${NC} ] Untuk melanjutkan tekan ENTER.."
  read
else
  echo -e "[ ${green}INFO${NC} ] Oke install di mulai"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi

echo -e "[ ${tyblue}NOTES${NC} ] Sebelum Lanjut. . "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] Saya perlu memeriksa header anda dulu.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Memeriksa headers..."
sleep 1
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Mencoba untuk install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] Jika error... Anda perlu melakukan ini"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 1. Lakukan update -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 2. Lakukan upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 3. Upgrade dist Yg tepat -y"
  sleep 1
  clear

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Mempersiapkan file instalasi"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Oke sudah siap ... install vps sudah siap"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Cek perizinan : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Izin ip sudah valid!"
else
red "Izin di tolak hubungi admin!"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
sleep 3

mkdir -p /etc/kyt
mkdir -p /etc/ssnvpn/theme
mkdir -p /var/lib/ssnvpn-pro >/dev/null 2>&1
echo "IP=" >> /var/lib/ssnvpn-pro/ipvps.conf

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
