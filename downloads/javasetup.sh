#!/bin/bash

set -e

echo "Brolve - Java Kurma Betigi"
echo "Bu betik Brolve Devs. tarafindan musteriler icin hazirlanmistir."
echo "Devam etmek icin ENTER tusuna basiniz."
read -r
clear

# Kullanýcýdan Java sürümünü alma
echo "Hangi Java surumunu indirmek istiyorsunuz? (Ornek: 17, 21)"
read -r JAVA_VERSION

# Eclipse Adoptium'dan indirme URL'si oluþturma
JAVA_URL="https://api.adoptium.net/v3/binary/latest/${JAVA_VERSION}/ga/linux/x64/jdk/hotspot/normal/eclipse"
JAVA_INSTALLER="OpenJDK-${JAVA_VERSION}-linux-x64.tar.gz"

# Java'yý indirme
echo "Java indiriliyor..."
curl -o "$JAVA_INSTALLER" "$JAVA_URL"
if [ $? -ne 0 ]; then
    echo "Java indirilemedi. Lutfen surumu kontrol edin veya internet baglantinizi kontrol edin."
    exit 1
fi

# Java'yý yükleme
echo "Java kuruluyor..."
tar -xvzf "$JAVA_INSTALLER" -C /opt

# PATH deðiþkenine ekleme
JAVA_DIR=$(tar -tf "$JAVA_INSTALLER" | head -n 1 | cut -d'/' -f1)
export PATH="/opt/${JAVA_DIR}/bin:$PATH"
echo "export PATH=/opt/${JAVA_DIR}/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

# Yükleme dosyasýný silme
echo "Gereksiz dosyalar siliniyor..."
rm "$JAVA_INSTALLER"

# Kurulumun baþarýyla tamamlandýðýný kontrol etme
if java -version; then
    echo "Java basariyla kuruldu!"
else
    echo "Java kurulumu basarisiz."
    exit 1
fi
