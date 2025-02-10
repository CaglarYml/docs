#!/bin/bash

set -e

echo "Brolve - PaperMC Sunucu Kurulum Betiði"
echo "Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir."
echo "Devam etmek icin ENTER tusuna basin."
read -p "Devam etmek icin ENTER tusuna basin."
clear

# Java Kurulumu
bash -c "$0 java_installer"

# Kullanýcýdan PaperMC sürüm ve build numarasý alma
echo "Lutfen PaperMC surumunu girin (Ornek: 1.8.8, 1.16.5, 1.17.1, 1.18.2, 1.19.4, 1.20.6, 1.21.4)"
read -p "Surum: " PAPER_VERSION
echo "Lutfen bu surum icin build numarasini girin (Ornek: 445, 794, 411, 388, 550, 151, 114)"
read -p "Build Numarasi: " BUILD_NUMBER

# PaperMC URL oluþturma
PAPER_URL="https://papermc.io/api/v2/projects/paper/versions/$PAPER_VERSION/builds/$BUILD_NUMBER/downloads/paper-$PAPER_VERSION-$BUILD_NUMBER.jar"

# Server klasörü oluþturma
mkdir -p ~/Server
cd ~/Server

# PaperMC indirme
echo "PaperMC indiriliyor..."
curl -o server.jar "$PAPER_URL"

# eula.txt dosyasý oluþturma
echo "eula=true" > eula.txt

echo "Kurulum tamamlandi. Sunucunun tam kurulumu icin lutfen https://docs.brolve.com/oyun-sunucu/minecraft-java/sunucu-kurulum adresini ziyaret edin."

exit 0

# Java yükleme fonksiyonu
if [ "$1" == "java_installer" ]; then
    echo "Java Kurma Betiði"
    echo "Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir."
    read -p "Hangi Java surumunu indirmek istiyorsunuz? (Ornek: 17) " JAVA_VERSION

    JAVA_URL="https://api.adoptium.net/v3/binary/latest/$JAVA_VERSION/ga/linux/x64/jdk/hotspot/normal/eclipse"
    JAVA_INSTALLER="OpenJDK-$JAVA_VERSION-linux-x64.tar.gz"

    echo "Java indiriliyor..."
    curl -o "$JAVA_INSTALLER" "$JAVA_URL"

    tar -xzf "$JAVA_INSTALLER" -C /opt
    JAVA_DIR=$(tar -tzf "$JAVA_INSTALLER" | head -1 | cut -f1 -d"/")

    echo "PATH degiskeni guncelleniyor..."
    echo "export PATH=/opt/$JAVA_DIR/bin:\$PATH" >> ~/.bashrc
    source ~/.bashrc

    java -version
    echo "Java basariyla kuruldu!"
    exit 0
fi

