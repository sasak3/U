#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt install -y bzip2 gzip coreutils screen curl
MYIP=$(curl -sS ipv4.icanhazip.com)
scversi=$(curl -sS https://raw.githubusercontent.com/heruahmad1/permission/main/vs | awk '{print $1}')
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
Exp1=$(curl -sS https://raw.githubusercontent.com/heruahmad1/permission/main/ipmini | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
echo -e "[ \e[33mINFO\033[0m ] Bersiap melakukan penginstalan"
sleep 2
else
echo -e "[ \e[33mINFO\033[0m izin script sudah berahir"
read -n 1 -s -r -p "  Press any key to Exit"
rm -f /root/sc
clear
exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/heruahmad1/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
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
    echo -e "${red}                    ♦️ CUSTOM SETUP DOMAIN VPS     ${NC}"
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
#download extra menu
echo -e "$green[INFO]$NC Download extra menu"
sleep 2
wget https://raw.githubusercontent.com/sasak3/v4/main/ssh/update.sh && chmod +x update.sh && ./update.sh
clear

cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - SSH NON-SSL Websocket   : 80, 8880" | tee -a log-install.txt
echo "   - SLOWDNS                 : 5300 [OFF]" | tee -a log-install.txt
echo "   - Stunnel4                : 447, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC             : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> WhatsApp : +6287864055410 (Text Only)"  | tee -a log-install.txt
echo "   >>> Telegram : t.me/heruahmad"  | tee -a log-install.txt
echo ""
echo " ====================-[ Script Mod By HR-vpn ]-===================="
echo -e ""
echo "" | tee -a log-install.txt
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
echo -e "
"
echo -ne "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi

