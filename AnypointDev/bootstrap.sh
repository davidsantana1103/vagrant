#!/usr/bin/env bash

#Cleaning apt-get
apt-get autoremove
apt-get clean all 
apt-get autoclean all
#Updating and upgrading Ubuntu packages
# sudo sh -c "echo 'Acquire::Retries=10;' >> /etc/apt/apt.conf.d/70debconf"
# sudo sh -c "echo 'Acquire::http::Timeout \"300\";' >> /etc/apt/apt.conf.d/70debconf"
# sudo sh -c "echo 'Acquire::ftp::Timeout \"300\";' >> /etc/apt/apt.conf.d/70debconf" 
sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo touch /etc/apt/sources.list
###### Ubuntu Main Repos
sudo sh -c "echo 'deb http://ca.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb-src http://ca.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list"
###### Ubuntu Update Repos
sudo sh -c "echo 'deb http://ca.archive.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb http://ca.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb-src http://ca.archive.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb-src http://ca.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list"

apt-get update
apt-get upgrade
#Install virtualbox quest additions packages
apt-get -y install dkms
apt-get -y install dkms
apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
apt-get -y install swapspace
apt-get -y install swapspace

#Install lubuntu (lxde) GUI
apt-get -y install --no-install-recommends lubuntu-desktop
apt-get -y install --no-install-recommends lubuntu-desktop
apt-get -y autoremove
apt-get -y autoremove
apt-get -y remove light-locker

#Install JDK8
apt-add-repository -y ppa:webupd8team/java
apt-get update
#In order to accept the agreement silently, install python properties
apt-get install -y python-software-properties
apt-get install -y python-software-properties
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get -y install oracle-java8-installer
#Setting Java path in environment
sudo sh -c "echo 'JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /etc/environment"

apt-get -y install maven
apt-get -y install maven
apt-get -y install git
apt-get -y install git
#maven settings pending to copy provided file
#sudo mv settings.xml settings.xml.old
#GTK is prerequisite for AnypointStudio
apt-get -y install gtk2.0
apt-get -y install gtk2.0
#Downloading and installing AnypointStudio
wget http://mule-studio.s3.amazonaws.com/6.5.0-GA/AnypointStudio-for-linux-64bit-6.5.0-201806071907.tar.gz -O AnypointStudio-for-linux-64bit.tar.gz
sudo tar -xzf AnypointStudio-for-linux-64bit.tar.gz -C /opt
rm -f AnypointStudio-for-linux-64bit.tar.gz
sudo ln -s /opt/AnypointStudio/AnypointStudio /usr/bin/AnypointStudio
sudo ln -s /opt/AnypointStudio/AnypointStudio /usr/bin/anypointstudio

#Downloading and installing Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
#Creating desktop shortcut for Postman
sudo touch /home/vagrant/Desktop/Postman
sudo echo "[Desktop Entry]" >> /home/vagrant/Desktop/Postman
sudo echo "Name=Postman" >> /home/vagrant/Desktop/Postman
sudo echo "Exec=/opt/Postman/Postman" >> /home/vagrant/Desktop/Postman
sudo echo "Icon=/opt/Postman/app/resources/app/assets/icon.png" >> /home/vagrant/Desktop/Postman
sudo echo "Terminal=false" >> /home/vagrant/Desktop/Postman
sudo echo "Type=Application" >> /home/vagrant/Desktop/Postman
#Creating desktop shortcut for AnypointStudio
sudo touch /home/vagrant/Desktop/AnypointStudio
sudo echo "[Desktop Entry]" >> /home/vagrant/Desktop/AnypointStudio
sudo echo "Name=Anypoint Studio" >> /home/vagrant/Desktop/AnypointStudio
sudo echo "Exec=/opt/AnypointStudio/AnypointStudio" >> /home/vagrant/Desktop/AnypointStudio
sudo echo "Icon=/opt/AnypointStudio/icon.xpm" >> /home/vagrant/Desktop/AnypointStudio
sudo echo "Terminal=false" >> /home/vagrant/Desktop/AnypointStudio
sudo echo "Type=Application" >> /home/vagrant/Desktop/AnypointStudio
sudo reboot