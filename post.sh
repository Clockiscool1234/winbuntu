#!/bin/bash
time1="$( date +"%r" )"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Installing the nessesary programs, please wait...\n\e[0m"
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
apt-get -qq install xfce4 xfce4-goodies software-properties-common tigervnc-standalone-server wget -y
add-apt-get-repository -y ppa:mozillateam
apt-get install firefox-esr -y > /dev/null
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Configuring VNC server...\n\e[0m"
mkdir -p .vnc
echo "startxfce4" >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
echo "127.0.0.1 localhost.localdomain  localhost" > /etc/hosts
vncserver :0
vncserver --kill :0
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Success!\n\e[0m"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Creating config files, please wait...\n\e[0m"
mkdir ~/.config
wget https://raw.githubusercontent.com/Clockiscool1234/winbuntu/main/Windows-10.jpg -q
wget https://github.com/Clockiscool1234/winbuntu/raw/main/conf.tar.gz -q
wget https://github.com/Clockiscool1234/winbuntu/raw/main/icon.tar.gz -q
wget https://github.com/Clockiscool1234/winbuntu/raw/main/theme.tar.gz -q
mv Windows-10.jpg /usr/share/backgrounds/
tar -xf conf.tar.gz -C ~/.config/
tar -xf icon.tar.gz -C /usr/share/icons/
tar -xf theme.tar.gz -C /usr/share/themes/
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Success!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Cleaning up, please wait...\n"
rm conf.tar.gz icon.tar.gz theme.tar.gz
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Success!\n"
#printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m The post-installation has been completed! You can now launch Desktop Enviroment using \"vncserver :0\" "
