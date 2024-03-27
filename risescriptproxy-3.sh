#!/bin/bash
##########################################################################################
#Satın alan kişilerin scripti ücretsiz veya ücretli şekilde satması kesinlikle yasaktır! #
#Script çalışmasa bile scripti paylaşmak veya kodlarını paylaşmak kesinlikle yasaktır..! #
#Bu tarz işlem yapanlarla ilgili hukuki işlemler başlatılacaktır.                        #
#R10 Adresim: https://www.r10.net/profil/164294-eyupp.html                               #
#R10 Kullanıcı Adım: Eyupp                                                               #
#İletişim: rise.klani@gmail.com                                                          #
#Yapımcı: Eyüp // :): // Discord: Eyüp#0062                                              #
##########################################################################################




############################
#    KULLANICI AYARLARI    #
############################
KULLANICIADI="riseproxy"
SIFRE="rise"
ZIPSIFRESI="rise"
############################




#Color Config#
r0kapat='\033[0m'
r1beyaz='\033[1;29m'
r2kirmizi='\033[0;31m'
r3mavi='\033[1;36m'
r4sari='\033[1;33m'
r5yesil='\033[1;32m'
r6kmavi='\033[1;36m'
r7pembe='\033[1;35m'
RENK4="${r4sari}"
RENK2="${r2kirmizi}"
RENK3="${r3mavi}"
RENK0="${r0kapat}"
RENK5="${r5yesil}"

#Manuel Ayarlar
tarihsaat=$(date "+%H-%M-%S")
tarihgunayyil=$(date "+%d-%m-%y")
IPV6_ILK_PORT=10000
ulimit -n 600000
ulimit -u 600000
klasorum=$(pwd)
scadi=$(basename "$0")
surum="2.8"
MAKSIMUMPROXY=2501

ipv6_k=(1 2 3 4 5 6 7 8 9 0 a b c d e f)
ipv6_olustur() {
    ipv6_ver() {
        echo "${ipv6_k[$RANDOM % 16]}${ipv6_k[$RANDOM % 16]}${ipv6_k[$RANDOM % 16]}${ipv6_k[$RANDOM % 16]}"
    }
	if [[ $IPV6SUBNET == "64" ]]; then
    echo ":$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver)"
	elif [[ $IPV6SUBNET == "48" ]]; then
	echo ":$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver)"
	elif [[ $IPV6SUBNET == "32" ]]; then
	echo ":$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver):$(ipv6_ver)"
	fi
}

rastgele() {
    tr </dev/urandom -dc A-Za-z0-9 | head -c5
    echo
}


if [ "$(id -u)" != "0" ]; then
clear
echo -e "${RENK3}######################################################################"
echo -e "${RENK3}### ${RENK5}Scripti Kullanabilmek İçin ${RENK2}Root ${RENK5}Yetkisine Sahip Olmanız Gerek. ${RENK3}###"
echo -e "${RENK3}### ${RENK5}Şu Komutu Kullanmayı Deneyin: ${RENK2}sudo su                          ${RENK3}###"
echo -e "${RENK3}######################################################################${RENK0}"
exit 1
fi

case $1 in

--v | --V)
clear
echo -e "Sürüm: $surum"
exit
 ;;
-v | -V)
clear
echo -e "Sürüm: $surum"
exit
 ;;
--dev | --DEV)
devmode="1"
 ;;
-dev | -DEV)
devmode="1"
 ;;
esac

if [ ! -f /usr/bin/curl ]
then
		clear
		echo -e "${RENK3}#####################################################################"
		echo -e "${RENK3}### ${RENK5}Scripti Kullanabilmek İçin Sunucuda ${RENK2}cURL ${RENK5}Yüklü Olması Gerekir ${RENK3}###"
		echo -e "${RENK3}### ${RENK5}Sunucunuza ${RENK2}cURL ${RENK5} Yükleniyor...                                ${RENK3}###"
		echo -e "${RENK3}#####################################################################${RENK0}"
sleep 3
yum install -y curl
fi

#Güncelleme Kontrol ( İsterseniz bu kısmı silebilirsiniz. )
if curl --insecure -s -N -4 https://gitfront.io/r/eyup/SsyYME9MACpx/bilgiler/raw/proxy | grep "$surum" >/dev/null 2>&1
then
ok="1"
else
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#           ${RENK2}GÜNCELLEME TESPİT EDİLDİ!            ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Yeni güncellemeyi indirmek için bana ulaşın!   ${RENK3}#"
echo -e "${RENK3}# ${RENK2}WhatsApp: ${RENK5}$(curl -s --insecure https://gitfront.io/r/eyup/SsyYME9MACpx/bilgiler/raw/whatsapp-numaram)"
echo -e "${RENK3}# ${RENK2}Eğer scripte devam etmek istiyorsanız ${RENK5}0${RENK2} yazın. ${RENK3}#"
echo -e "${RENK3}##################################################${RENK0}"
echo -ne "${RENK5}Cevap: ${RENK2}"
read guncellemecevap
case $guncellemecevap in

0)
ok="2"
;;
*)
exit
;;
esac
fi

#Güncelleme Kontrol Bitiş ( İsterseniz bu kısmı silebilirsiniz. ) 

if cat /etc/*release | grep ^NAME | grep CentOS ; then
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}SUNUCUNUZ YANLIŞ İŞLETİM SİSTEMİNİ KULLANIYOR! ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Sunucunuzda yüklü olan işletim sisteminin ${RENK5}CentOS${RENK2} olduğu tespit edilmiştir."
echo -e "${RENK3}# ${RENK2}Script 2.6 sürümü ile beraber ${RENK5}CentOS 7${RENK2}'den ${RENK5}Ubuntu 20.04${RENK2} sürümüne geçiş yapmıştır."
echo -e "${RENK3}# ${RENK2}Lütfen işletim sisteminizi güncelleyin. Script kapatılıyor..."
echo -e "${RENK3}##################################################${RENK0}"
exit
fi

clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK5}Script Yükleniyor...            ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
echo -e "${RENK3}# ${RENK2}Detaylar:"
echo -e "${RENK3}# ${RENK2}• IPv4 adresiniz tespit edilmeye çalışılıyor..."
echo -e "${RENK3}##############################################${RENK0}"
IPV4=$(curl -s -4 icanhazip.com)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK5}Script Yükleniyor...            ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
echo -e "${RENK3}# ${RENK2}Detaylar:"
echo -e "${RENK3}# ${RENK2}• IPv6 adresiniz tespit edilmeye çalışılıyor..."
echo -e "${RENK3}##############################################${RENK0}"
IPV6=$(curl -s -6 icanhazip.com)
clear

if [[ $IPV6 == "" ]]; then
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#             ${RENK2}SUNUCUNUZDA IPV6 YOK!              ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Sunucunuzda tanımlı ${RENK5}IPv6 ${RENK2}bulunmamaktadır."
echo -e "${RENK3}# ${RENK2}Bu muhtemelen sunucu sağlayıcınız ile alakalıdır."
echo -e "${RENK3}# ${RENK2}Destek talebi açıp kendilerinden ${RENK5}IPv6 tanımlamalarını isteyiniz."
echo -e "${RENK3}##################################################${RENK0}"
sleep 3
fi

if [[ $IPV4 == "" ]]; then
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#             ${RENK2}SUNUCUNUZDA IPV4 YOK!              ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Sunucunuzda tanımlı ${RENK5}IPv4 ${RENK2}bulunmamaktadır."
echo -e "${RENK3}# ${RENK2}Bu muhtemelen sunucu sağlayıcınız ile alakalıdır."
echo -e "${RENK3}# ${RENK2}Destek talebi açıp kendilerinden ${RENK5}IPv4 tanımlamalarını isteyiniz."
echo -e "${RENK3}##################################################${RENK0}"
exit
fi

if [ ! -f /dev/proxyayarlariyapildi ]; then
echo "##################################################
#                RiseScript-Proxy                #
##################################################
UserTasksMax=1000000
DefaultMemoryAccounting=no
DefaultTasksAccounting=no
DefaultTasksMax=1000000
UserTasksMax=1000000
DefaultLimitDATA=infinity
DefaultLimitSTACK=infinity
DefaultLimitCORE=infinity
DefaultLimitRSS=infinity
DefaultLimitNOFILE=102400
DefaultLimitAS=infinity
DefaultLimitNPROC=10240
DefaultLimitMEMLOCK=infinity
##################################################" >> /etc/systemd/user.conf
echo "##################################################
#                RiseScript-Proxy                #
##################################################
UserTasksMax=1000000
DefaultMemoryAccounting=no
DefaultTasksAccounting=no
DefaultTasksMax=1000000
UserTasksMax=1000000
DefaultLimitDATA=infinity
DefaultLimitSTACK=infinity
DefaultLimitCORE=infinity
DefaultLimitRSS=infinity
DefaultLimitNOFILE=102400
DefaultLimitAS=infinity
DefaultLimitNPROC=10240
DefaultLimitMEMLOCK=infinity
##################################################" >> /etc/systemd/system.conf
echo "##################################################
#                RiseScript-Proxy                #
##################################################
UserTasksMax=1000000
##################################################" >> /etc/systemd/logind.conf
cat >>/etc/sysctl.conf <<END
##################################################
#                RiseScript-Proxy                #
##################################################
net.ipv6.conf.all.proxy_ndp=1
net.ipv6.conf.default.forwarding=1
net.ipv6.conf.all.forwarding=1
net.ipv6.ip_nonlocal_bind=1
net.ipv4.ip_local_port_range=1024 64000
net.ipv6.route.max_size=409600
net.ipv4.tcp_max_syn_backlog=4096
net.ipv6.neigh.default.gc_thresh3=102400
kernel.threads-max=1200000
kernel.max_map_count=6000000
vm.max_map_count=6000000
kernel.pid_max=2000000
##################################################
END
sed -i "s@net.ipv6.conf.all.disable_ipv6 = 1@net.ipv6.conf.all.disable_ipv6 = 0@g" /etc/sysctl.conf
sed -i "s@net.ipv6.conf.default.disable_ipv6 = 1@net.ipv6.conf.default.disable_ipv6 = 0@g" /etc/sysctl.conf
sed -i "s@net.ipv6.conf.lo.disable_ipv6 = 1@net.ipv6.conf.lo.disable_ipv6 = 0@g" /etc/sysctl.conf
sysctl -p
touch /dev/proxyayarlariyapildi
fi

if [ ! -d /home/proxyolusturucu ]
then
clear
echo -e "${RENK4}--------------------------------------------------------"
echo -e "${RENK2}-->            Ana bileşenler yükleniyor.            <--"
echo -e "${RENK2}-->    Ortalama 1-2 Dakika içinde yüklenecektir.     <--"
echo -e "${RENK2}-->          Bu işlem bir kereye mahsustur.          <--"
echo -e "${RENK4}--------------------------------------------------------${RENK0}"
sudo apt-get update -y && sudo apt-get install gcc make curl zip wget net-tools git -y
sudo ufw disable
mkdir /home/proxyolusturucu
mkdir /home/proxyolusturucu/olusturulanproxyler
mkdir /home/proxyolusturucu/cronisleri
fi

configolustur(){
echo "nserver 8.8.8.8

nserver 8.8.4.4

nscache6 65536

timeouts 1 5 30 60 180 1800 15 60

$(if [[ $rastgele == "1" ]]; then echo 'users'; elif [[ $sabitsifre == "1" ]]; then echo "users $KULLANICIADI:CL:$SIFRE"; elif [[ $sifresiz == "1" ]]; then ok=1; fi)

daemon

log /dev/null

setgid 65535

setuid 65535

stacksize 1024000

authcache user 60

$(if [[ $rastgele == "1" ]]; then echo 'auth strong'; elif [[ $sabitsifre == "1" ]]; then echo "auth strong"; echo "allow ${KULLANICIADI}"; elif [[ $sifresiz == "1" ]]; then echo 'auth none'; fi)"
}

3proxy_kurulum(){
cd /home/proxyolusturucu
git clone https://github.com/z3apa3a/3proxy
cd 3proxy
ln -s Makefile.Linux Makefile
make
sudo make install
rm -rf 3proxy.config
rm -rf /usr/bin/3proxy
cd bin/
cp 3proxy /usr/bin
touch /home/proxyolusturucu/.3proxykuruldu
}

if [ ! -f /home/proxyolusturucu/.3proxykuruldu ]
then
3proxy_kurulum
else
clear
fi

scriptsifirla(){
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#           ${RENK2}Script Sıfırlanıyor...           ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 2
rm -rf /home/proxyolusturucu
cd $klasorum
if [ -f $scadi ]
then
sed -i "18s@KULLANICIADI=.*@KULLANICIADI=\"risescript\"@" $scadi
sed -i "19s@SIFRE=.*@SIFRE=\"rise\"@" $scadi
sed -i "20s@ZIPSIFRESI=.*@ZIPSIFRESI=\"rise\"@" $scadi
cd /mnt
crontab -l > cronisleri
sed -i '/cd \/home\/proxyolusturucu\/cronisleri/d' cronisleri
crontab cronisleri
rm -rf cronisleri
fi
clear
echo -e "${RENK3}#################################################"
echo -e "${RENK3}#               ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}#################################################"
echo -e "${RENK3}#          ${RENK2}Script Tamamen Sıfırlandı.           ${RENK3}#"
echo -e "${RENK3}# ${RENK2}Sunucu 15 Saniye Sonra Yeniden Başlatılacak.  ${RENK3}#"
echo -e "${RENK3}# ${RENK2}Bu işlem, sıfırlama işleminin bir parçasıdır. ${RENK3}#"
echo -e "${RENK3}# ${RENK2}Bu yüzden lütfen scripti engellemeyin.        ${RENK3}#"
echo -e "${RENK3}#################################################${RENK0}"
sleep 15
reboot
}

kadivesifislemleri(){
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK3}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
echo -e "${RENK2}1)${RENK3}Sabit Kullanıcı Adını Değiştir (Sonraki Kurulacak Proxyler İçin Geçerlidir)" 
echo -e "${RENK2}2)${RENK3}Sabit Şifreyi Değiştir (Sonraki Kurulacak Proxyler İçin Geçerlidir)"
echo -e "${RENK2}3)${RENK3}ZIP Şifresini Değiştir (Sonraki Kurulacak Proxyler İçin Geçerlidir)"
echo -e "${RENK2}0)${RENK3}Ana Menüye Dön"
echo -ne "${RENK5}Cevap: ${RENK2}"
read islemcevap
case $islemcevap in

1)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#        ${RENK5}Yeni Kullanıcı Adını Giriniz        ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read yenikadi
cd $klasorum
if [ -f $scadi ]
then
sed -i "18s@KULLANICIADI=.*@KULLANICIADI=\"${yenikadi}\"@" $scadi
fi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#        ${RENK2}Kullanıcı Adı Değiştirildi...       ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
bash $scadi
exit
;;
2)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK5}Yeni Şifreyi Giriniz            ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read yenisifre
cd $klasorum
if [ -f $scadi ]
then
sed -i "19s@SIFRE=.*@SIFRE=\"${yenisifre}\"@" $scadi
fi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#        ${RENK2}Sabit Şifre Değiştirildi...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
bash $scadi
exit
;;
3)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK5}Yeni ZIP Şifresini Giriniz         ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read yenizipsifre
cd $klasorum
if [ -f $scadi ]
then
sed -i "20s@ZIPSIFRESI=.*@ZIPSIFRESI=\"${yenizipsifre}\"@" $scadi
fi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#        ${RENK2}ZIP Şifresi Değiştirildi...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
bash $scadi
exit
;;
0)
anamenu
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
}

proxybaslat(){
clear
if ! [[ $IPV6 =~ [0-9] ]]; then
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
fi
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}Tüm Proxyleri Başlat"
echo -e "${RENK2}2)${RENK3}Belirli Port Aralığındaki Proxyleri Başlat (Sadece Belirli Port Aralığındaki Durdurulmuş Proxyler İçin Geçerlidir)"
echo -e "${RENK2}0)${RENK3}Ana Menüye Dön"
echo -ne "${RENK5}Cevap: ${RENK2}"
read proxybaslatmacevap
case $proxybaslatmacevap in

1)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#        ${RENK2}Tüm Proxyler Başlatılıyor...        ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
cd /home/proxyolusturucu/3proxy/
if [[ $devmode == "1" ]]
then
for ifconfigler in ipekle*; do bash "$ifconfigler"; done
else
for ifconfigler in ipekle*; do bash "$ifconfigler" >/dev/null 2>&1; done
fi
for configler in 3proxy.config*; do 3proxy "$configler"; done
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#       ${RENK2}Tüm Proxyler Başlatılmıştır...       ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
exit
;;
2)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#    ${RENK5}Başlatılacak Port Aralığını Giriniz     ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Şu şekilde girin: ${RENK2}10000:15000              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read portaraligibaslatma

	if echo "$portaraligibaslatma" | grep -E '^[0-9]+:[0-9]+$' > /dev/null; then
iptables -I INPUT -p tcp --dport $portaraligibaslatma -j ACCEPT
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Proxyler Başlatılmıştır...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
	else
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#       ${RENK2}Port Aralığı Yanlış Girildi...       ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Şu şekilde girin: ${RENK2}10000:15000              ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
proxybaslat
	fi
;;
0)
anamenu
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
}

proxydurdur(){
clear
if ! [[ $IPV6 =~ [0-9] ]]; then
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
fi
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}Tüm Proxyleri Durdur"
echo -e "${RENK2}2)${RENK3}Belirli Port Aralığındaki Proxyleri Durdur"
echo -e "${RENK2}0)${RENK3}Ana Menüye Dön"
echo -ne "${RENK5}Cevap: ${RENK2}"
read proxydurdurmacevap
case $proxydurdurmacevap in

1)
pkill -f 3proxy
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Proxyler Durdurulmuştur...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
exit
;;
2)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#    ${RENK5}Durdurulacak Port Aralığını Giriniz     ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Şu şekilde girin: ${RENK2}10000:15000              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read portaraligi

	if echo "$portaraligi" | grep -E '^[0-9]+:[0-9]+$' > /dev/null; then
iptables -A INPUT -p tcp --dport $portaraligi -j DROP
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Proxyler Durdurulmuştur...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
	else
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#       ${RENK2}Port Aralığı Yanlış Girildi...       ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Şu şekilde girin: ${RENK2}10000:15000              ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
proxydurdur
	fi
;;
0)
anamenu
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
}

refleshmodulu(){
if ! [[ $kurulumaktif == "1" ]]; then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK5}Kaç Saniyede Bir IPv6 Adresleri Değişsin?  ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK2}NOT: ${RENK5}Dakika cinsinden hesaplayabilirsiniz. ${RENK3}#"
echo -e "${RENK3}# ${RENK2}NOT²: ${RENK5}Yüksek sayıda proxylerde (ör: 2000)  ${RENK3}#"
echo -e "${RENK3}# ${RENK5}minimum 100 girin.                         ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK2}Örnek: ${RENK5}300                                 ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read refleshsaniye
fi

if [[ $kurulumadevam == "1" ]]; then
cd /home/proxyolusturucu/cronisleri
rm -rf /home/proxyolusturucu/cronisleri/ipyapici$IPV6SUBNET.sh
cat <<EOF >> /home/proxyolusturucu/cronisleri/ipyapici$IPV6SUBNET.sh
#!/bin/bash
rm -rf /home/proxyolusturucu/cronisleri/ipolustur$IPV6SUBNET.sh
echo "#!/bin/bash
IPV6=\"${IPV6}\"
IPV6SUBNET=\"$IPV6SUBNET\"" >> /home/proxyolusturucu/cronisleri/ipolustur$IPV6SUBNET.sh
echo 'ipv6_k=(1 2 3 4 5 6 7 8 9 0 a b c d e f)
ipv6_olustur() {
    ipv6_ver() {
        echo "\${ipv6_k[\$RANDOM % 16]}\${ipv6_k[\$RANDOM % 16]}\${ipv6_k[\$RANDOM % 16]}\${ipv6_k[\$RANDOM % 16]}"
    }
	if [[ \$IPV6SUBNET == "64" ]]; then
    echo "\$1:\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver)"
	elif [[ \$IPV6SUBNET == "48" ]]; then
	echo "\$1:\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver)"
	elif [[ \$IPV6SUBNET == "32" ]]; then
	echo "\$1:\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver):\$(ipv6_ver)"
	fi
}
YENIPV6(){
echo "\${IPV6}\$(ipv6_olustur)"
}
' >> /home/proxyolusturucu/cronisleri/ipolustur$IPV6SUBNET.sh
EOF
bash ipyapici$IPV6SUBNET.sh
cat <<EOF >> /home/proxyolusturucu/cronisleri/ipdegis$yeniconfigadi.sh
#!/bin/bash
ulimit -Hn 600000
ulimit -Hu 600000
source /home/proxyolusturucu/cronisleri/ipolustur$IPV6SUBNET.sh
yeniconfigadi="${yeniconfigadi}"
cd /home/proxyolusturucu/3proxy
rm -rf ipekle\$yeniconfigadi.sh
pidim=\$\$
tmpdosya=\$(mktemp)

while read -r ipler; do
    if [[ \$ipler == *"-e"* ]]; then
        ipler2=\$(echo "\$ipler" | grep -oP '(?<=-e)\S+')
        yeni_ipler=\$(YENIPV6 "\$ipler2")
        for ipadresleri in \$yeni_ipler; do
        echo "/usr/sbin/ip -6 addr add \$ipadresleri/$IPV6SUBNET dev $kbadi" >> ipekle\$yeniconfigadi.sh
        done
        ipler=\${ipler/"-e\$ipler2"/"-e\$yeni_ipler"}
    fi
    echo "\$ipler" >> "\$tmpdosya"
done < "\$yeniconfigadi"
mv -f "\$tmpdosya" "\$yeniconfigadi"
for pid in \$(pgrep 3proxy); do
    if [ \$pid -ne \$pidim ]; then
        kill \$pid
    fi
done
sed -i '1s/^/ulimit -Hn 600000\nulimit -Hu 600000\n/' ipekle\$yeniconfigadi.sh
sudo bash ipekle\$yeniconfigadi.sh
sudo bash ipcikar\$yeniconfigadi.sh
rm -rf ipcikar\$yeniconfigadi.sh
cp ipekle\$yeniconfigadi.sh ipcikar\$yeniconfigadi.sh
sed -i "s@addr add@addr del@g" ipcikar\$yeniconfigadi.sh
sleep 7
for configler in 3proxy.config*; do 3proxy "\$configler"; done
EOF

echo "#!/bin/bash
ulimit -Hn 600000
ulimit -Hu 600000
while true; do
sleep $refleshsaniye
cd /home/proxyolusturucu/cronisleri; chmod 777 ipdegis$yeniconfigadi.sh; ./ipdegis$yeniconfigadi.sh
done" >> cron$yeniconfigadi.sh
bash cron$yeniconfigadi.sh & disown

fi
}

proxykontrol(){
if ! [[ $normal == "2" ]]; then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#   ${RENK2}Proxy Listesinin Dosya Konumunu Girin    ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Proxy Listesinin Formatı Bu Şekilde Olmalı ${RENK3}#"
echo -e "${RENK3}#        ${RENK4}IPV4:PORT:KULLANICIADI:ŞİFRE        ${RENK3}#"
echo -e "${RENK3}# ${RENK5}Örnek Dosya Konumu: ${RENK2}/root/proxylistesi.txt ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
echo -ne "${RENK5}Cevap: ${RENK2}"
read dosyakonumu
if [ ! -f $dosyakonumu ]; then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}Dosya Bulunamadı...           ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
proxykontrol
fi
fi
clear
while read satirlar; do
    IFS=: read ip port user pass <<< "$satirlar"
    ipciktisi=$(curl -s --proxy "http://${user}:${pass}@${ip}:${port}" "http://icanhazip.com")
    
    if [[ $ipciktisi =~ ^[a-fA-F0-9:]+$ ]]; then
        echo -e "${RENK0}Port $port: ${RENK5}Bağlantı Başarılı ${RENK0}>> $ipciktisi"
		#echo -e "Port $port: Bağlantı Başarılı >> $ipciktisi" >> /root/logs.txt
    else
        echo -e "${RENK0}Port $port: ${RENK2}Bağlantı Başarısız"
		#echo -e "Port $port: Bağlantı Başarısız" >> /root/logs.txt
    fi
done < "$dosyakonumu"
exit
}

tunnelbrokerkur(){
if ifconfig | grep -q "he-ipv6"
then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}TunnelBroker Zaten Yüklü...        ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
tunnelbrokermenu
fi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#   ${RENK5}Sitedeki 'Server IPv4 Adress'i Giriniz   ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read tunnelbrokerserveripv4
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#   ${RENK5}Sitedeki 'Client IPv6 Adress'i Giriniz   ${RENK3}#"
echo -e "${RENK3}# ${RENK2}NOT: ${RENK5}Subnet Mask detayıyla beraber giriniz ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK2}Örnek: ${RENK5}2001:abc:1abc:3bc::2/64             ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read tunnelbrokeripv6client
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#          ${RENK2}TunnelBroker Kuruluyor...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sudo modprobe ipv6
sudo ip tunnel add he-ipv6 mode sit remote $tunnelbrokerserveripv4 local $IPV4 ttl 255
sudo ip link set he-ipv6 up
sudo ip addr add $tunnelbrokeripv6client dev he-ipv6
sudo ip route add ::/0 dev he-ipv6
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK2}TunnelBroker Kuruldu.           ${RENK3}#"
echo -e "${RENK3}# ${RENK2}IPv6 Adresiniz: ${RENK5}$(curl -s -6 icanhazip.com)"
echo -e "${RENK3}##############################################${RENK0}"
exit
}

tunnelbrokerkaldir(){
if ! ifconfig | grep -q "he-ipv6"
then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#      ${RENK2}TunnelBroker Zaten Yüklü Değil...     ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
tunnelbrokermenu
fi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#   ${RENK5}Sitedeki 'Client IPv6 Adress'i Giriniz   ${RENK3}#"
echo -e "${RENK3}# ${RENK2}NOT: ${RENK5}Subnet Mask detayıyla beraber giriniz ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK2}Örnek: ${RENK5}2001:abc:1abc:3bc::2/64             ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read tunnelbrokerripv6client
sudo ip route delete ::/0 dev he-ipv6
sudo ip addr del $tunnelbrokerripv6client dev he-ipv6
sudo ip link set he-ipv6 down
sudo ip tunnel del he-ipv6
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#          ${RENK2}TunnelBroker Kaldırıldı.          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
exit
}

tunnelbrokermenu(){
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}TunnelBroker Kur"
echo -e "${RENK2}2)${RENK3}TunnelBroker Kaldır"
echo -e "${RENK2}0)${RENK3}Ana Menüye Dön"
echo -ne "${RENK5}Cevap: ${RENK2}"

read Cevap2
case $Cevap2 in

1)
tunnelbrokerkur
;;
2)
tunnelbrokerkaldir
;;
0)
anamenu
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
}

ipadresiekle(){
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#          ${RENK5}IPv6 Adresinizi giriniz           ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read ipv6adresi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK5}Subnet Mask giriniz             ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read subnetmask
kbadi=`ifconfig | head -n1 | awk ' {print $1;}' | cut -f1 -d ":"`
sed -i "/net.ipv6.conf.all.disable_ipv6.*/d" /etc/sysctl.conf && sysctl -q -p && echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6 && sed -i "s/#//" /etc/netplan/01-netcfg.yaml && netplan generate && netplan apply
ip route add default via fe80::1 dev $kbadi
ip -6 addr add $ipv6adresi::1/$subnetmask dev $kbadi
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#            ${RENK2}IPv6 Adresi Eklendi.            ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
exit
}

anamenu(){
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# CPU Kullanımı:${RENK2} $(top -bn1 | awk '/^%Cpu/ {print $2}')%"
free -m | awk 'NR==2{printf "\033[1;36m# RAM Kullanımı: \033[0;31m%s/%sMB (%.2f%%)\033[0m \n", $3,$2,$3*100/$2 }'
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}Proxy Kur $(if ! [[ $IPV6 =~ [0-9] ]]; then echo -e "${RENK4}(Devre Dışı)"; fi)"
echo -e "${RENK2}2)${RENK3}Proxyleri Başlat $(if ! [[ $IPV6 =~ [0-9] ]]; then echo -e "${RENK4}(Devre Dışı)"; fi)"
echo -e "${RENK2}3)${RENK3}Proxyleri Durdur $(if ! [[ $IPV6 =~ [0-9] ]]; then echo -e "${RENK4}(Devre Dışı)"; fi)"
echo -e "${RENK2}4)${RENK3}Kullanıcı Adı/Şifre İşlemleri"
echo -e "${RENK2}5)${RENK3}TunnelBroker Kur/Kaldır"
echo -e "${RENK2}6)${RENK3}Proxyleri Kontrol Et"
echo -e "${RENK2}7)${RENK3}Manuel IPv6 Adresi Ekle"
echo -e "${RENK2}8)${RENK3}Scripti Sıfırla"
echo -e "${RENK2}0)${RENK3}Çık"
echo -ne "${RENK5}Cevap: ${RENK2}"

read Cevap1
case $Cevap1 in

1)
proxykur
;;
2)
proxybaslat
;;
3)
proxydurdur
;;
4)
kadivesifislemleri
;;
5)
tunnelbrokermenu
;;
6)
proxykontrol
;;
7)
ipadresiekle
;;
8)
scriptsifirla
;;
0)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}Çıkış Yapıldı...              ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
exit
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
}

proxykur(){
clear
if ! [[ $IPV6 =~ [0-9] ]]; then
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
fi
if ! [[ $normal == "2" ]]; then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}Rastgele Modu (Kullanıcı Adı ve Şifre'nin yanına karakterler eklensin.)"
echo -e "${RENK2}2)${RENK3}Sabit Kullanıcı Adı ve Şifre Modu (Kullanıcı Adı ve Şifre Sabit Kalır)"
echo -e "${RENK2}3)${RENK3}Kullanıcı Adı ve Şifre Olmasın (Public Proxy Modu)"
echo -ne "${RENK5}Cevap: ${RENK2}"
read proxyturcevap
case $proxyturcevap in
1)
rastgele="1"
;;
2)
sabitsifre="1"
;;
3)
sifresiz="1"
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}İşlem Seçiniz                ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}Reflesh Modu Olsun (Belirlediğiniz Saniyede Bir Proxylerin IPv6'sı Değişir)"
echo -e "${RENK2}2)${RENK3}Reflesh Modu Olmasın"
echo -ne "${RENK5}Cevap: ${RENK2}"
read refleshcevap
case $refleshcevap in
1)
reflesh="1"
refleshmodulu
;;
2)
reflesh="0"
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#               ${RENK5}Subnet Seçiniz               ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK2}1)${RENK3}64"
echo -e "${RENK2}2)${RENK3}48"
echo -e "${RENK2}3)${RENK3}32"
echo -ne "${RENK5}Cevap: ${RENK2}"
read subnetcevap
case $subnetcevap in
1)
IPV6SUBNET="64"
IPV6=$(echo $IPV6 | cut -f1-4 -d':')
;;
2)
IPV6SUBNET="48"
IPV6=$(echo $IPV6 | cut -f1-3 -d':')
;;
3)
IPV6SUBNET="32"
IPV6=$(echo $IPV6 | cut -f1-2 -d':')
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#      ${RENK5}Kaç tane IPv6 Proxy Oluşturulsun      ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}# ${RENK2}Örnek: ${RENK5}250                                 ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -ne "${RENK5}Cevap: ${RENK2}"
read proxysayisi
if ! [[ $proxysayisi =~ ^[0-9]+$ ]] ; then
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
fi
fi

if ! [[ $zorla == "1" ]]; then
if [ "$proxysayisi" -ge ${MAKSIMUMPROXY} ]; then
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#            ${RENK2}Proxy Sayısı Çok Büyük!             ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Scriptimiz şu anlık bu kadar fazla proxy'i desteklemiyor."
echo -e "${RENK3}# ${RENK2}Scripti geliştirmek için her gün çalışıyorum."
echo -e "${RENK3}# ${RENK2}Ancak şimdilik bir çözüm bulamadım."
echo -e "${RENK3}# ${RENK2}Eğer kuruluma baştan başlamak istiyorsanız ${RENK5}1${RENK2} yazın."
echo -e "${RENK3}# ${RENK2}Eğer kuruluma devam etmek istiyorsanız ${RENK5}0${RENK2} yazın."
echo -e "${RENK3}##################################################${RENK0}"
echo -ne "${RENK5}Cevap: ${RENK2}"
read kullanicicevap
case $kullanicicevap in

1)
proxykur
;;
0)
ok=4
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
fi

if [[ $reflesh == "1" ]]; then
if [ "$proxysayisi" -ge 1001 ]; then
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#            ${RENK2}Proxy Sayısı Çok Büyük!             ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}# ${RENK2}Scriptimiz ${RENK5}Reflesh ${RENK2}modunda bu kadar çok proxyi desteklemiyor."
echo -e "${RENK3}# ${RENK2}Scripti geliştirmek için her gün çalışıyorum."
echo -e "${RENK3}# ${RENK2}Ancak şimdilik bir çözüm bulamadım."
echo -e "${RENK3}# ${RENK2}Eğer kuruluma baştan başlamak istiyorsanız ${RENK5}1${RENK2} yazın."
echo -e "${RENK3}# ${RENK2}Eğer kuruluma devam etmek istiyorsanız ${RENK5}0${RENK2} yazın."
echo -e "${RENK3}##################################################${RENK0}"
echo -ne "${RENK5}Cevap: ${RENK2}"
read kullanicicevap2
case $kullanicicevap2 in

1)
proxykur
;;
0)
ok=5
;;
*)
clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK2}Yanlış Tuşlama Yapıldı...          ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
sleep 3
anamenu
;;
esac
fi
fi

fi

clear
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#              ${RENK2}RiseScript-Proxy              ${RENK3}#"
echo -e "${RENK3}##############################################"
echo -e "${RENK3}#         ${RENK5}Proxyleriniz Üretiliyor...         ${RENK3}#"
echo -e "${RENK3}##############################################${RENK0}"
echo -e "${RENK3}# ${RENK2}Detaylar:"

baslangicsuresi=$(date +%s)
kbadi=`ifconfig | head -n1 | awk ' {print $1;}' | cut -f1 -d ":"`
echo -e "${RENK3}# ${RENK2}• Interface ismi tespit edildi."

cd /home/proxyolusturucu/3proxy/


if [ -f /home/proxyolusturucu/.portsson ]
then

sonport=`sed '1q;d' /home/proxyolusturucu/.portsson`
SON_PORT=$(($sonport + $proxysayisi))
sonporteklenmis=$(($sonport + 1))

if [ -e 3proxy.config ]; then
    i=1
    while [ -e 3proxy.config$i ]; do
        let i++
    done
		configolustur >> /home/proxyolusturucu/3proxy/3proxy.config$i
		yeniconfigadi="3proxy.config$i"
else
		configolustur >> /home/proxyolusturucu/3proxy/3proxy.config
		yeniconfigadi="3proxy.config"
fi
if [ -e ipekle$yeniconfigadi.sh ]; then
    i=1
    while [ -e ipekle$yeniconfigadi$i.sh ]; do
        let i++
    done
		touch /home/proxyolusturucu/3proxy/ipekle$yeniconfigadi$i.sh
		ifconfigadi="ipekle$yeniconfigadi$i.sh"
else
		touch /home/proxyolusturucu/3proxy/ipekle$yeniconfigadi.sh
		ifconfigadi="ipekle$yeniconfigadi.sh"
fi

if [[ $rastgele == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Rastgele kullanıcı adı ve şifre oluşturuluyor..."
elif [[ $sabitsifre == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Sabit kullanıcı adı ve şifreler yazdırılıyor..."
elif [[ $sifresiz == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Proxyler ayar dosyasına yazdırılıyor..."
fi

if [[ $baslangicmodu == "1" ]]; then
sonporteklenmis=$baslangicport
SON_PORT=$(($sonporteklenmis + $proxysayisi))
fi

yazdir() {
			if [[ $rastgele == "1" ]]; then
    seq $sonporteklenmis $SON_PORT | while read port; do
		rastgelekadi1=$(rastgele)
		rastgelesif1=$(rastgele)
		sed -i "9s/$/ ${KULLANICIADI}${rastgelekadi1}:CL:${SIFRE}${rastgelesif1}/" /home/proxyolusturucu/3proxy/$yeniconfigadi
		echo "${IPV4}:${port}:${KULLANICIADI}${rastgelekadi1}:${SIFRE}${rastgelesif1}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
        echo "allow ${KULLANICIADI}${rastgelekadi1}" >> yeniproxyler
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
		echo "flush" >> yeniproxyler
	done
			fi
			if [[ $sabitsifre == "1" ]]; then
			echo "allow ${KULLANICIADI}" >> yeniproxyler
    seq $sonporteklenmis $SON_PORT | while read port; do
		echo "${IPV4}:${port}:${KULLANICIADI}:${SIFRE}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
	done
			fi
			if [[ $sifresiz == "1" ]]; then
	seq $sonporteklenmis $SON_PORT | while read port; do
		echo "${IPV4}:${port}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
	done
			fi
}

yazdir

if [[ $rastgele == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Rastgele kullanıcı adı ve şifre oluşturuldu..."
elif [[ $sabitsifre == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Sabit kullanıcı adı ve şifreler yazdırıldı..."
elif [[ $sifresiz == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Proxyler ayar dosyasına yazdırıldı..."
fi

echo -e "${RENK3}# ${RENK2}• IPv6 adresleri sunucunuza ekleniyor..."

awk -F'-e' '{print $2}' yeniproxyler >> $ifconfigadi
sed -i -e '/ip -6 addr add/! s|^|/usr/sbin/ip -6 addr add |' $ifconfigadi
sed -i -e "\|/${IPV6SUBNET} dev ${kbadi}|! s|$|/${IPV6SUBNET} dev ${kbadi}|" $ifconfigadi

cat yeniproxyler >> /home/proxyolusturucu/3proxy/$yeniconfigadi

sed -i "s@/usr/sbin/ip -6 addr add /${IPV6SUBNET} dev $kbadi@@g" $ifconfigadi
sed -i '/^$/d' $ifconfigadi
cp $ifconfigadi ipcikar$yeniconfigadi.sh
sed -i "s@addr add@addr del@g" ipcikar$yeniconfigadi.sh

if [[ $devmode == "1" ]]; then
bash $ifconfigadi
else
bash $ifconfigadi >/dev/null 2>&1
fi

echo -e "${RENK3}# ${RENK2}• IPv6 adresleri sunucunuza eklendi..."

if [[ $reflesh == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Reflesh modülu aktif ediliyor..."
kurulumaktif="1"
kurulumadevam="1"
refleshmodulu
fi

echo -e "${RENK3}# ${RENK2}• Proxyleriniz oluşturuluyor..."
echo -e "${RENK3}##############################################${RENK0}"
sleep 2
cd /home/proxyolusturucu/3proxy/
rm -rf yeniproxyler
tahminisonuc=$(($sonport + $proxysayisi))
cd /home/proxyolusturucu/
rm -rf .portsson
echo "$tahminisonuc" >> .portsson
cd olusturulanproxyler
if [ ! -f /home/proxyolusturucu/olusturulanproxyler/proxylistesi ]; then
echo -e "-----------------------------" >> proxylistesi
fi
echo -e "Proxy oluşturuldu.
Şifre Modu: $(if [[ $rastgele == "1" ]]; then echo -e "Rastgele"; elif [[ $sabitsifre == "1" ]]; then echo -e "Sabit"; elif [[ $sifresiz == "1" ]]; then echo -e "Şifresiz (Public)"; fi)
Reflesh Modu: $(if [[ $reflesh == "1" ]]; then echo -e "Aktif"; else echo -e "Kapalı"; fi)
Subnet: ${IPV6SUBNET}
Tarih: ${tarihgunayyil} - Saat: ${tarihsaat}
Oluşturulan Proxy Aralığı: ${sonport}-${tahminisonuc}
-----------------------------" >> proxylistesi


else


if [ -e 3proxy.config ]; then
    i=1
    while [ -e 3proxy.config$i ]; do
        let i++
    done
		configolustur >> /home/proxyolusturucu/3proxy/3proxy.config$i
		yeniconfigadi="3proxy.config$i"
else
		configolustur >> /home/proxyolusturucu/3proxy/3proxy.config
		yeniconfigadi="3proxy.config"
fi
if [ -e ipekle$yeniconfigadi.sh ]; then
    i=1
    while [ -e ipekle$yeniconfigadi$i.sh ]; do
        let i++
    done
		touch /home/proxyolusturucu/3proxy/ipekle$yeniconfigadi$i.sh
		ifconfigadi="ipekle$yeniconfigadi$i.sh"
else
		touch /home/proxyolusturucu/3proxy/ipekle$yeniconfigadi.sh
		ifconfigadi="ipekle$yeniconfigadi.sh"
fi


if [[ $rastgele == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Rastgele kullanıcı adı ve şifre oluşturuluyor..."
elif [[ $sabitsifre == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Sabit kullanıcı adı ve şifreler yazdırılıyor..."
elif [[ $sifresiz == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Proxyler ayar dosyasına yazdırılıyor..."
fi

SON_PORT=$(($IPV6_ILK_PORT + $proxysayisi))

if [[ $baslangicmodu == "1" ]]; then
IPV6_ILK_PORT=$baslangicport
SON_PORT=$(($IPV6_ILK_PORT + $proxysayisi))
fi

yazdir() {
			if [[ $rastgele == "1" ]]; then
    seq $IPV6_ILK_PORT $SON_PORT | while read port; do
		rastgelekadi1=$(rastgele)
		rastgelesif1=$(rastgele)
		sed -i "9s/$/ ${KULLANICIADI}${rastgelekadi1}:CL:${SIFRE}${rastgelesif1}/" /home/proxyolusturucu/3proxy/3proxy.config
		echo "${IPV4}:${port}:${KULLANICIADI}${rastgelekadi1}:${SIFRE}${rastgelesif1}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
        echo "allow ${KULLANICIADI}${rastgelekadi1}" >> yeniproxyler
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
		echo "flush" >> yeniproxyler
    done
			fi
			if [[ $sabitsifre == "1" ]]; then
    seq $IPV6_ILK_PORT $SON_PORT | while read port; do
		echo "${IPV4}:${port}:${KULLANICIADI}:${SIFRE}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
	done
			fi
			if [[ $sifresiz == "1" ]]; then
	seq $IPV6_ILK_PORT $SON_PORT | while read port; do
		echo "${IPV4}:${port}" >> /home/proxyolusturucu/.proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
		echo "proxy -6 -n -a -osUSE_TCP_FASTOPEN,TCP_NODELAY -ocUSE_TCP_FASTOPEN,TCP_NODELAY -p$port -i${IPV4} -e$IPV6$(ipv6_olustur)" >> yeniproxyler
	done
			fi	
}

yazdir

if [[ $rastgele == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Rastgele kullanıcı adı ve şifre oluşturuldu..."
elif [[ $sabitsifre == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Sabit kullanıcı adı ve şifreler yazdırıldı..."
elif [[ $sifresiz == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Proxyler ayar dosyasına yazdırıldı..."
fi

echo -e "${RENK3}# ${RENK2}• IPv6 adresleri sunucunuza ekleniyor..."

awk -F'-e' '{print $2}' yeniproxyler >> $ifconfigadi
sed -i -e "s@^@/usr/sbin/ip -6 addr add @" $ifconfigadi
sed -i "s+$+/${IPV6SUBNET} dev ${kbadi}+" $ifconfigadi

cat yeniproxyler >> /home/proxyolusturucu/3proxy/$yeniconfigadi

sed -i "s@/usr/sbin/ip -6 addr add /${IPV6SUBNET} dev $kbadi@@g" $ifconfigadi
sed -i '/^$/d' $ifconfigadi
cp $ifconfigadi ipcikar$yeniconfigadi.sh
sed -i "s@addr add@addr del@g" ipcikar$yeniconfigadi.sh

if [[ $devmode == "1" ]]
then
bash $ifconfigadi
else
bash $ifconfigadi >/dev/null 2>&1
fi

echo -e "${RENK3}# ${RENK2}• IPv6 adresleri sunucunuza eklendi..."

if [[ $reflesh == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Reflesh modülu aktif ediliyor..."
kurulumaktif="1"
kurulumadevam="1"
refleshmodulu
fi

echo -e "${RENK3}# ${RENK2}• Proxyleriniz oluşturuluyor..."
echo -e "${RENK3}##############################################${RENK0}"

cd /home/proxyolusturucu/3proxy/
rm -rf yeniproxyler
tahminisonuc=$(($IPV6_ILK_PORT + $proxysayisi))
cd /home/proxyolusturucu/
echo "$tahminisonuc" >> .portsson
cd olusturulanproxyler
if [ ! -f /home/proxyolusturucu/olusturulanproxyler/proxylistesi ]; then
echo -e "-----------------------------" >> proxylistesi
fi
echo -e "Proxy oluşturuldu.
Şifre Modu: $(if [[ $rastgele == "1" ]]; then echo -e "Rastgele"; elif [[ $sabitsifre == "1" ]]; then echo -e "Sabit"; elif [[ $sifresiz == "1" ]]; then echo -e "Şifresiz (Public)"; fi)
Reflesh Modu: $(if [[ $reflesh == "1" ]]; then echo -e "Aktif"; else echo -e "Kapalı"; fi)
Subnet: ${IPV6SUBNET}
Tarih: ${tarihgunayyil} - Saat: ${tarihsaat}
Oluşturulan Proxy Aralığı: ${IPV6_ILK_PORT}-${tahminisonuc}
-----------------------------" >> proxylistesi
fi

cd /home/proxyolusturucu/
if [[ $dnskullan == "1" ]]; then
sed -i "s@$IPV4@$dnsip@g" .proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
fi

suankiklasorum=$(pwd)
zip --password ${ZIPSIFRESI} proxylist.zip .proxylist.saat--${tarihsaat}__tarih--${tarihgunayyil}.txt
curl --insecure -4 -F "file=@${suankiklasorum}/proxylist.zip" https://file.io >> .fileio-link
bitissuresi=$(date +%s)
clear
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#                ${RENK2}RiseScript-Proxy                ${RENK3}#"
echo -e "${RENK3}##################################################"
echo -e "${RENK3}#             ${RENK2}Proxyleriniz Kuruldu!              ${RENK3}#"
echo -e "${RENK3}##################################################"
if [[ $dnskullan == "1" ]]; then
echo -e "${RENK3}# ${RENK2}• Liste \"${RENK5}DNS:PORT:KULLANICIADI:ŞİFRE${RENK2}\" Formatında Yazdırılıyor..."
else
echo -e "${RENK3}# ${RENK2}• Liste \"${RENK5}IPADRESİ:PORT:KULLANICIADI:ŞİFRE${RENK2}\" Formatında Yazdırılıyor..."
fi
echo -e "${RENK3}# ${RENK2}• Proxy Listesi File.IO Sitesine Yüklenmiştir."
echo -e "${RENK3}# ${RENK2}• Link: ${RENK5}$(sed -n 's/.*"link":"\([^"]*\)".*/\1/p' .fileio-link)"
echo -e "${RENK3}# ${RENK2}• Zip Şifresi: ${RENK5}${ZIPSIFRESI}"
echo -e "${RENK3}# ${RENK2}• Kurulum Süresi: ${RENK5}$(($bitissuresi-$baslangicsuresi)) Saniye"
echo -e "${RENK3}##################################################${RENK0}"
rm -rf .fileio-link
rm -rf .proxy*
rm -rf proxylist.zip
cd /home/proxyolusturucu/3proxy/
3proxy $yeniconfigadi
exit
}

parametrelistesi(){
echo -e "${RENK3}Parametre Listesi:${RENK0}"
echo -e "--proxykur     : Proxy Kurar."
echo -e "--f|--zorla    : Maksimum proxy sayısını görmezden gelir."
echo -e "--dns          : Proxylerin liste çıktısında sunucunuzun IPv4 adresi yerine belirlediğiniz DNS adresi yazar."
echo -e "--reflesh      : Belirlediğiniz her saniyede bir reflesh modu aktifken kurduğunuz proxylerin IPv6 adresleri değişir."
echo -e "--proxykontrol : Yanına belirttiğiniz proxy listesine sahip dosya ile proxylerinizi kontrol edebilirsiniz."
echo -e "--baslangic    : Belirlediğiniz sayıdan başlayarak proxy üretmeye başlar."
}

if [ $# -eq 0 ]; then
normal=1
else
while [[ $# -gt 0 ]]; do
  case $1 in
    --proxykur|-proxykur)
      if ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo -e "${RENK2}Hata: ${RENK0}proxykur parametresi bir sayı içermelidir." >&2
		parametrelistesi
        exit 1
      fi
      proxysayisi="$2"
      shift
      ;;
    --subnet|-subnet)
	  subnet="$2"
      #if [[ "$2" != "64" && "$2" != "48" && "$2" != "36" && "$2" != "32" ]]; then
	  if [[ "$subnet" != "64" && "$subnet" != "48" && "$subnet" != "32" ]]; then
        #echo "${RENK2}Hata: ${RENK0}subnet parametresi [64,48,36,32] sayılarından birisi olmalıdır." >&2
		echo -e "${RENK2}Hata: ${RENK0}subnet parametresi [64,48,32] sayılarından birisi olmalıdır." >&2
		parametrelistesi
        exit 1
      fi
      IPV6SUBNET="$2"
	  if [[ $IPV6SUBNET == "64" ]]; then
	  IPV6=$(echo $IPV6 | cut -f1-4 -d':')
	  elif [[ $IPV6SUBNET == "48" ]]; then
	  IPV6=$(echo $IPV6 | cut -f1-3 -d':')
	  elif [[ $IPV6SUBNET == "32" ]]; then
	  IPV6=$(echo $IPV6 | cut -f1-2 -d':')
	  fi
      shift
      ;;
    --rastgele|-rastgele)
      rastgele="1"
	  unset KULLANICIADI
	  unset SIFRE
	  KULLANICIADI="$2"
	  SIFRE="$3"
      ;;
    --sabitsifre|-sabitsifre)
	  sabitsifre="1"
	  unset KULLANICIADI
	  unset SIFRE
	  KULLANICIADI="$2"
	  SIFRE="$3"
	  ;;
    --sifresiz|sifresiz)
	  sifresiz="1"
	  ;;
    --f|-f|--zorla|-zorla)
	zorla="1"
	  ;;
	--dns|-dns)
	if [[ "$2" == "" ]]; then
	echo -e "${RENK2}Hata : ${RENK0}dns parametresi boş bırakılamaz. Yanına bir DNS adresi girilmelidir."
	echo -e "${RENK5}Örnek: ${RENK0}bash $scadi --dns proxy.risescript.net"
	exit
	fi
	dnskullan="1"
	dnsip="$2"
	  ;;
	--reflesh|-reflesh)
	if [[ "$2" == "" ]]; then
	echo -e "${RENK2}Hata : ${RENK0}reflesh parametresi boş bırakılamaz. Yanına saniye cinsinden süre girilmelidir."
	echo -e "${RENK5}Örnek: ${RENK0}bash $scadi --reflesh 300"
	exit
	fi
	reflesh="1"
	refleshsaniye="$2"
	  ;;
	--proxykontrol|-proxykontol)
	if [[ "$2" == "" ]]; then
	echo -e "${RENK2}Hata : ${RENK0}proxykontrol parametresi boş bırakılamaz. Yanına kontrol edilecek proxylerin listesinin dosya konumu girilmelidir."
	echo -e "${RENK2}Hata : ${RENK0}Proxy listesinin formatı şu şekilde olmalıdır: IPV4:PORT:KULLANICIADI:ŞİFRE"
	echo -e "${RENK5}Örnek: ${RENK0}bash $scadi --proxykontrol /root/proxylistesi.txt"
	exit
	fi
	dosyakonumu="$2"
	normal="2"
	if [ ! -f $dosyakonumu ]; then
	echo -e "${RENK2}Hata : ${RENK0}Dosya bulunamadı. Dosya konumu yanlış girilmiş olabilir..."
	echo -e "${RENK5}Örnek: ${RENK0}bash $scadi --proxykontrol /root/proxylistesi.txt"
	exit
	fi
	proxykontrol
	  ;;
	--baslangic|-baslangic)
	if [[ "$2" == "" ]]; then
	echo -e "${RENK2}Hata : ${RENK0}baslangic parametresi boş bırakılamaz. Yanına başlangıç portu girilmelidir."
	echo -e "${RENK5}Örnek: ${RENK0}bash $scadi --baslangic 3000"
	exit
	fi
	baslangicmodu="1"
	baslangicport="$2"
	  ;;
    -*|--*)
      echo -e "${RENK2}Hata: ${RENK0}Bilinmeyen parametre kullandınız: $1"
	  parametrelistesi
      exit 1
      ;;
  esac
  shift
done


if [[ $rastgele == "1" && $sabitsifre == "1" ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Sadece bir tane parametreyi aynı anda kullanabilirsiniz: [--rastgele|--sabitsifre|--sifresiz]" >&2
  exit 1
fi

if [[ $rastgele == "1" && $sifresiz == "1" ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Sadece bir tane parametreyi aynı anda kullanabilirsiniz: [--rastgele|--sabitsifre|--sifresiz]" >&2
  exit 1
fi

if [[ $sabitsifre == "1" && $sifresiz == "1" ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Sadece bir tane parametreyi aynı anda kullanabilirsiniz: [--rastgele|--sabitsifre|--sifresiz]" >&2
  exit 1
fi

if [[ $rastgele == "1" && -z $KULLANICIADI || -z $SIFRE ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Parametreler yanlış kullanıldı. \n${RENK5}Olması Gereken Kullanım: \n${RENK0}bash $scadi --proxykur PROXYSAYISI --subnet SUBNET --[rastgele KULLANICIADI SIFRE|sabitsifre KULLANICIADI SIFRE|sifresiz]" >&2
  exit 1
fi

if [[ $sabitsifre == "1" && -z $KULLANICIADI || -z $SIFRE ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Parametreler yanlış kullanıldı. \n${RENK5}Olması Gereken Kullanım: \n${RENK0}bash $scadi --proxykur PROXYSAYISI --subnet SUBNET --[rastgele KULLANICIADI SIFRE|sabitsifre KULLANICIADI SIFRE|sifresiz]" >&2
  exit 1
fi

if [[ -z $proxysayisi || -z $subnet ]]; then
  echo -e "${RENK2}Hata: ${RENK0}Parametreler yanlış kullanıldı. \n${RENK5}Olması Gereken Kullanım: \n${RENK0}bash $scadi --proxykur PROXYSAYISI --subnet SUBNET --[rastgele KULLANICIADI SIFRE|sabitsifre KULLANICIADI SIFRE|sifresiz]" >&2
  exit 1
fi
normal=2
proxykur
fi
anamenu
